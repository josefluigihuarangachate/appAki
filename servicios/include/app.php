<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//header('Access-Control-Allow-Origin: *');
//header('Access-Control-Allow-Methods: POST, GET, PUT, OPTIONS, PATCH, DELETE');
//header('Access-Control-Allow-Credentials: true');
//header('Access-Control-Allow-Headers: Authorization, Content-Type, x-xsrf-token, x_csrftoken, Cache-Control, X-Requested-With');

// Require Composer's autoloader.
require '../vendor/autoload.php';
include './include/config.php';
include './include/function.php';
include './include/string.php';
include './include/tables.php';
include './include/conexion.php';
@$cmd = @strtolower(@input('cmd'));
