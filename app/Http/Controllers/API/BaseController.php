<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

class BaseController extends Controller
{
    public function handleResponse($result, $msg = 'Ok', $code = 200)
    {
        $response = [
            'success' => true,
            'message' => $msg,
            'data' => $result,
        ];
        return response()->json($response, $code);
    }

    public function handleError($error, $errorDetails = [], $code = 400)
    {
        $response = [
            'success' => false,
            'message' => 'Invalid data provided.',
            'error' => $error,
        ];
        if (!empty($errorDetails)) {
            $response['details'] = $errorDetails;
        }
        return response()->json($response, $code);
    }
}
