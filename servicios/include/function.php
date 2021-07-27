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
    return "lg" . strtolower(@$r1);
}

function session($namesession) {
    $ns1 = @str_replace("_", "", @$namesession);
    return @$_SESSION["lg" . strtolower(@$ns1)];
}
