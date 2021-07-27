<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        $cmd = input('cmd');
        if ($cmd == 'registrarrecojo') {

            $totalOrden = input('numOrden');
            if ($totalOrden > 0) {
                $inserts = [];
                $i = 1;
                while ($i <= $totalOrden) {
                    $idsestados = "";
                    $nombresimagenes = "";
                    // SI INPUT EXISTE
                    if (
                            !empty(@input('sop' . $i))
                    ) {

                        // VERIFICO SI HAY ESTADOS SELECCIONADOS
                        @$check = @inputArray('chk' . $i);
                        if (
                                !empty(@$check)
                        ) {
                            for ($chk = 0; $chk < count(@$check); $chk++) {
                                $idsestados .= @$check[$chk];
                                if ($chk < (count(@$check) - 1)) {
                                    $idsestados .= ",";
                                }
                            }
                        }

                        // VERIFICO SI HAY IMAGENES
                        @$images = @$_FILES['file' . $i]['name'];

                        if (
                                !empty(@$images)
                        ) {
                            for ($img = 0; $img < count(@$images); $img++) {


                                $newfilename = 'RD' . date('dmYHis') . str_replace(" ", "", basename(inputfile('file' . $i, 'name', $img)));
                                echo "Hay imagenes: ";
                                imprimir($_FILES);
                                //move_uploaded_file($_FILES["file"]["tmp_name"], "../img/imageDirectory/" . $newfilename);

                                $nombresimagenes .= " " . $newfilename;
                            }
                        }


                        $inserts[] = array(
                            'idarticulo' => @input('sop' . $i),
                            'idprenda' => @input('pre' . $i),
                            'idservicio' => @input('ser' . $i),
                            'dias' => @input('dia' . $i), // CORREGIR NO SE ESTA MOSTRANDO
                            'precio' => @input('prc' . $i),
                            'fecha' => @input('fec' . $i),
                            'estados' => $idsestados,
                            'observaciones' => @input('obs' . $i),
                            'archivos' => trim($nombresimagenes),
                        );
                    }

                    $i = $i + 1;
                    continue;
                }

                if (!empty($inserts)) {
                    
                }

                echo "Array:";
                imprimir($inserts);
                die();
//                $database->insert("account", [
//                    [
//                        "user_name" => "foo",
//                        "email" => "foo@bar.com",
//                        "age" => 25,
//                        "city" => "New York",
//                        "lang [JSON]" => ["en", "fr", "jp", "cn"]
//                    ],
//                    [
//                        "user_name" => "bar",
//                        "email" => "bar@foo.com",
//                        "age" => 14,
//                        "city" => "Hong Kong",
//                        "lang [JSON]" => ["en", "jp", "cn"]
//                    ]
//                ]);
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
