<?php

namespace App\Services;

use DB;
use SimpleXMLElement;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Eloquent\Builder;

class QueryBuilderService
{
    protected $query;
    protected $format;

    public function buildQuery(array $params)
    {
        $this->parseQueryString($params);

        return $this;
    }

    private function parseQueryString(array $params)
    {
        dd($params);
        // Check if table is provided in params
        if (!isset($params['table'])) {
            throw new \Exception("Table name is required.");
        }

        $table = $params['table'];
        $model = $this->getModelForTable($table);

        if (!$model) {
            throw new \Exception("Model for table $table does not exist.");
        }

        // Start with the base query
        $this->query = $model::query();

        // Apply conditions
        if (isset($params['conditions'])) {

           $this->applyConditions($params['conditions']);
        }

        // Select specific columns
        if (isset($params['select'])) {
            $selectColumns = is_string($params['select']) ? explode(',', $params['select']) : $params['select'];
            $this->query->select($selectColumns);
        }

        // Paginate
        if (isset($params['limit'])) {
            $this->query->limit($params['limit']);
        }

        // Apply pagination
        if (isset($params['page'])) {
            $page = $params['page'];
            $perPage = $params['limit'] ?? 15; // Default perPage if not provided
            $this->query->offset(($page - 1) * $perPage)->limit($perPage);
        }

        // Eager load relations if provided
        if (isset($params['relations'])) {
            $arr = json_decode($params['relations'], true);
            //$arr = json_decode(json_encode($params['relations'],true));

            $this->applyRelations($arr);
        }
    }
    private function getModelForTable(string $table)
    {
        // You need to define a way to map table names to models
        $models = [
            'posts' => \App\Models\Post::class,
            'users' => \App\Models\User::class,
            'post_tags' => \App\Models\PostTag::class,
            // Add more mappings as needed
        ];

        return $models[$table] ?? null;
    }
    private function initQuery(string $table)
    {
        // Check if table exists
        if (!Schema::hasTable($table)) {
            throw new \Exception("Table $table does not exist.");
        }

        return DB::table($table);
    }

    private function applyConditions(array $conditions)
    {
        foreach ($conditions as $condition) {
            // Assuming $condition is an associative array with 'field', 'operator', 'value'
            $this->query->where($condition['field'], $condition['operator'], $condition['value']);
        }
    }

    private function applyRelations(array $relations)
    {

        foreach ($relations as $relation => $details) {
            if (is_string($details)) {
                // If details is a string, it's just the relation name
                $this->query->with($details);
            } else {
                // If details is an array, we have conditions or nested relations
                $this->query->with([$relation => function($q) use ($details) {
                    if (isset($details['conditions'])) {
                      $this->applyConditions($details['conditions']);
                    }
                    if (isset($details['relations'])) {
                        $this->applyRelations($details['relations']);
                    }
                }]);
            }
        }
    }

    public function toJson()
    {
        return $this->query->get()->toJson();
    }

    public function toXml()
    {
        $results = $this->query->get();
        return $this->convertToXml($results);
    }

    private function convertToXml($data)
    {
        $xml = new SimpleXMLElement('<root/>');
        foreach ($data as $item) {
            $itemArray = (array) $item;
            $itemXml = $xml->addChild(Str::singular($item->getTable()));
            $this->arrayToXml($itemArray, $itemXml);
        }
        return $xml->asXML();
    }

    private function arrayToXml(array $data, SimpleXMLElement $xml)
    {
        foreach ($data as $key => $value) {
            if (is_array($value)) {
                $subnode = $xml->addChild($key);
                $this->arrayToXml($value, $subnode);
            } else {
                $xml->addChild("$key", htmlspecialchars("$value"));
            }
        }
    }
}
