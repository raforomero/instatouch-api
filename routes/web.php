<?php
use Illuminate\Support\Facades\Route;

Route::get('/', function () { return view('welcome'); });

Route::get('/master', function () { return view('visor'); });
