<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Esta es la ruta para el MASTER
Route::get('/master', function () {
    return view('visor');
});
