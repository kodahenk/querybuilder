<?php

namespace App\Services;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class QueryBuilderService
{
    protected $model;
    protected $query;

    public function buildQuery(Request $request)
    {
        // Initialize model and query based on the table parameter
        $this->initializeModel($request->input('table'));

        // Apply select clause
        $this->applySelect($request->input('select'));

        // Apply conditions
        $this->applyConditions($this->query,$request->input('conditions'));

        // Apply relations and their conditions
        $relations = $request->input('relations');
        if ($relations) {
            $relations = json_decode($relations, true);
        }
        $this->applyRelations($relations);

        // Apply limit and pagination
        $this->applyLimitAndPagination($request->input('limit'), $request->input('page'));

        // Execute query and get results
        $results = $this->query->get();

        // Filter out results where 'user' is null if 'user' relation is requested
        if (isset($relations['user'])) {
            $results = $results->filter(function ($item) {
                return !is_null($item->user);
            });
        }

        // Return results in specified format
        return $this->formatResults($results, $request->input('format'));
    }


    protected function initializeModel($table)
    {
        // Map table names to model classes
        $modelMapping = [
            'posts' => \App\Models\Post::class,
            'users' => \App\Models\User::class,
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



    protected function applyRelations($relations)
    {
        if (is_array($relations)) {
            foreach ($relations as $relation => $relationDetails) {
                $this->query->with([$relation => function ($query) use ($relationDetails) {
                    if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                        $this->applyConditions($query, $relationDetails['conditions'], $relationDetails['condition_logic'] ?? null);
                    }
                    if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                        $this->applyRelationsToQuery($query, $relationDetails['relations']);
                    }
                }]);
            }
        }
    }

    protected function applyRelationsToQuery($query, $relations)
    {
        foreach ($relations as $relation => $relationDetails) {
            $query->with([$relation => function ($query) use ($relationDetails) {
                if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                    $this->applyConditions($query, $relationDetails['conditions'], $relationDetails['condition_logic'] ?? null);
                }
                if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                    $this->applyRelationsToQuery($query, $relationDetails['relations']);
                }
            }]);
        }
    }

    protected function applyConditions($query, $conditions, $conditionLogic = null)
    {
        if ($conditionLogic) {
            $logic = $this->parseConditionLogic($conditionLogic);
            foreach ($logic as $logicItem) {
                $condition = $this->findConditionByName($conditions, $logicItem['name']);
                if ($condition) {
                    if ($logicItem['type'] === 'or') {
                        $query->orWhere($condition['field'], $condition['operator'], $condition['value']);
                    } else {
                        $query->where($condition['field'], $condition['operator'], $condition['value']);
                    }
                }
            }
        } else {
            foreach ($conditions as $condition) {
                $query->where($condition['field'], $condition['operator'], $condition['value']);
            }
        }
    }

    protected function parseConditionLogic($conditionLogic)
    {
        // Parse the condition logic string into an array of conditions with their types (and/or)
        $logic = [];
        preg_match_all('/(\(|\)|\w+|\s+|and|or)/i', $conditionLogic, $matches);
        $tokens = $matches[0];
        $currentType = 'and';
        foreach ($tokens as $token) {
            $token = trim($token);
            if (strtolower($token) === 'and' || strtolower($token) === 'or') {
                $currentType = strtolower($token);
            } elseif (!empty($token) && $token !== '(' && $token !== ')') {
                $logic[] = ['name' => $token, 'type' => $currentType];
            }
        }
        return $logic;
    }

    protected function findConditionByName($conditions, $name)
    {
        foreach ($conditions as $condition) {
            if ($condition['name'] === $name) {
                return $condition;
            }
        }
        return null;
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
