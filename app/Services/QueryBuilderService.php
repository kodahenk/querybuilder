<?php

namespace App\Services;

use PDO;
use Exception;

class QueryBuilderService
{
    protected $pdo;
    protected $query;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function buildQuery($request)
    {
        try {
            $table = $request['table'];
            $select = $request['select'];
            $limit = $request['limit'];
            $page = $request['page'];
            $relations = json_decode($request['relations'], true);
            $format = $request['format'];

            // Initialize the query
            $sql = "SELECT {$select} FROM {$table}";

            // Apply conditions
            if (isset($request['conditions'])) {
                $conditions = json_decode($request['conditions'], true);
                if ($conditions) {
                    $conditionStrings = array_map(function ($condition) {
                        return "{$condition['field']} {$condition['operator']} :{$condition['field']}";
                    }, $conditions);
                    $sql .= " WHERE " . implode(' AND ', $conditionStrings);
                }
            }

            // Apply limit and pagination
            if ($limit) {
                $sql .= " LIMIT :limit OFFSET :offset";
            }

            $stmt = $this->pdo->prepare($sql);

            // Bind parameters for conditions
            if (isset($request['conditions'])) {
                foreach ($conditions as $condition) {
                    $stmt->bindValue(":{$condition['field']}", $condition['value']);
                }
            }

            // Bind parameters for pagination
            if ($limit) {
                $stmt->bindValue(':limit', (int) $limit, PDO::PARAM_INT);
                $stmt->bindValue(':offset', ($page - 1) * $limit, PDO::PARAM_INT);
            }

            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Handle relations if any
            if ($relations) {
                // Example: Add logic to handle relations and conditions
            }

            // Return results in specified format
            return $this->formatResults($results, $format);
        } catch (Exception $e) {
            throw new Exception('Query Error: ' . $e->getMessage());
        }
    }

    protected function formatResults($results, $format)
    {
        if ($format === 'json') {
            return json_encode($results);
        } elseif ($format === 'xml') {
            $xml = new \SimpleXMLElement('<root/>');
            array_walk_recursive($results, function ($value, $key) use ($xml) {
                $xml->addChild($key, $value);
            });
            return $xml->asXML();
        }

        return json_encode($results);
    }
}
