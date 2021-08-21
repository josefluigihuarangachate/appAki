<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listamarca') {
            $data = $pdo->select(
                    tabla('marca'),
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('marca') . ".id(idmarca)",
                        tabla('marca') . ".Nombre_Marca(nombremarca)",
                    ],
                    [
                        tabla('marca') . ".Estado_Marca" => 'Activo'
                    ]
            );
            if ($data) {
                usort($data, function (array $elem1, $elem2) {
                    return $elem1['nombremarca'] <=> $elem2['nombremarca'];
                });
                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_read');
                $json['data'] = $data;
            } else {
                $json['msg'] = strings('error_read');
            }
        } else {
            $json['msg'] = strings('error_cmd');
        }
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'registrartagsmarca') {
            $nombremarca = input('marca');
            if (!empty($nombremarca) && !is_numeric($nombremarca)) {
                try {
                    $data = $pdo->insert(tabla('marca'), [
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
