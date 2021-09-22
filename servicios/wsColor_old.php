<?php

include './include/app.php';
include './include/session.php';

if (METODO($method) == 'GET') {
    
} else if (METODO($method) == 'POST') {
    if ($cmd == 'registrarcolor') {
        $idcolor = input('idcolor'); // CORRELATIVO O EL AUTOINCREMENT DE ELLOS
        $nombrecolor = input('color');

        if (
                !empty($idcolor) &&
                !empty($nombrecolor) &&
                !is_numeric($nombrecolor)
        ) {
            try {
                $data = $pdo->insert(tabla('color'), [
                    "id" => $idcolor,
                    "Nombre_Color" => strtoupper(strtolower($nombrecolor)),
                    "Estado_Color" => "Activo",
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
