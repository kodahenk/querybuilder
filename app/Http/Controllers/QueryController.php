<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\QueryBuilderService;

class QueryController extends Controller
{
    protected $queryBuilder;

    public function __construct(QueryBuilderService $queryBuilder)
    {
        $this->queryBuilder = $queryBuilder;
    }

    public function getData(Request $request)
    {
        $params = $request->all();
        $format = $request->input('format', 'json'); // Default format is JSON

        $query = $this->queryBuilder->buildQuery($params);

        return ($query->toSql());

        if ($format === 'xml') {
            $results = $query->toXml();
            return response($results, 200)->header('Content-Type', 'application/xml');
        }

        $results = $query->toJson();
        return response($results, 200)->header('Content-Type', 'application/json');
    }
}
