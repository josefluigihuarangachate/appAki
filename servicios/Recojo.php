<?php

// ES MUY IMPORTANTE YA QUE SIRVE PARA VER ERRORES
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);

error_reporting(0); // NO ES RECOMENDABLE

include './include/app.php';
include './include/session.php';

//$html = ob_get_clean();
// GITHUB: https://github.com/picqer/php-barcode-generator
$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if ($ajax) {
    if (METODO($method) == 'POST') {
        $cmd = input('cmd');
        if ($cmd == 'registrarrecojo') {
            $idservicio = input('servicio');
            $nombreservicio = input('nombreservicio');
            $diaxservicio = input('diasservicios');
            $fechadeentrega = input('fechadeentrega');
            $pagototal = input('pagototal');
            $tipo_cobro = 'Por Cobrar';
            $numOrdenes = input('numOrdenes');

            // COORDENADAS DEL CLIENTE
            $latitud_cliente = input('latitud');
            $longitud_cliente = input('longitud');

            if (
                    !empty($idservicio) &&
                    !empty($nombreservicio) &&
                    intval($diaxservicio) >= 1 &&
                    $fechadeentrega != date('Y-m-d')
            ) {
                // ESTE ES LA FECHA MINIMA, SEGUN LOS DIAS DEL SERVICIO
                $fechamindeentrega = input('fechaminimodeentrega');
                // $fechadeentrega = ES LA FECHA A LA CUAL SE DEBE DE ENTREGAR EL ARTICULO O PRENDA  

                $zona = $pdo->select(
                        tabla('zona'),
                        [
                            "id",
                            "codigo_zona",
                            "puesto_zona"
                        ],
                        [
                            "id" => @$_SESSION['idzona']
                        ]
                );

                // POR DEFECTO LA HORA DE ENTREGA ES A LAS 5PM
                $fechahoy = date('Y-m-d');
                $fechahoyslash = date('d/m/Y');
                $horahoy = date('H:i:s');
                $horahoypm = $horahoy . ' ' . date('A');

                $pdo->insert(
                        tabla('orden'),
                        [
                            "idservicio" => @trim($idservicio),
                            "nombre_servicio" => @strtoupper(strtolower($nombreservicio)),
                            "nombre_repartidor" => @ucwords(strtolower(@$_SESSION['nombrecorto'])), // NOMBRE CORTO DEL REPARTIDOR
                            "fecha" => $fechahoy,
                            "hora" => $horahoy,
                            "idcliente" => @$_SESSION['idclientetemp'],
                            "nombre_cliente" => @ucwords(strtolower(@$_SESSION['nombrecliente'])),
                            "celular_cliente" => @$_SESSION['telefono'],
                            "direccion_cliente" => @$_SESSION['direccion'],
                            "fecha_entrega" => $fechadeentrega,
                            "hora_entrega" => $horahoy,
                            "tipo_cobro" => $tipo_cobro,
                            "idzona" => @$zona[0]['puesto_zona'],
                            "total_s_dscto" => '',
                            "descuento" => '',
                            "total_pagar" => str_replace(',', '', number_format($pagototal, 2, '.', '')),
                            "a_cuenta" => '',
                            "saldo" => '',
                            "estado" => 'Activo',
                            'flag' => 2
                        ]
                );

                $lastinsert_id = $pdo->id();
                $codpdf = "";
                $codbar = "";

                if ($lastinsert_id) {

                    $numero_orden = strtoupper(@$zona[0]['puesto_zona']) . '-' . zero_fill($lastinsert_id, 7);

                    try {
                        // REGISTRO EL TURNO X CLIENTE
                        $pdo->insert(
                                tabla('turnoxcliente'),
                                [
                                    "numero_orden" => $numero_orden,
                                    "id_repartidor" => @$_SESSION['id'],
                                    "id_cliente" => @$_SESSION['idclientetemp'],
                                    "id_zona" => @$zona[0]['id'],
                                    "puesto_turno" => temprano_tarde($horahoy),
                                    "fecha_turno" => $fechadeentrega,
                                    "hora_turno" => $horahoy,
                                    "atencion" => 'Sin Atender',
                                    "estado_turno" => 'Entrega'
                                ]
                        );
                        // FIN REGISTRO EL TURNO X CLIENTE

                        $pdo->update(tabla('orden'),
                                [
                                    "numeroorden" => $numero_orden
                                ],
                                [
                                    "id" => $lastinsert_id
                                ]
                        );

                        // ACTUALIZO EL ESTADO PARA QUE NO ME APAREZCA EN LA LISTA DE TURNOXCLIENTE
                        // id del turnoxcliente
                        $pdo->update(tabla('turnoxcliente'),
                                [
                                    "atencion" => 'Atendido'
                                ],
                                [
                                    "id" => @$_SESSION['idturnoxrepartidortemp']
                                ]
                        );

                        // ACTUALIZO LAS COORDENAS DEL CLIENTE
                        try {
                            if ($latitud_cliente && $longitud_cliente) {
                                $pdo->update(tabla('cliente'),
                                        [
                                            "Latitud" => strval($latitud_cliente),
                                            "Longitud" => strval($longitud_cliente)
                                        ],
                                        [
                                            "id" => @$_SESSION['idclientetemp']
                                        ]
                                );
                            }
                        } catch (Throwable $e) {
                            
                        }
                    } catch (Exception $e) {
                        echo html_error(strings('error_create'));

                        // ELIMINO LA ORDEN YA QUE HUBO UN ERROR AL INSERTARLO LA ORDEN
                        $pdo->delete(tabla('orden'), [
                            "AND" => [
                                "id" => $lastinsert_id
                            ]
                        ]);

                        // ELIMINO EL DETALLE DE LA ORDEN YA QUE HUBO UN ERROR AL INSERTAR LA ORDEN
                        $pdo->delete(tabla('detalleorden'), [
                            "AND" => [
                                "idorden" => $lastinsert_id
                            ]
                        ]);
                        die();
                    }

                    $insert = [];
                    $piezas = [];
                    $promociones = [];

                    // SI ES POR PIEZA
                    if (
                            strtolower($nombreservicio) != 'promocion' &&
                            strtolower($nombreservicio) != 'promoci??n' &&
                            strtolower($nombreservicio) != 'promociones' &&
                            $idservicio != 1
                    ) {

                        // RECORRO PARA OBTENER LOS IDS
                        $keyname = array();
                        $vf = 0;
                        foreach ($_REQUEST as $key => $value) {
                            if (str_contains(strval($key), 'laprendapertenece')) {
                                $namekey = str_replace("laprendapertenece", "", $key);

                                $idspiezas = explode(';', @$_REQUEST["piezasids" . $namekey]);
                                $arrpiezas = [];
                                $inidestado = "";

                                if (count($idspiezas) >= 1) {
                                    for ($pz = 0; $pz < count($idspiezas); $pz++) {
                                        $nombrepieza = $pdo->select(
                                                tabla('articulo'),
                                                [
                                                    "nombre_articulo",
                                                ],
                                                [
                                                    "id" => @$_REQUEST['pieza' . $idspiezas[$pz]]
                                                ],
                                                [
                                                    "LIMIT" => [0, 1]
                                                ]
                                        );
                                        $precioprenda = $pdo->select(
                                                tabla('articulo'),
                                                [
                                                    "precio_articulo",
                                                ],
                                                [
                                                    "id" => @$_REQUEST['pieza' . $namekey]
                                                ],
                                                [
                                                    "LIMIT" => [0, 1]
                                                ]
                                        );
                                        $inidestado = "";
                                        try {
                                            if (@$_REQUEST['estado' . $idspiezas[$pz]]) {
                                                $inidestado = implode(" @ ", @$_REQUEST['estado' . $idspiezas[$pz]]);
                                            } else {
                                                $inidestado = "";
                                            }
                                        } catch (Throwable $e) {
                                            $inidestado = "";
                                        }

                                        // SUBIMOS LAS IMAGENES POR PRENDA
                                        $carpeta_archivo = RUTA_ARCHIVOS . $numero_orden . "/";
                                        $inidarchivo = '';
                                        $file = @$_FILES['archivo' . $idspiezas[$pz]];
                                        if (count($file['name'])) {
                                            $fi = 0;
                                            while ($fi < count($file['name'])) {
                                                $tmpFilePath = $file['tmp_name'][$fi];
                                                if ($tmpFilePath) {
                                                    if ($fi == 0) {
                                                        if (!file_exists($carpeta_archivo)) {
                                                            mkdir($carpeta_archivo, 0777, true);
                                                        }
                                                    }
                                                    $temp = explode(".", $file["name"][$fi]);
                                                    $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                                    if ($fi > 0) {
                                                        $inidarchivo .= ' @ ';
                                                    }
                                                    $inidarchivo .= $newfilename;
                                                    move_uploaded_file($file["tmp_name"][$fi], $carpeta_archivo . $newfilename);
                                                }
                                                $fi = $fi + 1;
                                            }
                                        }
                                        // FIN SUBIMOS LAS IMAGENES POR PRENDA
                                        // SUBIMOS LOS AUDIOS POR PRENDA
                                        $carpeta_audio = RUTA_AUDIOS . $numero_orden . "/";
                                        $inidaudio = '';
                                        $file = @$_FILES['audio' . $idspiezas[$pz]];
                                        if (count($file['name'])) {
                                            $fi = 0;
                                            while ($fi < count($file['name'])) {
                                                $tmpFilePath = $file['tmp_name'][$fi];
                                                if ($tmpFilePath) {
                                                    if ($fi == 0) {
                                                        if (!file_exists($carpeta_audio)) {
                                                            mkdir($carpeta_audio, 0777, true);
                                                        }
                                                    }
                                                    $temp = explode(".", $file["name"][$fi]);
                                                    $newfilename = 'M' . generateRandomString() . '.' . end($temp);
                                                    if ($fi > 0) {
                                                        $inidaudio .= ' @ ';
                                                    }
                                                    $inidaudio .= $newfilename;
                                                    move_uploaded_file($file["tmp_name"][$fi], $carpeta_audio . $newfilename);
                                                }
                                                $fi = $fi + 1;
                                            }
                                        }
                                        // FIN SUBIMOS LOS AUDIOS POR PRENDA

                                        $arrpiezas[] = array(
                                            'key' => $idspiezas[$pz],
                                            'idpieza' => @$_REQUEST['pieza' . $idspiezas[$pz]],
                                            'nombrepieza' => @$nombrepieza[0]['nombre_articulo'],
                                            'nombresestados' => isEmpty($inidestado),
                                            'observacion' => isEmpty(@$_REQUEST['observacion' . $idspiezas[$pz]]),
                                            'audios' => isEmpty(strval(@$inidaudio)),
                                            'imagenes' => isEmpty(strval(@$inidarchivo)),
                                        );
                                        unset($nombrepieza);
                                        unset($precioprenda);
                                    }

                                    $nombreprenda = $pdo->select(
                                            tabla('articulo'),
                                            [
                                                "nombre_articulo",
                                            ],
                                            [
                                                "id" => $_REQUEST[$key]
                                            ],
                                            [
                                                "LIMIT" => [0, 1]
                                            ]
                                    );

                                    $precioprenda = $pdo->select(
                                            tabla('articulo'),
                                            [
                                                "precio_articulo",
                                            ],
                                            [
                                                "id" => $_REQUEST[$key]
                                            ],
                                            [
                                                "LIMIT" => [0, 1]
                                            ]
                                    );

                                    $piezas[$vf] = array(
                                        'idprenda' => $_REQUEST[$key],
                                        'ordenpromocion' => $namekey,
                                        'precio' => $precioprenda[0]['precio_articulo'],
                                        'nombreprenda' => $nombreprenda[0]['nombre_articulo'],
                                        'color' => $_REQUEST['color' . $namekey],
                                        'marca' => $_REQUEST['marca' . $namekey],
                                        'cantpiezas' => count($idspiezas),
                                        'piezas' => $arrpiezas
                                    );
                                    unset($nombreprenda);
                                    unset($precioprenda);
                                }
                                $vf = $vf + 1;
                            }
                        }

                        $item = 100;
                        for ($rh = 0; $rh < count($piezas); $rh++) {
                            $cantpiezas = $piezas[$rh]['cantpiezas'];

                            if ($cantpiezas == 1) {
                                $piezas[$rh]['piezas'][0]['item'] = $item + 1;
                            } else {
                                for ($rtf = 0; $rtf < $cantpiezas; $rtf++) {
                                    $piezas[$rh]['piezas'][$rtf]['item'] = $item + ($rtf + 1);
                                }
                            }
                            $item = $item + 100;
                        }

                        // ARMANDO EL INSERT
                        $vi = 0;
                        while ($vi < count($piezas)) {
                            $cPiezas = $piezas[$vi]['piezas'];
                            $bi = 0;

                            while ($bi < count($cPiezas)) {

                                $precio = isEmpty('');
                                if ($bi == 0) {
                                    $precio = $piezas[$vi]['precio'];
                                }

                                $idpromo = isEmpty('');
                                $nombrepromo = isEmpty('');
                                $idpieza = isEmpty('');
                                $nombrepieza = isEmpty('');

                                if ($piezas[$vi]['cantpiezas'] == 1) {
                                    $idpieza = isEmpty($piezas[$vi]['idprenda']);
                                    $nombrepieza = isEmpty($piezas[$vi]['nombreprenda']);
                                } else if ($piezas[$vi]['cantpiezas'] >= 2) {
                                    $idpromo = isEmpty($piezas[$vi]['idprenda']);
                                    $nombrepromo = isEmpty($piezas[$vi]['nombreprenda']);
                                    $idpieza = isEmpty($cPiezas[$bi]['idpieza']);
                                    $nombrepieza = isEmpty($cPiezas[$bi]['nombrepieza']);
                                }

                                $getCodArt = $pdo->select(
                                        tabla('articulo'),
                                        "codigo_articulo",
                                        [
                                            "id" => intval($idpieza)
                                        ]
                                );

                                $arr = array(
                                    'codigoarticulo' => $getCodArt[0],
                                    'item' => $cPiezas[$bi]['item'],
                                    'idorden' => $lastinsert_id,
                                    'ordenpromocion' => strval($piezas[$vi]['ordenpromocion']),
                                    'idpromocion' => $idpromo,
                                    'nombrepromocion' => $nombrepromo,
                                    'idprenda' => $idpieza, //$cPiezas[$bi]['idpieza'],
                                    'nombreprenda' => $nombrepieza, //$cPiezas[$bi]['nombrepieza'],
                                    'color' => strtoupper($piezas[$vi]['color']),
                                    'marca' => strtoupper($piezas[$vi]['marca']),
                                    'precioprenda' => str_replace(',', '', number_format($precio, 2, '.', '')),
                                    'nombreestados' => isEmpty($cPiezas[$bi]['nombresestados']),
                                    'observaciones' => isEmpty($cPiezas[$bi]['observacion']),
                                    'audios' => isEmpty(strval($cPiezas[$bi]['audios'])),
                                    'imagenes' => isEmpty(strval($cPiezas[$bi]['imagenes'])),
                                );
                                array_push($insert, $arr);
                                unset($arr);
                                $bi = $bi + 1;
                            }
                            $vi = $vi + 1;
                        }

                        try {
                            $pdo->insert(
                                    tabla('detalleorden'),
                                    $insert
                            );
                        } catch (Exception $e) {
                            echo html_error(strings('error_create'));
                            $pdo->delete(tabla('orden'), [
                                "AND" => [
                                    "id" => $lastinsert_id
                                ]
                            ]);
                            $pdo->delete(tabla('detalleorden'), [
                                "AND" => [
                                    "idorden" => $lastinsert_id
                                ]
                            ]);
                            die();
                        }
                    }

                    // SI SON PROMOCIONES
                    else if (
                            strtolower($nombreservicio) == 'promocion' ||
                            strtolower($nombreservicio) == 'promoci??n' ||
                            strtolower($nombreservicio) == 'promociones' ||
                            $idservicio == 1
                    ) {

                        // RECORRO PARA OBTENER LOS IDS
                        $keyname = array();
                        $insert = [];
                        $promociones = [];
                        foreach ($_REQUEST as $key => $value) {
                            if (str_contains(strval($key), 'pieza')) {
                                array_push($keyname, str_replace("pieza", "", $key));
                            }
                        }

                        $k = 0;
                        $inidestado = "";
                        while ($k < count($keyname)) {
                            $inidestado = "";
                            try {
                                if (@$_REQUEST['estado' . $keyname[$k]]) {
                                    $inidestado = implode(" @ ", @$_REQUEST['estado' . $keyname[$k]]);
                                } else {
                                    $inidestado = '';
                                }
                            } catch (Throwable $e) {
                                $inidestado = '';
                            }

                            // SUBIMOS LAS IMAGENES POR PRENDA
                            $carpeta_archivo = RUTA_ARCHIVOS . $numero_orden . "/";
                            $inidarchivo = '';
                            $file = @$_FILES['archivo' . $keyname[$k]];
                            if (count($file['name'])) {
                                $fi = 0;
                                while ($fi < count($file['name'])) {
                                    $tmpFilePath = $file['tmp_name'][$fi];
                                    if ($tmpFilePath) {
                                        if ($fi == 0) {
                                            if (!file_exists($carpeta_archivo)) {
                                                mkdir($carpeta_archivo, 0777, true);
                                            }
                                        }
                                        $temp = explode(".", $file["name"][$fi]);
                                        $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                        if ($fi > 0) {
                                            $inidarchivo .= ' @ ';
                                        }
                                        $inidarchivo .= $newfilename;
                                        move_uploaded_file($file["tmp_name"][$fi], $carpeta_archivo . $newfilename);
                                    }

                                    $fi = $fi + 1;
                                }
                            }
                            // FIN SUBIMOS LAS IMAGENES POR PRENDA
                            // SUBIMOS LOS AUDIOS POR PRENDA
                            $carpeta_audio = RUTA_AUDIOS . $numero_orden . "/";
                            $inidaudio = '';
                            $file = @$_FILES['audio' . $keyname[$k]];
                            if (count($file['name'])) {
                                $fi = 0;
                                while ($fi < count($file['name'])) {
                                    $tmpFilePath = $file['tmp_name'][$fi];
                                    if ($tmpFilePath) {
                                        if ($fi == 0) {
                                            if (!file_exists($carpeta_audio)) {
                                                mkdir($carpeta_audio, 0777, true);
                                            }
                                        }
                                        $temp = explode(".", $file["name"][$fi]);
                                        $newfilename = 'M' . generateRandomString() . '.' . end($temp);
                                        if ($fi > 0) {
                                            $inidaudio .= ' @ ';
                                        }
                                        $inidaudio .= $newfilename;
                                        move_uploaded_file($file["tmp_name"][$fi], $carpeta_audio . $newfilename);
                                    }
                                    $fi = $fi + 1;
                                }
                            }
                            // FIN SUBIMOS LOS AUDIOS POR PRENDA

                            $nombrepromocion = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "nombre_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['subidprenda' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $nombreprenda = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "nombre_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['pieza' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $precioprenda = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "precio_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['pieza' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $getCodArt = $pdo->select(
                                    tabla('articulo'),
                                    "codigo_articulo",
                                    [
                                        "id" => intval(@$_REQUEST['pieza' . $keyname[$k]])
                                    ]
                            );

                            $arr = array(
                                'codigoarticulo' => $getCodArt[0],
                                'ordenpromocion' => strval($keyname[$k]),
                                'idorden' => $lastinsert_id,
                                'ordenpromocion' => strval($keyname[$k]),
                                'idpromocion' => @$_REQUEST['subidprenda' . $keyname[$k]],
                                'nombrepromocion' => strval($nombrepromocion[0]['nombre_articulo']),
                                'idprenda' => @$_REQUEST['pieza' . $keyname[$k]],
                                'nombreprenda' => strval($nombreprenda[0]['nombre_articulo']),
                                'color' => @$_REQUEST['color' . $keyname[$k]],
                                'marca' => @$_REQUEST['marca' . $keyname[$k]],
                                'precioprenda' => $precioprenda[0]['precio_articulo'],
                                'nombreestados' => isEmpty(@$inidestado),
                                'observaciones' => isEmpty(@$_REQUEST['observacion' . $keyname[$k]]),
                                'audios' => isEmpty(strval($inidaudio)),
                                'imagenes' => isEmpty(strval($inidarchivo)),
                            );
                            array_push($insert, $arr);
                            unset($arr);

                            $promociones[$nombrepromocion[0]['nombre_articulo']][] = array(
                                'key' => $keyname[$k],
                                'idprenda' => @$_REQUEST['pieza' . $keyname[$k]],
                                'nombreprenda' => $nombreprenda[0]['nombre_articulo'],
                                'color' => @$_REQUEST['color' . $keyname[$k]],
                                'marca' => @$_REQUEST['marca' . $keyname[$k]],
                                'precioprenda' => $precioprenda[0]['precio_articulo'],
                                'nombreestados' => isEmpty(@$inidestado),
                                'observaciones' => isEmpty(@$_REQUEST['observacion' . $keyname[$k]]),
                                'audios' => isEmpty(strval($inidaudio)),
                                'imagenes' => isEmpty(strval($inidarchivo)),
                            );
                            $k = $k + 1;
                            unset($nombrepromocion);
                            unset($nombreprenda);
                            unset($precioprenda);
                        }

                        // AQUI PONGO EL ITEM
                        $item = 100;
                        foreach ($promociones as $promo => $value) {
                            for ($uds = 0; $uds < count($value); $uds++) {
                                $promociones[$promo][$uds]['item'] = $item + ($uds + 1);
                            }
                            $item = $item + 100;
                        }

                        foreach ($promociones as $promocion => $value) {
                            for ($usd = 0; $usd < count($value); $usd++) {

                                $idprenda = $value[$usd]['idprenda'];
                                $nombreprenda = $value[$usd]['nombreprenda'];
                                $color = $value[$usd]['color'];
                                $marca = $value[$usd]['marca'];
                                $precioprenda = $value[$usd]['precioprenda'];
                                $nombreestados = $value[$usd]['nombreestados'];
                                $observaciones = $value[$usd]['observaciones'];
                                $audios = $value[$usd]['audios'];
                                $imagenes = $value[$usd]['imagenes'];

                                $itemnum = $value[$usd]['item'];

                                // COMPARO EL ARRAY
                                for ($ins = 0; $ins < count($insert); $ins++) {
                                    if (
                                            $insert[$ins]['idprenda'] == $idprenda &&
                                            $insert[$ins]['nombreprenda'] == $nombreprenda &&
                                            $insert[$ins]['color'] == $color &&
                                            $insert[$ins]['marca'] == $marca &&
                                            $insert[$ins]['precioprenda'] == $precioprenda &&
                                            $insert[$ins]['nombreestados'] == $nombreestados &&
                                            $insert[$ins]['observaciones'] == $observaciones &&
                                            $insert[$ins]['audios'] == $audios &&
                                            $insert[$ins]['imagenes'] == $imagenes
                                    ) {
                                        $insert[$ins]['item'] = $itemnum;
                                    }
                                    continue;
                                }
                            }
                        }
                        // FIN AQUI PONGO EL ITEM

                        try {
                            $pdo->insert(
                                    tabla('detalleorden'),
                                    $insert
                            );
                        } catch (Exception $e) {
                            echo html_error(strings('error_create'));
                            $pdo->delete(tabla('orden'), [
                                "AND" => [
                                    "id" => $lastinsert_id
                                ]
                            ]);
                            $pdo->delete(tabla('detalleorden'), [
                                "AND" => [
                                    "idorden" => $lastinsert_id
                                ]
                            ]);
                            die();
                        }
                    }

                    // EJM PDF: https://github.com/dompdf/dompdf
                    // DOY PERMISO A LA CARPETA PARA GUARDAR EL PDF
                    chmod(RUTA_PDF, 0755);

                    // CODIGO O NOMBRE DEL PDF
                    $fechahoraunida = date('Ymdhis');
                    $codpdf = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.pdf';
                    $codbar = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.png';

                    $logo = convertirblobimageporruta("../layouts/design/aki/bn-logo.png");

                    //barcode(RUTA_PDF . $codbar, $numero_orden, 20, 'horizontal', 'code128', true);
                    $redColor = [0, 0, 0];
                    file_put_contents(RUTA_PDF . $codbar, $generator->getBarcode($numero_orden, $generator::TYPE_CODE_128, 3, 50, $redColor));

                    // instantiate and use the dompdf class
                    // Quitar padding y margin pdf: https://stackoverflow.com/q/19779285/16488926

                    $height = 0;

                    $html = '
                    <style>
                        @page {
                            margin: 0px 0px 0px 0px !important;
                            padding: 0px 0px 0px 0px !important;
                        }
                    </style>    
                    <center>
                        <img src="' . $logo . '" width="130"/>
                    </center>
                    <br>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">AV.SAN BORJA NORTE 399 LIMA - LIMA -</strong>
                    </center>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">SAN BORJA</strong>
                    </center>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">Tel??f.: 717-8866</strong>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 28px;">ORDEN DE SERVICIO</label>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 25px;">' . @strtoupper(strtolower($nombreservicio)) . '</label>
                    </center>
                    <br>';

                    $html .= '
                    <small style="font-family: sans-serif;line-height: 23px;">ATENDIDO POR: ' . @strtoupper(strtolower(@$_SESSION['nombrecorto'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">FECHA : ' . $fechahoyslash . ' ' . $horahoypm . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . @strtoupper(strtolower(@$_SESSION['nombrecliente'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">TELEFONO : ' . @$_SESSION['telefono'] . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">DIRECCI??N : ' . @strtoupper(strtolower(@$_SESSION['direccion'])) . '</small>
                    <br>
                    ';

                    $html .= '<table cellspacing="0" style="width: 100%;border-top: 1px solid black;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td><b>CANT</b></td>
                            <td><b>DESCRIPCION</b></td>
                            <td><b>IMPORTE</b></td>
                        </tr>                        
                    </table>';

                    $height += 330; // HASTA LA TABLA CANT |   DESCRIPCION    |    IMPORTE                  

                    $copia = $html;

                    if ($promociones) {
                        //$sumaprecios = 0;
                        $html .= '<div style="text-align: left;font-family: sans-serif;">';
                        $copia .= '<div style="text-align: left;font-family: sans-serif;">';
                        foreach ($promociones as $promo => $prendas) {
                            $html .= "1 &nbsp;" . $promo . "<br>";
                            $copia .= "1 &nbsp;" . $promo . "<br>";
                            $height += 14;

                            for ($pre = 0; $pre < count(@$prendas); $pre++) {
                                $html .= "&nbsp;&nbsp;&nbsp; (1)&nbsp;" . @$prendas[$pre]['nombreprenda'] . " <label style='float: right;'>" . $prendas[$pre]['precioprenda'] . "</label><br>";
                                $copia .= "&nbsp;&nbsp;&nbsp; (1)&nbsp;" . @$prendas[$pre]['nombreprenda'] . " <label style='float: right;'>" . $prendas[$pre]['precioprenda'] . "</label><br>";
                                $html .= "&nbsp;&nbsp;&nbsp; " . @$prendas[$pre]['color'] . " / ";
                                $copia .= "&nbsp;&nbsp;&nbsp; " . @$prendas[$pre]['color'] . " / ";
                                $html .= "&nbsp;&nbsp;" . @$prendas[$pre]['marca'];
                                $copia .= "&nbsp;&nbsp;" . @$prendas[$pre]['marca'];
                                $height += (14 * 3);
                                if (@$prendas[$pre]['nombreestados']) {
                                    $html .= "<br>&nbsp;&nbsp;&nbsp; " . str_replace(' @ ', ',', $prendas[$pre]['nombreestados']) . "<br>";
                                    $copia .= "<br>&nbsp;&nbsp;&nbsp; " . str_replace(' @ ', ',', $prendas[$pre]['nombreestados']) . "<br>";
                                } else {
                                    $html .= "<br>";
                                    $copia .= "<br>";
                                }
                                //$sumaprecios = $sumaprecios + @$prendas[$pre]['precioprenda'];
                            }
                        }
                        $html .= "<br><strong>TOTAL A PAGAR : S/.</strong>" . " <strong style='float: right;'>" . number_format($pagototal, 2, '.', '') . "</strong><br>";
                        $copia .= "<br><strong>TOTAL A PAGAR : S/.</strong>" . " <strong style='float: right;'>" . number_format($pagototal, 2, '.', '') . "</strong><br>";
                        $html .= '</div><br>';
                        $copia .= '</div><br>';

                        // GUARDO EL JSON DE LAS PROMOCIONES
                        $pdo->update(tabla('orden'),
                                [
                                    "array_detalleorden" => json_encode($promociones)
                                ],
                                [
                                    "id" => $lastinsert_id
                                ]
                        );

                        echo $html;
                        die();
                        // FIN GUARDO EL JSON DE LAS PROMOCIONES
                    } else if ($piezas) {
                        $html .= '<div style="text-align: left;font-family: sans-serif;">';
                        $copia .= '<div style="text-align: left;font-family: sans-serif;">';
                        $ti = 0;
                        $sumarPrecios = 0;
                        while ($ti < count($piezas)) {
                            $sumarPrecios = $piezas[$ti]['precio'];
                            $iPiezas = $piezas[$ti]['piezas'];
                            $html .= "1 &nbsp;" . $piezas[$ti]['nombreprenda'] . " <strong style='float: right;'>" . $piezas[$ti]['precio'] . "</strong><br>";
                            $copia .= "1 &nbsp;" . $piezas[$ti]['nombreprenda'] . " <strong style='float: right;'>" . $piezas[$ti]['precio'] . "</strong><br>";
                            //$height += 30;
                            $height += 14;
                            if (count($iPiezas) >= 2) {
                                $yi = 0;
                                while ($yi < count($iPiezas)) {
                                    $html .= "&nbsp;&nbsp; (1) &nbsp;" . @$iPiezas[$yi]['nombrepieza'] . "<br>";
                                    $copia .= "&nbsp;&nbsp; (1) &nbsp;" . @$iPiezas[$yi]['nombrepieza'] . "<br>";
                                    $html .= "&nbsp;&nbsp;&nbsp;" . @$piezas[$ti]['color'] . " / ";
                                    $copia .= "&nbsp;&nbsp;&nbsp;" . @$piezas[$ti]['color'] . " / ";

                                    $html .= "&nbsp;&nbsp;" . @$piezas[$ti]['marca'] . "<br>";
                                    $copia .= "&nbsp;&nbsp;" . @$piezas[$ti]['marca'] . "<br>";
                                    if ($iPiezas[$yi]['nombresestados']) {
                                        $html .= "&nbsp;&nbsp;&nbsp;" . str_replace(" @ ", ',', $iPiezas[$yi]['nombresestados']) . "<br>";
                                        $copia .= "&nbsp;&nbsp;&nbsp;" . str_replace(" @ ", ',', $iPiezas[$yi]['nombresestados']) . "<br>";
                                    }
                                    $yi = $yi + 1;

                                    $height += (3 * 14);
                                }
                            } else if (count($iPiezas) == 1) {
                                $html .= "&nbsp;&nbsp;&nbsp;" . @$piezas[$ti]['color'] . " / ";
                                $copia .= "&nbsp;&nbsp;&nbsp;" . @$piezas[$ti]['color'] . " / ";
                                $html .= "&nbsp;&nbsp;" . @$piezas[$ti]['marca'] . "<br>";
                                $copia .= "&nbsp;&nbsp;" . @$piezas[$ti]['marca'] . "<br>";
                                if (@$iPiezas[0]['nombresestados']) {
                                    $html .= "&nbsp;&nbsp;&nbsp;" . str_replace(" @ ", ',', $iPiezas[0]['nombresestados']) . "<br>";
                                    $copia .= "&nbsp;&nbsp;&nbsp;" . str_replace(" @ ", ',', $iPiezas[0]['nombresestados']) . "<br>";
                                }
                                $height += 42;
                            }

                            $ti = $ti + 1;
                        }
                        $html .= "<br><strong>TOTAL A PAGAR : S/.</strong>" . " <strong style='float: right;'>" . number_format($pagototal, 2, '.', '') . "</strong><br>";
                        //$height += 50;

                        $copia .= "<br><strong>TOTAL A PAGAR : S/.</strong>" . " <strong style='float: right;'>" . number_format($pagototal, 2, '.', '') . "</strong><br>";
                        $html .= '</div><br>';
                        $copia .= '</div><br>';

                        // GUARDO EL JSON DE LAS PIEZAS
                        $pdo->update(tabla('orden'),
                                [
                                    "array_detalleorden" => json_encode($piezas)
                                ],
                                [
                                    "id" => $lastinsert_id
                                ]
                        );
                        // FIN GUARDO EL JSON DE LAS PIEZAS
                    }

                    $html .= '
                    <!-- VA ABAJO DE LAS PRENDAS -->
                    <label style="font-family: sans-serif;font-size: 17px;font-weight: bold">FECHA DE ENTREGA:</label><br>
                    <strong style="font-family: sans-serif;">' . @ucwords(nombreDia($fechadeentrega)) . ', ' . date('d/m/Y', strtotime($fechadeentrega)) . ' ' . date('h:i A', strtotime($horahoypm)) . '</strong><br>
                    <strong style="font-family: sans-serif;"><u>' . $tipo_cobro . '</u></strong>
                    <center>
                        <img src="' . convertirblobimageporruta(RUTA_PDF . $codbar) . '" alt="" style="width: 80%;height: 85px;margin-bottom: 12px;"/><br>
                        <p>
                            <strong style="font-size: 35px;color: black;font-weight: bold;font-family: sans-serif;">' . $numero_orden . '</strong>
                        </p>
                    </center>';
                    //$height += 50;

                    $copia .= '
                    <!-- VA ABAJO DE LAS PRENDAS -->
                    <label style="font-family: sans-serif;font-size: 17px;font-weight: bold">FECHA DE ENTREGA:</label><br>
                    <strong style="font-family: sans-serif;">' . @ucwords(nombreDia($fechadeentrega)) . ', ' . date('d/m/Y', strtotime($fechadeentrega)) . ' ' . date('h:i A', strtotime($horahoypm)) . '</strong><br>
                    <strong style="font-family: sans-serif;"><u>' . $tipo_cobro . '</u></strong>
                    <center>
                        <img src="' . convertirblobimageporruta(RUTA_PDF . $codbar) . '" alt="" style="width: 80%;height: 85px;margin-bottom: 12px;"/><br>
                        <p>
                            <strong style="font-size: 35px;color: black;font-weight: bold;font-family: sans-serif;">' . $numero_orden . '</strong>
                        </p>
                    </center>';
                    //$height += 20;
                    // AQUI SOLO CLIENTE
                    $copia .= '<center><strong style="font-family: sans-serif;font-size: 25px;">COPIA INTERNA</strong></center><br>';
                    // FIN AQUI SOLO CLIENTE
                    // AQUI VARIA - SOLO DRIVER
                    $html .= '<strong style="font-family: sans-serif;">Condiciones del servicio</strong><br><strong style="font-family: sans-serif;font-size: 11px;">Visita nuestra pagina web: www.lavanderiaaki.com e inf??rmese de las condiciones de nuestro servicio</strong><br>';
                    // FIN AQUI VARIA - SOLO DRIVER

                    $html .= '<input type="hidden" hidden="hidden" id="idpdfexist" name="idpdfexist" value="' . $codpdf . '"> ';

                    $height += 320;

                    //echo $html2pdf;
                    //die();
                    //$htmlDriver = $html;
                    //$html2pdf = $html . $htmlDriver;
                    $dompdf = new Dompdf();
                    unlink(RUTA_PDF . $codbar);
                    $dompdf->loadHtml($html . "<br><hr><br>" . $copia);
                    $dompdf->set_option('isRemoteEnabled', TRUE);
                    $dompdf->set_paper(array(0, 0, 280, ($height * 2)));
                    $dompdf->render();
                    $output = $dompdf->output();
                    file_put_contents(RUTA_PDF . $codpdf, $output);
                    echo $html;
                    die();
                }
            } else {
                echo html_error(strings('error_empty'));
            }
        } else {
            echo html_error(strings('error_cmd'));
        }
    } else {
        echo html_error(strings('error_method'));
    }
} else {
    echo html_error(strings('error_ajax'));
}

//'X-Requested-With', 'XMLHttpRequest'
//header('Content-Type: application/json');
//echo json_encode($json, JSON_UNESCAPED_UNICODE);

