<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QueryController;

Route::get('/data', [QueryController::class, 'getData']);