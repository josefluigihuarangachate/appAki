<?php

// CAMBIAR NOMBRE DE LA TABLA - SQL SERVER
// exec sp_rename 'schema.old_table_name', 'new_table_name'
// exec sp_rename REPARTIDOR, REPARTIDORES;


function tabla($name) {
    $table = array(
        'receta' => 'receta',
        'repartidor' => 'repartidor',
        'zona' => 'zona',
        'zonaxrepartidor' => 'zonaxrepartidor',
        'distrito' => 'distrito',
        'cliente' => 'cliente',
        'color' => 'color',
        'detalleorden' => 'detalleorden',
        'turnoxcliente' => 'turnoxcliente',
        'articulo' => 'articulo',
        'marca' => 'marca',
        'orden' => 'orden',
        'promocion' => 'promocion',
        'promocionxarticulo' => 'promocionxarticulo',
        'prenda' => 'prenda',
        'servicio' => 'servicio',
        'estadoprenda' => 'estadoprenda',
        'prenda' => 'prenda',
        'estadoreclamo' => 'estadoreclamo',
        'reclamoxprenda' => 'reclamoxprenda',
    );

    return @strval(@$table[$name]);
}
