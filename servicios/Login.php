<?php

include './include/app.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {

        $idrepartidor = input('idrepartidor');
        $chkrecordar = input('chkrecordar');

        $data = $pdo->select(tabla('repartidor'), "*", [
            "codigo_repartidor" => $idrepartidor
        ]);

        if ($data) {
            // NO EL session_start(); YA QUE LO PUSE EN EL config.php  
            session_start();
            session_regenerate_id(true);
            $_SESSION['acceso'] = true;
            $_SESSION['chkrecordar'] = $chkrecordar; // TRUE ó FALSE
            // SIRVE PARA RECORDAR LA CUENTA
            if ($chkrecordar) {
                setcookie("recordarcuenta", $chkrecordar);
            }
            // FIN
            // LLENO LOS DATOS EN SESIONES POR LOS CAMPOS DE LA BASE DE DATOS
            $_SESSION[atributo('id')] = @$data[0]['id'];
            $_SESSION[atributo('codigo_repartidor')] = @$data[0]['codigo_repartidor'];
            $_SESSION[atributo('nombre_repartidor')] = @$data[0]['nombre_repartidor'];
            $_SESSION[atributo('apellido_repartidor')] = @$data[0]['apellido_repartidor'];
            $_SESSION[atributo('avatar_repartidor')] = @$data[0]['avatar_repartidor'];
            $_SESSION[atributo('id_zona')] = @$data[0]['id_zona'];

            //SHORT NAME
            $nom = explode(' ', @$data[0]['nombre_repartidor']);
            $ape = explode(' ', @$data[0]['apellido_repartidor']);
            $_SESSION[atributo('nombre_corto')] = @$nom[0] . " " . @$ape[0];
            $_SESSION['apigooglemap'] = 'AIzaSyBjAd55ccknLheORKj-8YMVTMcuS02llSA';

            // EJM: https://powerbiuniversity.com/convertir-direcciones-latitud-longitud-automaticamente-power-bi-traves-la-api-google/
            // SE DEBE DE PAGAR: https://support.google.com/googleapi/answer/6158867?hl=en
            $_SESSION['apigoogleaddress'] = 'AIzaSyDezU9TFYMqHBD_m0jaxlupt8QBVZe2oio';

            // https://opencagedata.com/
            // Documentacion: https://opencagedata.com/api
            // COMO USAR: https://api.opencagedata.com/geocode/v1/json?q=Santa Anita&key=60c99ad7fa9a42a79c6974d7465f5bcc
            $_SESSION['apiopencage'] = '60c99ad7fa9a42a79c6974d7465f5bcc';

            $_SESSION['themedark'] = '';
            //FIN
            //var_dump($_SESSION);
            //die();
            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_login');
            $json['data'] = '';
            $json['redirect'] = "zona";

            // SIRVE PARA CONVERTIR A SENTENCIA - SEGUN LA BASE DE DATOS QUE ESTAS USANDO 
            //var_dump($pdo->log());
            //die();
        } else {
            $json['msg'] = strings('error_login');
        }
    } else if (METODO($method) == 'PUT') {
        session_start();
        session_unset();
        session_destroy();
        $json['code'] = '200';
        $json['status'] = 'Ok';
        $json['msg'] = '';
        $json['redirect'] = "login";
    } else {
        $json['msg'] = strings('error_method');
    }
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
