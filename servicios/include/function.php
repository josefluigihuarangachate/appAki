<?php

/*
 * Para saber que metodo es la peticion
 * $method = $_SERVER['REQUEST_METHOD'];
 */

function METODO($method) {
    switch (strtoupper($method)) {
        case 'PUT':
            return 'PUT';
            break;
        case 'POST':
            return 'POST';
            break;
        case 'GET':
            return 'GET';
            break;
        case 'DELETE':
            return 'DELETE';
            break;
        default:
            return '';
            break;
    }
}

function CleanInput($input) {
    // https://www.w3schools.com/php/func_string_htmlspecialchars.asp
    // https://www.php.net/releases/8.0/en.php
    return @htmlspecialchars(trim($input), ENT_QUOTES | ENT_HTML5, 'UTF-8', false);
}

function input($nameInput) {
    return CleanInput(@$_REQUEST[$nameInput]);
}

// EJEM:
// $type = tmp_name
// $nameInput = txtfile
// Opcional: solo si es multiple, $index = 1  ['img.jpg','img.jpg']
function inputfile($nameInput, $type, $index = '') {
    if (@intval($index) == 0 || 0 < @intval($index)) {
        return @$_FILES[$nameInput][$type][$index];
    } else {
        return @$_FILES[$nameInput][$type];
    }
}

function inputArray($nameInput) {
    return @$_FILES;
}

function imprimir($print) {
    echo "<pre>", print_r($print), "</pre>";
}

// PREFIJO SESSION - VER WEB SERVICE DEL LOGIN
// EJM : lgid | lgcodigorepartidor | lgnombrerepartidor | lgapellidorepartidor | lgavatarrepartidor
function atributo($input) {
    $r1 = @str_replace("_", "", @$input);
    return "" . strtolower(@$r1);
}

function session($namesession) {
    $ns1 = @str_replace("_", "", @$namesession);
    return @$_SESSION["" . strtolower(@$ns1)];
}

// SIRVE PARA CONVERTIR IMAGEN A BLOB POR RUTA, SOLO SIRVE PARA HTML
// Ejm: https://stackoverflow.com/a/66197139/16488926
function convertirblobimageporruta($path) {
    $image = base64_encode(file_get_contents($path));
    return "data:image/png;base64,$image";
}

// SIRVE PARA SABER EL DIA EN ESPAÑOL DE UNA FECHA
function nombreDia($fecha) {
    $diaFecha = date('w', strtotime($fecha));
    switch ($diaFecha) {
        case 0:
            return 'domingo';
        case 1:
            return 'lunes';
        case 2:
            return 'martes';
        case 3:
            return 'miércoles';
        case 4:
            return 'jueves';
        case 5:
            return 'viernes';
        case 6:
            return 'sábado';
        default:
            return '';
    }
}

// zero_fill 
// $valor = sera un numero
// $long = cuantos ceros adelante quieres que tenga
// ejem:
// $valor = 5
// $long = 7
// RESULTADO: 0000005
// https://es.stackoverflow.com/a/74997
function zero_fill($valor, $long = 0) {
    return str_pad($valor, $long, '0', STR_PAD_LEFT);
}

// GENERAR CODIGO ID PARA GUARDAR IMAGENES O AUDIOS EN UNA CARPETA
function generateRandomString($length = 6) {
    return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
}
