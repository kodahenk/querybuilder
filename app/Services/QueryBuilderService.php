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
            $arrConditions = json_decode($params['conditions'], true);
            $this->applyConditions($arrConditions);
        }

        // Select specific columns
        if (isset($params['select'])) {
            $selectColumns = is_string($params['select']) ? explode(',', $params['select']) : $params['select'];
            $this->query->select($selectColumns);
        }

        // Apply pagination
        if (isset($params['limit'])) {
            $this->query->limit($params['limit']);
        }

        if (isset($params['page'])) {
            $page = $params['page'];
            $perPage = $params['limit'] ?? 15; // Default perPage if not provided
            $this->query->offset(($page - 1) * $perPage);
        }

        // Eager load relations if provided
        if (isset($params['relations'])) {
            $arr = json_decode($params['relations'], true);
            $this->applyRelations($arr);
        }
    }

    private function getModelForTable(string $table)
    {
        $models = [
            'posts' => \App\Models\Post::class,
            'users' => \App\Models\User::class,
            'categories' => \App\Models\Category::class,
            // Add more mappings as needed
        ];
    
        if (!array_key_exists($table, $models)) {
            throw new \Exception("Model mapping for table $table is not defined.");
        }
    
        return $models[$table];
    }

    private function applyConditions(array $conditions)
    {
        foreach ($conditions as $condition) {
            $field = $condition['field'];
            $operator = $condition['operator'] ?? '=';
            $value = $condition['value'];

            $this->query->where($field, $operator, $value);
        }
    }

    private function applyRelations(array $relations)
    {
        foreach ($relations as $relation => $details) {
            $this->query->with([$relation => function ($q) use ($details) {
                if (isset($details['conditions'])) {
                    $this->applyConditions($details['conditions']);
                }
                if (isset($details['relations'])) {
                    $this->applyRelations($details['relations']);
                }
            }]);
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

    public function toSql()
    {
        return $this->query->toSql();
    }
}
