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
        if ($cmd == 'registrarrecojoreclamo') {

            $idorden = input('iddeorden'); // INTEGER
            $key = input('keyprenda'); // Key Unique
            $idprenda = input('prenda');
            $nombredeprenda = input('nombredeprenda');
            $idservicio = input('idservicio');
            $nombreservicio = input('nombreservicio');
            $numerodeorden = input('numerodeorden');
            $color = input('color');
            $marca = input('marca');
            $observacion = input('observacion');
            $fechadeentrega = input('fechadeentrega');
            $horadeentrega = date('H:i:s');
            $audios = inputArray('audio');
            $archivos = inputArray('archivo');

            if (
                    !empty($idorden) &&
                    !empty($idprenda) &&
                    !empty($nombredeprenda) &&
                    !empty($idservicio) &&
                    !empty($nombreservicio) &&
                    !empty($numerodeorden) &&
                    !empty($color) &&
                    !empty($marca) &&
                    !empty($fechadeentrega) &&
                    !empty($key)
            ) {

                $inestados = inputTextArray('estado');
                if ($inestados) {
                    $inestados = @implode(" @ ", inputTextArray('estado'));
                }

                $in_audios = '';
                $in_archivos = '';

                $getzona = $pdo->select(
                        tabla('zona'),
                        [
                            "puesto_zona",
                        ],
                        [
                            "id" => intval(@$_SESSION[atributo('id_zona')])
                        ]
                );

                try {

                    $pdo->insert(
                            tabla('reclamoxprenda'),
                            [
                                "fechaentrega" => $fechadeentrega,
                                "horaentrega" => $horadeentrega,
                                //"numeroorden" => $numerodeorden,
                                "origennumeroorden" => $numerodeorden,
                                "idcliente" => $_SESSION['idclientetemp'],
                                "idrepartidor" => $_SESSION['id'],
                                'nombrecliente' => $_SESSION['nombrecliente'],
                                'nombrerepartidor' => $_SESSION['nombrecorto'],
                                'idzona' => @$getzona[0]['puesto_zona'],
                                'idprenda' => $idprenda,
                                'nombreprenda' => $nombredeprenda,
                                'color' => $color,
                                'marca' => $marca,
                                'observacion' => isEmpty($observacion),
                                'estados' => isEmpty($inestados),
                                'audio' => isEmpty($in_archivos),
                                'imagen' => isEmpty($in_audios),
                                'ordenprenda' => $key
                            ]
                    );

                    $account_id = $pdo->id();

                    $explode = explode('-', $numerodeorden);
                    $numerodeordendereclamo = @$getzona[0]['puesto_zona'] . '-' . zero_fill(@$explode[1], 7);

                    if ($account_id) {


                        // RECORRO SI LOS AUDIOS Y ARCHIVOS SI ES QUE HAY Y LE PASO PARA ACTUALIZAR ABAJO    
                        // Looping all files
                        $countfiles = count(array_filter($_FILES['archivo']['name']));
                        $countmusic = count(array_filter($_FILES['audio']['name']));
                        if ($countfiles >= 1) {
                            $carpeta_archivo = RUTA_ARCHIVOS . $numerodeordendereclamo . "/";

                            // CREO LA CARPETA CON EL NOMBRE DEL SERVICIO
                            if (!file_exists($carpeta_archivo)) {
                                mkdir($carpeta_archivo, 0777, true);
                            }

                            $fi = 0;
                            while ($fi < count($archivos['archivo']['name'])) {
                                $temp = explode(".", $archivos['archivo']["name"][$fi]);
                                $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                if ($fi > 0) {
                                    $in_archivos .= ' @ ';
                                }
                                $in_archivos .= $newfilename;
                                move_uploaded_file($archivos['archivo']["tmp_name"][$fi], $carpeta_archivo . $newfilename);
                                $fi = $fi + 1;
                            }
                        }
                        if ($countmusic >= 1) {
                            $carpeta_archivo = RUTA_AUDIOS . $numerodeordendereclamo . "/";

                            // CREO LA CARPETA CON EL NOMBRE DEL SERVICIO
                            if (!file_exists($carpeta_archivo)) {
                                mkdir($carpeta_archivo, 0777, true);
                            }

                            $fi = 0;
                            while ($fi < count($audios['audio']['name'])) {
                                $temp = explode(".", $audios['audio']["name"][$fi]);
                                $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                if ($fi > 0) {
                                    $in_audios .= ' @ ';
                                }
                                $in_audios .= $newfilename;
                                move_uploaded_file($audios['audio']["tmp_name"][$fi], $carpeta_archivo . $newfilename);

                                $fi = $fi + 1;
                            }
                        }


                        //UPDATE
                        $data = $pdo->update(
                                tabla('reclamoxprenda'),
                                [
                                    "numeroorden" => @$getzona[0]['puesto_zona'] . '-' . zero_fill($account_id, 7),
                                    'audio' => isEmpty($in_archivos),
                                    'imagen' => isEmpty($in_audios),
                                ],
                                [
                                    "id" => $account_id
                                ]
                        );

                        //UPDATE TURNO X CLIENTE
                        $pdo->update(
                                tabla('turnoxcliente'),
                                [
                                    "atencion" => 'Atendido',
                                ],
                                [
                                    "id" => intval($_SESSION['idturnoxrepartidortemp'])
                                ]
                        );

                        //UPDATE ORDEN
                        $pdo->update(
                                tabla('orden'),
                                [
                                    "tipo_atencion" => 'Reclamo',
                                    "flag" => 2
                                ],
                                [
                                    "numeroorden" => trim($numerodeorden)
                                ]
                        );

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
    } else {
        $json['msg'] = strings('error_method');
    }
} else {
    $json['msg'] = strings('error_ajax');
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json['status'], JSON_UNESCAPED_UNICODE);
