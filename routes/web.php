<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QueryController;

Route::get('/data', [QueryController::class, 'getData']);

Route::get('data-1', function() {
    // postları categorilerle beraber ilişkili çek
    $posts = App\Models\Post::with('category')->get();
    return $posts;
});