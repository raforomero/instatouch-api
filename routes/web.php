<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Esta es la ruta que cargará tu mapa
Route::get('/master', function () {
    return view('visor');
});
