<?php

// CAMBIAR NOMBRE DE LA TABLA - SQL SERVER
// exec sp_rename 'schema.old_table_name', 'new_table_name'
// exec sp_rename REPARTIDOR, REPARTIDORES;


function tabla($name) {
    $table = array(
        'receta'=> 'RECETA',
        'repartidor' => 'REPARTIDOR',
        'zona' => 'ZONA',
        'zonaxrepartidor' => 'ZONAXREPARTIDOR',
        'distrito' => 'DISTRITO',
        'cliente' => 'CLIENTE',
        'color' => 'COLOR',
        'turnoxcliente' => 'TURNOXCLIENTE',
        'articulo' => 'ARTICULO',
        'marca' => 'MARCA',
        'prenda' => 'PRENDA',
        'servicio' => 'SERVICIO',
        'estadoprenda' => 'ESTADOPRENDA',
        'prenda' => 'PRENDA'
    );

    return @strval(@$table[$name]);
}
