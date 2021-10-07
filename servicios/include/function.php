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

function tipo_documento($i) {
    if ($i == 1) {
        return "DNI";
    } else if ($i == 2) {
        return "RUC";
    } else if ($i == 3) {
        return "C.E";
    } else if ($i == 4) {
        return "OTRO";
    } else {
        return "";
    }
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

function inputTextArray($nameInput) {
    return @$_REQUEST[$nameInput];
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
// $long LO MANEJO CON EL NUMERO: 7
function zero_fill($valor, $long = 0) {
    return str_pad($valor, $long, '0', STR_PAD_LEFT);
}

// GENERAR CODIGO ID PARA GUARDAR IMAGENES O AUDIOS EN UNA CARPETA
function generateRandomString($length = 6) {
    return substr(str_shuffle(str_repeat($x = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length / strlen($x)))), 1, $length);
}

// SIRVE PARA MOSTRAR UN MENSAJE DE ERRROR CENTRADO
function html_error($mensaje) {
    return '<div class="div-contenedor"><div class="centrar"><img src="design/aki/error.gif" alt="" style="width: 110px;"/><br><br><strong>' . $mensaje . '</strong></div></div>';
}

// CAMPOS VACIOS
function isEmpty($value) {

    // SI VALUE NO ES UN 
    if (!is_array($value)) {
        $dato = trim($value);
    }
    if (empty($dato)) {
        return null;
    } else {
        return $dato;
    }
}

// PARA SABER EL PUESTO DEL TURNO
function temprano_tarde($hora) {
    $horaactualpm = strtotime(date("12:00:00"));
    $horaactualam = strtotime(date("23:59:59"));

    if (
            $horaactualpm <= strtotime($hora) &&
            strtotime($hora) <= $horaactualam
    ) {
        return 'Tarde';
    } else {
        return 'Temprano';
    }
}

// CONVERTIR DE OBJECT CLASS A ARRAY
// https://stackoverflow.com/questions/19495068/convert-stdclass-object-to-array-in-php/19495142
function objectToArray($d) {
    if (is_object($d)) {
        // Gets the properties of the given object
        // with get_object_vars function
        $d = get_object_vars($d);
    }

    if (is_array($d)) {
        /*
         * Return array converted to object
         * Using __FUNCTION__ (Magic constant)
         * for recursive call
         */
        return array_map(__FUNCTION__, $d);
    } else {
        // Return array
        return $d;
    }
}

// CONVERTIR DE NUMERO A LETRA
// LIBRERIA: https://github.com/lecano/php-numero-a-letras
// EJM 1: https://es.stackoverflow.com/a/301625
// EJM 2:https://baulcode.com/codigos/convertir-importe-a-letras-mediante-php/
// mb_strtoupper : sirve para convertir en mayuscula y si tiene tilde lo convierte en mayuscula con tilde
// Ejm mb_strtoupper: http://kiuvox.com/solucion-a-strtoupper-con-tildes-php/
function number_words($valor, $desc_moneda, $sep, $desc_decimal) {
    if (!empty($valor)) {
        $arr = explode(".", str_replace(",", "", $valor));
        $entero = $arr[0];
        if (isset($arr[1])) {
            $decimos = strlen($arr[1]) == 1 ? $arr[1] . '0' : $arr[1];
        }

        $fmt = new \NumberFormatter('es', \NumberFormatter::SPELLOUT);
        if (is_array($arr)) {
            $num_word = ($arr[0] >= 1000000) ? "{$fmt->format($entero)} de $desc_moneda" : "{$fmt->format($entero)} $desc_moneda";
            if (isset($decimos) && $decimos > 0) {
                $num_word .= " $sep {$fmt->format($decimos)} $desc_decimal";
            }
        }
    } else {
        $num_word = "";
    }
    return mb_strtoupper($num_word, 'utf-8');
}

//echo number_words("10.10","soles","con","centimos");
//echo number_words("10","soles","con","centimos");
//echo number_words("1000000","soles","con","centimos");
//echo number_words("0.25","soles","con","centimos");
//echo number_words("500.35","soles","con","centimos");

function getLatLonByAddressName($nombrededireccion, $key) {
    // https://stackoverflow.com/a/11065535
    $url = "https://api.opencagedata.com/geocode/v1/json?q=" . urlencode(trim($nombrededireccion) . ' - Perú') . "&key=" . $key . "&language=es&pretty=1";
    $ch = curl_init();
    $timeout = 5;
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $json = @json_decode(curl_exec($ch), true)['results'][1]['geometry'];
    curl_close($ch);
    //$json = json_decode(file_get_contents($url), true)['results'][1]['geometry']; //['results'][0]['bounds'];
    return $json;
}

// OBTENER LOS VALUES DE UN ARRAY POR SU KEY NAME, ESTA FUNCION ES RECURSIVA 
function array_value_recursive($key, array $arr) {
    $val = array();
    array_walk_recursive($arr, function ($v, $k) use ($key, &$val) {
        if ($k == $key)
            array_push($val, $v);
    });
    return count($val) > 1 ? $val : array_pop($val);
}

// sigerp - ENVIAR FACTURA Y OBTENER RESPUESTA
function Emitir_Factura_Boleta($array) {
    $data_string = json_encode($array);
    $ws = 'https://www.sigerp.com/SIG/aSOAPImportarVentas.aspx?wsdl';
    $xml_envio = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:vbf="VBFENETEVO3">
                    <soapenv:Header/>
                    <soapenv:Body>
                       <vbf:RSoap.Execute>
                          <vbf:Jsonfe>' . $data_string . '</vbf:Jsonfe>
                       </vbf:RSoap.Execute>
                    </soapenv:Body>
                 </soapenv:Envelope>';

    $header = array(
        "Content-type: text/xml; charset=\"utf-8\"",
        "Accept: text/xml",
        "Cache-Control: no-cache",
        "Pragma: no-cache",
        "SOAPAction: ",
        "Content-lenght: " . strlen($xml_envio)
    );

    $ch = curl_init(); //inicia la llamada
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1); //
    curl_setopt($ch, CURLOPT_URL, $ws); //url a consultar
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $xml_envio);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);

    $response = curl_exec($ch); //Ejecutar y obtiene respuesta
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    return $httpcode; // 200 = Ok
}
