<?php

namespace App\Services;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class QueryBuilderService
{
    protected $model;
    protected $query;

    public function buildQuery(Request $request)
    {
        // Get URL parameters
        $table = $request->input('table');
        $select = $request->input('select');
        $limit = $request->input('limit');
        $page = $request->input('page');

        // Get JSON body parameters
        $conditions = $request->input('conditions', []);
        $relations = $request->input('relations', []);
        $condition_logic = $request->input('condition_logic', null);
        $format = $request->input('format', 'json');

        // Initialize model and query based on the table parameter
        $this->initializeModel($table);

        // Apply select clause
        $this->applySelect($select);

        // Apply conditions
        $this->applyConditions($conditions, $condition_logic);

        // Apply dynamic where conditions from body
        $this->applyDynamicWhere($request->all());

        // Apply relations and their conditions
        $this->applyRelations($relations);

        // Apply limit and pagination
        $this->applyLimitAndPagination($limit, $page);

        // Execute query and get results
        $results = $this->query->get();
        
        // Log the SQL query
        Log::info('SQL Query', ['query' => $this->query->toSql(), 'bindings' => $this->query->getBindings()]);

        // Return results in specified format
        return $this->formatResults($results, $format);
    }

    protected function initializeModel($table)
    {
        // Map table names to model classes
        $modelMapping = [
            'posts' => \App\Models\Post::class,
            'users' => \App\Models\User::class,
            "categories" => \App\Models\Category::class,
            "tags" => \App\Models\Tag::class,
            "comments" => \App\Models\Comment::class,
            "likes" => \App\Models\Like::class,
            // Add other table-model mappings here
        ];

        if (array_key_exists($table, $modelMapping)) {
            $this->model = new $modelMapping[$table];
            $this->query = $this->model->newQuery();
        } else {
            throw new \Exception("Model for table {$table} not found.");
        }
    }

    protected function applySelect($select)
    {
        if ($select) {
            $this->query->select(explode(',', $select));
        }
    }

    protected function applyConditions($conditions, $condition_logic)
    {
        if ($conditions) {
            $conditionGroups = [];
            $currentGroup = [];
            $operator = 'and';

            foreach ($conditions as $condition) {
                if (isset($condition['group']) && $condition['group']) {
                    if ($currentGroup) {
                        $conditionGroups[] = [$operator => $currentGroup];
                        $currentGroup = [];
                    }
                    $operator = $condition['group'];
                } else {
                    $currentGroup[] = [
                        'field' => $condition['field'],
                        'operator' => $condition['operator'],
                        'value' => $condition['value']
                    ];
                }
            }
            if ($currentGroup) {
                $conditionGroups[] = [$operator => $currentGroup];
            }

            $this->applyConditionGroups($conditionGroups, $condition_logic);
        }
    }

    protected function applyConditionGroups($conditionGroups, $condition_logic)
    {
        foreach ($conditionGroups as $group) {
            foreach ($group as $operator => $conditions) {
                $queryMethod = $operator === 'and' ? 'where' : 'orWhere';
                $this->query->$queryMethod(function ($query) use ($conditions) {
                    foreach ($conditions as $condition) {
                        $query->where($condition['field'], $condition['operator'], $condition['value']);
                    }
                });
            }
        }
    }

    protected function applyDynamicWhere($data)
    {
        foreach ($data as $key => $value) {
            if (strpos($key, 'where__') === 0) {
                $field = substr($key, 7);
                $this->query->where($field, $value);
            }
        }
    }

    protected function applyRelations($relations)
    {
        if (is_array($relations)) {
            foreach ($relations as $relation => $relationDetails) {
                $this->query->with([$relation => function ($query) use ($relationDetails) {
                    if (isset($relationDetails['select'])) {
                        $query->select(explode(',', $relationDetails['select']));
                    }
                    if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                        foreach ($relationDetails['conditions'] as $condition) {
                            $query->where($condition['field'], $condition['operator'], $condition['value']);
                        }
                    }
                    if (isset($relationDetails['order_by']) && isset($relationDetails['order_direction'])) {
                        $query->orderBy($relationDetails['order_by'], $relationDetails['order_direction']);
                    }
                    if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                        $this->applyRelationsToQuery($query, $relationDetails['relations']);
                    }
                    // Apply dynamic where conditions for nested relations
                    foreach ($relationDetails as $key => $value) {
                        if (strpos($key, 'where__') === 0) {
                            $field = substr($key, 7);
                            $query->where($field, $value);
                        }
                    }
                }]);
            }
        }
    }

    protected function applyRelationsToQuery($query, $relations)
    {
        foreach ($relations as $relation => $relationDetails) {
            $query->with([$relation => function ($query) use ($relationDetails) {
                if (isset($relationDetails['select'])) {
                    $query->select(explode(',', $relationDetails['select']));
                }
                if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                    foreach ($relationDetails['conditions'] as $condition) {
                        $query->where($condition['field'], $condition['operator'], $condition['value']);
                    }
                }
                if (isset($relationDetails['order_by']) && isset($relationDetails['order_direction'])) {
                    $query->orderBy($relationDetails['order_by'], $relationDetails['order_direction']);
                }
                if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                    $this->applyRelationsToQuery($query, $relationDetails['relations']);
                }
                // Apply dynamic where conditions for nested relations
                foreach ($relationDetails as $key => $value) {
                    if (strpos($key, 'where__') === 0) {
                        $field = substr($key, 7);
                        $query->where($field, $value);
                    }
                }
            }]);
        }
    }

    protected function applyLimitAndPagination($limit, $page)
    {
        if ($limit) {
            $this->query->limit($limit);
        }

        if ($page) {
            $this->query->offset(($page - 1) * $limit);
        }
    }

    protected function formatResults($results, $format)
    {
        if ($format === 'json') {
            return response()->json($results);
        } elseif ($format === 'xml') {
            $xml = new \SimpleXMLElement('<root/>');
            array_walk_recursive($results->toArray(), array($xml, 'addChild'));
            return response($xml->asXML(), 200)->header('Content-Type', 'text/xml');
        }

        return $results;
    }
}
