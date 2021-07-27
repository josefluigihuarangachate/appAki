<?php

function tabla($name) {
    $table = array(
        'repartidor' => 'REPARTIDOR',
        'zona' => 'ZONA',
        'zonaxrepartidor' => 'ZONAXREPARTIDOR',
        'distrito' => 'DISTRITO',
        'cliente' => 'CLIENTE',
        'turnoxcliente' => 'TURNOXCLIENTE',
        'articulo' => 'ARTICULOS',
        'prenda' => 'PRENDA',
        'servicio' => 'SERVICIO',
        'estadoprenda' => 'ESTADO_PRENDA',
        'prenda' => 'PRENDA'
    );

    return @strval(@$table[$name]);
}
