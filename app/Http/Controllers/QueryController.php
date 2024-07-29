<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\QueryBuilderService;
use Illuminate\Support\Facades\Log;

class QueryController extends Controller
{
    protected $queryBuilderService;

    public function __construct(QueryBuilderService $queryBuilderService)
    {
        $this->queryBuilderService = $queryBuilderService;
    }

    public function index(Request $request)
    {
        try {
            // QueryBuilderService'i kullanarak sorguyu oluştur ve sonuçları al
            return $this->queryBuilderService->buildQuery($request);
        } catch (\Exception $e) {
            // Hata durumunda JSON formatında hata mesajı döner
            Log::error('Query Error', ['error' => $e->getMessage()]);
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
}
