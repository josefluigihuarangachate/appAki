<?php

date_default_timezone_set('America/Lima');

define('DB_TYPE', 'mssql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'DBAki');
define('DB_USER', 'admin');
define('DB_PASS', 'admin');

define('FOTOS', '');
define('RUTA_SERVICIOS', 'http://192.168.0.103:81/appAki/servicios/');
define('RUTA_DESIGN', 'http://192.168.0.103:81:81/appAki/design/');

$json = array(
    'status' => 'Error',
    'code' => "405",
    'msg' => 'Acceso Denegado',
    'data' => ''
);

// Permisos Ajax
$ajax = !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
$method = htmlspecialchars(trim($_SERVER['REQUEST_METHOD']));
