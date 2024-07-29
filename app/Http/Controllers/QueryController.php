<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\QueryBuilderService;
use Exception;
use PDO;

class QueryController extends Controller
{
    protected $queryBuilderService;

    public function __construct()
    {
        $dsn = 'mysql:host=127.0.0.1;dbname=devorhan';
        $username = 'root';
        $password = '';

        try {
            $pdo = new PDO($dsn, $username, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $this->queryBuilderService = new QueryBuilderService($pdo);
        } catch (Exception $e) {
            echo 'Database Connection Error: ' . $e->getMessage();
            exit;
        }
    }

    public function index(Request $request)
    {
        try {
            // Simulate a request
            $queryParams = [
                'table' => $request->input('table', 'posts'),
                'select' => $request->input('select', 'id,title,content'),
                'limit' => $request->input('limit', 10),
                'page' => $request->input('page', 1),
                'relations' => $request->input('relations', json_encode([])),
                'format' => $request->input('format', 'json')
            ];

            $results = $this->queryBuilderService->buildQuery($queryParams);

            header('Content-Type: application/json');
            echo $results;
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }
}
