<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'registrarmarca') {
            $idmarca = input('idmarca'); // CORRELATIVO O EL AUTOINCREMENT DE ELLOS
            $nombremarca = input('marca');

            if (
                    !empty($idmarca) &&
                    !empty($nombremarca) &&
                    !is_numeric($nombremarca)
            ) {
                try {
                    $data = $pdo->insert(tabla('marca'), [
                        "id" => $idmarca,
                        "Nombre_Marca" => strtoupper(strtolower($nombremarca)),
                        "Estado_Marca" => "Activo",
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
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
