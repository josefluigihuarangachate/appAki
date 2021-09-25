<?php

include './include/app.php';
include './include/session.php';

//$json = getLatLonByAddressName('Santa anita', KEYOPENCAGE);
//imprimir($json);
//die();


if (METODO($method) == 'GET') {
    
} else if (METODO($method) == 'POST') {
    if ($cmd == 'registrarcliente') {
        $idcliente = input('idcliente'); // CORRELATIVO O EL AUTOINCREMENT DE ELLOS
        $tipodecliente = input('tipodecliente'); // Empresa o Persona
        $codigodecliente = input('codigodecliente'); // PONER EL AUTO INCREMENT QUE ESTA EN EL SISTEMA BASE
        $nombredeempresa = input('nombredeempresa');
        $nombredecliente = input('nombredecliente');
        $apellidopaterno = input('apellidopaterno');
        $apellidomaterno = input('apellidomaterno');
        $tipodedocumento = input('tipodedocumento'); // (1=DNI, 2=RUC, 3=C.E. 4=OTRO)
        $numerodedocumento = input('numerodedocumento');
        $direcciondelcliente = input('direcciondelcliente');
        $direcciondereferencia = input('direcciondereferencia');
        $emaildelcliente = input('emaildelcliente');
        $numerodelcliente = input('numerodecelulardelcliente');
        $codigodedistrito = input('codigodedistrito');
        $estadodelcliente = input('estadodelcliente'); // Activo o Inactivo
        $codigodezona = input('codigodezona'); // Int
        $fecharegistro = input('fecharegistro'); // Es la fecha en la que se registro el cliente
        //$cantidaddeordenatendidas = input('cantidaddeordenatendidas');
        //$importeacumulado = input('importeacumulado');

        $latitud = "";
        $longitud = "";

        if (
                !empty($idcliente) &&
                !empty($tipodecliente) &&
                !empty($codigodecliente) &&
                !empty($nombredecliente) &&
                !empty($apellidopaterno) &&
                !empty($apellidomaterno) &&
                !empty($tipodedocumento) &&
                !empty($numerodedocumento) &&
                !empty($direcciondelcliente) &&
                !empty($numerodelcliente) &&
                !empty($codigodedistrito) &&
                !empty($estadodelcliente) &&
                !empty($codigodezona) &&
                !empty($fecharegistro)
        ) {

            $latlon = getLatLonByAddressName(input('direcciondelcliente'), KEYOPENCAGE);
            if ($json) {
                $latitud = strval(@$latlon['lat']);
                $longitud = strval(@$latlon['lng']);
            }


            try {
                $pdo->insert(tabla('cliente'), [
                    "id" => $idcliente,
                    "Tipo_Cliente" => intval($tipodecliente),
                    "nombreempresa" => isEmpty($nombredeempresa),
                    "Codigo_Cliente" => isEmpty($codigodecliente),
                    "Nombre_Cliente" => $nombredecliente,
                    "ApellidoPaterno_Cliente" => $apellidopaterno,
                    "ApellidoMaterno_Cliente" => $apellidomaterno,
                    "TipoDocumento_Cliente" => $tipodedocumento,
                    "NumeroDocumento_Cliente" => $numerodedocumento,
                    "Direccion1_Cliente" => $direcciondelcliente,
                    "Direccion2_Cliente" => isEmpty($direcciondereferencia), // 
                    "Email_Cliente" => isEmpty($emaildelcliente), //
                    "NumeroCel_Cliente" => $celulardecliente,
                    "CodDistrito1_Cliente" => $codigodedistrito,
                    "Estado_Cliente" => ucwords(strtolower($estadodelcliente)),
                    "CodZona_Cliente" => $codigodezona,
                    "FechaRegistro_Cliente" => $fecharegistro,
                    "Latitud" => isEmpty($latitud), //
                    "Longitud" => isEmpty($longitud), //
                ]);
                $account_id = $pdo->id();

                if ($account_id) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_create');
                } else {
                    $json['msg'] = strings('error_create');
                }
            } catch (Throwable $t) {
                $json['msg'] = strings('error_create');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'PUT') {
    
} else if (METODO($method) == 'DELETE') {
    
} else {
    $json['msg'] = strings('error_method');
}


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
