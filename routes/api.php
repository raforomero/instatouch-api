<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Log;

// Esta es la ruta: https://instatouch-api.onrender.com/api/location
Route::post('/location', function (Request $request) {
    
    // 1. Recibimos los datos del NODO
    $latitud = $request->input('latitude');
    $longitud = $request->input('longitude');
    $masterId = $request->input('master_id');

    // 2. Log temporal para verificar en Render que los datos llegan
    Log::info("Ubicación recibida del NODO: Lat: $latitud, Lon: $longitud, Master: $masterId");

    // 3. Respuesta para que el celular sepa que llegó bien
    return response()->json([
        'status' => 'success',
        'message' => 'Ubicación actualizada en PostgreSQL'
    ], 200);
});
