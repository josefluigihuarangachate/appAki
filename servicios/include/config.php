<?php

date_default_timezone_set('America/Lima');

/*
 * SQL SERVER
  define('DB_TYPE', 'mssql');
  define('DB_HOST', 'localhost');
  define('DB_NAME', 'DBAki');
  define('DB_USER', 'admin');
  define('DB_PASS', 'admin');
 */

/*
  SERVIDOR
 * https://demo1.reidemotech.com/layouts/login
  define('DB_TYPE', 'mysql');
  define('DB_HOST', '151.106.96.241');
  define('DB_NAME', 'u460301108_dbaki');
  define('DB_USER', 'u460301108_aki');
  define('DB_PASS', 'u460301108_Aki');
 */

define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'dbaki');
define('DB_USER', 'root');
define('DB_PASS', '');

define('RUTA_PDF', 'archivos/despacho_recojo/');
//define('RUTA_SERVICIOS', 'http://192.168.0.103:81/appAki/servicios/');
//define('RUTA_DESIGN', 'http://192.168.0.103:81:81/appAki/design/');
// ACTUALIZAR FECHA ACTUAL DE TURNOXCLIENTE
/*
  UPDATE `turnoxcliente`
  SET
  `fecha_turno` = DATE(CURDATE())
  WHERE id > 0;
 */

// BUSCAR IDS QUE SE REPITEN
/*
  https://www.baulphp.com/buscar-registros-repetidos/

  select `codigo_articulo`,  count(`codigo_articulo`) c from articulo
  group by `codigo_articulo` having c > 1;
 */

// SIRVE PARA QUE EL AUTOINCREMENT DE UNA TABLA, INSERTE DESDE EL 1, ejm: ALTER TABLE mi_tabla AUTO_INCREMENT = 1;
/*
  ALTER TABLE `articulo` AUTO_INCREMENT = 1;
 */

$json = array(
    'status' => 'Error',
    'code' => "405",
    'msg' => 'Acceso Denegado',
    'data' => ''
);

// Permisos Ajax
$ajax = !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
$method = htmlspecialchars(trim($_SERVER['REQUEST_METHOD']));
