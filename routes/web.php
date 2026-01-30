// Ruta para que el MASTER acceda al mapa
Route::get('/master', function () {
    return view('visor');
});
