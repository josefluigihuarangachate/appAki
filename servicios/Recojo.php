<?php

include './include/app.php';
include './include/session.php';

// Barcode github: https://github.com/davidscotttufts/php-barcode
include './Barcode.php';
$html = ob_get_clean();

use Dompdf\Dompdf;

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        $cmd = input('cmd');

        if ($cmd == 'registrarrecojo') {
            $idservicio = input('servicio');
            $nombreservicio = input('nombreservicio');
            $diaxservicio = input('diasservicios');
            $fechadeentrega = input('fechadeentrega');
            $pagototal = input('pagototal');
            $tipo_cobro = 'Por Cobrar';

            if (
                    !empty($idservicio) &&
                    !empty($nombreservicio) &&
                    intval($diaxservicio) >= 1 &&
                    $fechadeentrega != date('Y-m-d') &&
                    intval($pagototal) > 0
            ) {
                // ESTE ES LA FECHA MINIMA, SEGUN LOS DIAS DEL SERVICIO
                $fechamindeentrega = input('fechaminimodeentrega');
                // $fechadeentrega = ES LA FECHA A LA CUAL SE DEBE DE ENTREGAR EL ARTICULO O PRENDA  

                $zona = $pdo->select(
                        tabla('zona'),
                        [
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
                $horahoy = date('h:i:s');
                $horahoypm = $horahoy . ' ' . date('A');

                $pdo->insert(
                        tabla('orden'),
                        [
                            "nombre_servicio" => @strtoupper(strtolower($nombreservicio)),
                            "nombre_repartidor" => @ucwords(strtolower(@$_SESSION['nombrecorto'])), // NOMBRE CORTO DEL REPARTIDOR
                            "fecha" => $fechahoy,
                            "hora" => $horahoy,
                            "nombre_cliente" => @ucwords(strtolower(@$_SESSION['nombrecliente'])),
                            "celular_cliente" => @$_SESSION['telefono'],
                            "direccion_cliente" => @$_SESSION['direccion'],
                            "fecha_entrega" => $fechadeentrega,
                            "hora_entrega" => '',
                            "tipo_cobro" => $tipo_cobro,
                            "numero_orden" => @$zona[0]['puesto_zona'],
                            "total_s_dscto" => '',
                            "descuento" => '',
                            "total_pagar" => $pagototal,
                            "a_cuenta" => '',
                            "saldo" => '',
                            "estado" => 'Activo'
                        ]
                );

                $lastinsert_id = $pdo->id();
                $codpdf = "";
                $codbar = "";

                if ($lastinsert_id) {

                    // EJM PDF: https://github.com/dompdf/dompdf
                    // DOY PERMISO A LA CARPETA PARA GUARDAR EL PDF
                    chmod(RUTA_PDF, 0755);

                    // CODIGO O NOMBRE DEL PDF
                    $fechahoraunida = date('Ymdhis');
                    $codpdf = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.pdf';
                    $codbar = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.png';

                    $logo = convertirblobimageporruta("../layouts/design/aki/bn-logo.png");

                    barcode(RUTA_PDF . $codbar, strtoupper(@$zona[0]['puesto_zona']) . '-', 20, 'horizontal', 'code128', true);

                    // instantiate and use the dompdf class
                    // Quitar padding y margin pdf: https://stackoverflow.com/q/19779285/16488926
                    $dompdf = new Dompdf();
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
                        <strong style="font-family: sans-serif;line-height: 23px;">Teléf.: 717-8866</strong>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 28px;">ORDEN DE SERVICIO</label>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 25px;">' . @strtoupper(strtolower($nombreservicio)) . '</label>
                    </center>
                    <br>
                    <small style="font-family: sans-serif;line-height: 23px;">ATENDIDO POR: ' . @strtoupper(strtolower(@$_SESSION['nombrecorto'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">FECHA : ' . $fechahoyslash . ' ' . $horahoypm . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . @strtoupper(strtolower(@$_SESSION['nombrecliente'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">TELEFONO : ' . @$_SESSION['telefono'] . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">DIRECCIÓN : ' . @strtoupper(strtolower(@$_SESSION['direccion'])) . '</small>
                    <br>
                    <br>
                    
                    <table cellspacing="0" style="width: 100%;border-top: 1px solid black;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td><b>CANT</b></td>
                            <td><b>DESCRIPCION</b></td>
                            <td><b>IMPORTE</b></td>
                        </tr>                        
                    </table>
                    <!--<table cellspacing="0" style="width: 100%;border: 0px solid transparent;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td>1</td>
                            <td>Chompa</td>
                            <td>23.00</td>
                        </tr>                        
                    </table>-->


                    <!-- VA ABAJO DE LAS PRENDAS -->
                    <label style="font-family: sans-serif;font-size: 17px;font-weight: bold">FECHA DE ENTREGA:</label><br>
                    <strong style="font-family: sans-serif;">' . @ucwords(nombreDia($fechadeentrega)) . ', ' . date('d/m/Y', strtotime($fechadeentrega)) . ' ' . date('h:i A', strtotime($horahoypm)) . '</strong><br>
                    <strong style="font-family: sans-serif;"><u>' . $tipo_cobro . '</u></strong>
                    <center>
                        <img src="' . convertirblobimageporruta(RUTA_PDF . $codbar) . '" alt="" style="width: 80%;height: 85px;"/>
                    </center>
                    <strong style="font-family: sans-serif;">Condiciones del servicio</strong><br>
                    <strong style="font-family: sans-serif;font-size: 11px;">Visita nuestra pagina web: www.lavanderiaaki.com e infórmese de las condiciones de nuestro servicio</strong><br>
                        
                    <input type="hidden" hidden="hidden" id="idpdfexist" name="idpdfexist" value="' . $codpdf . '">                    
                    ';

                    unlink(RUTA_PDF . $codbar);
                    $dompdf->loadHtml($html);
                    $dompdf->set_option('isRemoteEnabled', TRUE);
                    $dompdf->set_paper(array(0, 0, 280, 492));
                    $dompdf->render();
                    $output = $dompdf->output();
                    file_put_contents(RUTA_PDF . $codpdf, $output);
                    echo $html;
                    die();

                    // FALTA REGISTRAR LAS CANTIDADES
                }

                if ($lastinsert_id) {
                    if (
                            $idservicio === 1 ||
                            strtolower($nombreservicio) == 'promociones' ||
                            strtolower($nombreservicio) == 'promocion' ||
                            strtolower($nombreservicio) == 'promoción'
                    ) {
                        // CUANDO ES PROMOCION
                    } else if ($idservicio > 1) {
                        // CUANDO ES PRENDA O POR PIEZAS
                    }
                } else {
                    $json['msg'] = strings('error_create');
                }
            } else {
                $json['msg'] = strings('error_empty');
            }

//            $totalOrden = input('numOrden');
//            if ($totalOrden > 0) {
//                $inserts = [];
//                $i = 1;
//                while ($i <= $totalOrden) {
//                    $idsestados = "";
//                    $nombresimagenes = "";
//                    // SI INPUT EXISTE
//                    if (
//                            !empty(@input('sop' . $i))
//                    ) {
//
//                        // VERIFICO SI HAY ESTADOS SELECCIONADOS
//                        @$check = @inputArray('chk' . $i);
//                        if (
//                                !empty(@$check)
//                        ) {
//                            for ($chk = 0; $chk < count(@$check); $chk++) {
//                                $idsestados .= @$check[$chk];
//                                if ($chk < (count(@$check) - 1)) {
//                                    $idsestados .= ",";
//                                }
//                            }
//                        }
//
//                        // VERIFICO SI HAY IMAGENES
//                        @$images = @$_FILES['file' . $i]['name'];
//
//                        if (
//                                !empty(@$images)
//                        ) {
//                            for ($img = 0; $img < count(@$images); $img++) {
//
//
//                                $newfilename = 'RD' . date('dmYHis') . str_replace(" ", "", basename(inputfile('file' . $i, 'name', $img)));
//                                echo "Hay imagenes: ";
//                                imprimir($_FILES);
//                                //move_uploaded_file($_FILES["file"]["tmp_name"], "../img/imageDirectory/" . $newfilename);
//
//                                $nombresimagenes .= " " . $newfilename;
//                            }
//                        }
//
//
//                        $inserts[] = array(
//                            'idarticulo' => @input('sop' . $i),
//                            'idprenda' => @input('pre' . $i),
//                            'idservicio' => @input('ser' . $i),
//                            'dias' => @input('dia' . $i), // CORREGIR NO SE ESTA MOSTRANDO
//                            'precio' => @input('prc' . $i),
//                            'fecha' => @input('fec' . $i),
//                            'estados' => $idsestados,
//                            'observaciones' => @input('obs' . $i),
//                            'archivos' => trim($nombresimagenes),
//                        );
//                    }
//
//                    $i = $i + 1;
//                    continue;
//                }
//
//                if (!empty($inserts)) {
//                    
//                }
//
//                echo "Array:";
//                imprimir($inserts);
//                die();
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
//            }
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
