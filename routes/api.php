<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

use App\Http\Controllers\API\Catalogs\UnitController;
use App\Http\Controllers\API\Catalogs\CategoryController;
use App\Http\Controllers\API\Catalogs\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Public routes
Route::post('login', [AuthController::class, 'login']);

// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {

    // ===========================================================================
    // App Routes
    // ===========================================================================

    // Users & Authentication
    // ===========================================================================
    Route::post('system/register', [AuthController::class, 'register']);
    Route::post('system/logout', [AuthController::class, 'logout']);
    Route::get('system/users', [AuthController::class, 'listUsers']);
    Route::get('system/users/{id}', [AuthController::class, 'getUserById']);
    Route::put('system/users/{id}', [AuthController::class, 'updateUser']);
    Route::put('system/users/{id}/status', [AuthController::class, 'updateStatus']);
    Route::put('system/users/{id}/password', [AuthController::class, 'updatePassword']);

    // Catalogs
    // ===========================================================================
    Route::apiResource('unit', UnitController::class);
    Route::apiResource('category', CategoryController::class);
    Route::apiResource('product', ProductController::class);

});
