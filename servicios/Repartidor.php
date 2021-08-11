<?php

include './include/app.php';
include './include/session.php';

if (METODO($method) == 'GET') {
    if ($cmd == 'obtenercoordenadasrepartidor') {
        $idrepartidor = str_replace('"', '', @input('idrepartidor'));
        $latitud = @input('latitud');
        $longitud = @input('longitud');

        if ($idrepartidor && $latitud && $longitud) {
            $data = $pdo->update(
                    tabla('repartidor'),
                    [
                        "Latitud" => $latitud,
                        "Longitud" => $longitud
                    ], [
                "id" => $idrepartidor
                    ]
            );

            if ($data->rowCount() >= 1) {
                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_create');
            } else {
                $json['msg'] = strings('error_create');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd == 'ultimaubicacionrepartidor' && @$_SESSION[atributo('id')]) {
        $data = $pdo->select(
                tabla('repartidor'),
                [
                    tabla('repartidor') . ".Latitud(latitudrepartidor)",
                    tabla('repartidor') . ".Longitud(longitudrepartidor)",
                ],
                [
                    tabla('repartidor') . ".id" => @$_SESSION[atributo('id')],
                    tabla('repartidor') . ".Estado_Repartidor" => 'Activo',
                ]
        );

        if ($data) {
            //$json['code'] = '200';
            //$json['status'] = 'Ok';
            //$json['msg'] = strings('success_read');
            //$json['data'] = $data;

            echo '{
                  "geometry": {
                  "type": "Point",
                  "coordinates": [                  
                  ' . $data[0]['longitudrepartidor'] . ',
                  ' . $data[0]['latitudrepartidor'] . '
                  ]
                  },
                  "type": "Feature",
                  "properties": {

                  }
                  }';

            die();
        } else {
            $json['msg'] = strings('error_read');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'POST') {
    
} else if (METODO($method) == 'PUT') {
    
} else if (METODO($method) == 'DELETE') {
    
} else {
    $json['msg'] = strings('error_method');
}


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
