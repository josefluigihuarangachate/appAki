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

 * 
 * SITEGROUND * 
 Usuario uirnl5ltehrqu ha sido creado con contraseña 1boehuop9a3y
 BASE DE DATOS = dbc0tpk2t8gggz
 
 
define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'dbc0tpk2t8gggz');
define('DB_USER', 'uirnl5ltehrqu');
define('DB_PASS', '1boehuop9a3y');
 
 */

define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'dbaki');
define('DB_USER', 'root');
define('DB_PASS', '');

define('RUTA_PDF', 'archivos/despacho_recojo/');
define('RUTA_ARCHIVOS', 'archivos/archivos/');
define('RUTA_AUDIOS', 'archivos/audios/');
define('KEYOPENCAGE', '60c99ad7fa9a42a79c6974d7465f5bcc');
define('FACTURACION_ELECTRONICA', 'http://www.sigerp.com/AKI/aSOAPImportarVentas.aspx?wsdl');

define('CORREO_ELECTRONICO_AKI', 'Luigi.huaranga@intellipos.com.pe');
define('CONTRASENIA_AKI', 'Intellipos1234');

//define('RUTA_SERVICIOS', 'http://192.168.0.103:81/appAki/servicios/');
//define('RUTA_DESIGN', 'http://192.168.0.103:81:81/appAki/design/');
// ACTUALIZAR FECHA ACTUAL DE TURNOXCLIENTE
/*
  UPDATE `turnoxcliente`
  SET
  `fecha_turno` = DATE(CURDATE()) ,
  `atencion` = 'Sin Atender'
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

$metododepago = array(
    'Por Cobrar',
    'Efectivo',
    'Tarjeta',
    //'Cheque',
    'Transferencia',
        //'Yape',
        //'Plin'
);

// Permisos Ajax
$ajax = !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
$method = htmlspecialchars(trim($_SERVER['REQUEST_METHOD']));

// https://opencagedata.com/
// Documentacion: https://opencagedata.com/api
// COMO USAR: https://api.opencagedata.com/geocode/v1/json?q=Santa Anita&key=60c99ad7fa9a42a79c6974d7465f5bcc
//$_SESSION['apiopencage'] = '60c99ad7fa9a42a79c6974d7465f5bcc';
