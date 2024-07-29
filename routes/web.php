<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QueryController;

Route::get('/data', [QueryController::class, 'index']);

Route::get('data-1', function() {
    // postları categorilerle beraber ilişkili çek
    $posts = App\Models\Post::with('category', 'user')->get();
    return $posts;
});