<?php

// PHPMAILER
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include './include/app.php';
include './include/session.php';

// PHPMAILER
$mail = new PHPMailer(true);

// PDF
use Dompdf\Dompdf;

// CODIGO QR
// http://phpqrcode.sourceforge.net/
// https://stackoverflow.com/a/24019129
include './phpqrcode/qrlib.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'confirmarentregaexitosa') {
            $numerodeordenes = input('numerosdeordenes');

            $id_cliente = input('idcliente');
            $metododepago = @input('tipodepago');
            // COORDENADAS DEL CLIENTE
            $latitud_cliente = input('latitud');
            $longitud_cliente = input('longitud');
            $facturaelectronica = input('facturaelectronica'); // ninguno, boleta, factura
            $dniruc = input("dniruc");
            $razonsocial = input("razonsocial");
            $correoelectronico = input("correoelectronico");
            $enviarporcorreo = input("enviarporcorreo") === 'true' ? true : false;

            // ACTUALIZO EL CORREO DEL CLIENTE
            try {
                if ($correoelectronico) {
                    $updateTurnoxCliente = $pdo->update(
                            tabla('cliente'),
                            [
                                'Email_Cliente' => $correoelectronico
                            ],
                            [
                                "AND" => [
                                    "id" => $id_cliente
                                ]
                            ]
                    );
                }

                if ($facturaelectronica == 'factura') {
                    $updateTurnoxCliente = $pdo->update(
                            tabla('cliente'),
                            [
                                'nombreempresa' => strtoupper($razonsocial)
                            ],
                            [
                                "AND" => [
                                    "id" => $id_cliente
                                ]
                            ]
                    );
                }
            } catch (Throwable $e) {
                
            }
            // FIN ACTUALIZO EL CORREO DEL CLIENTE

            if ($numerodeordenes) {

                // numserieboleta, numseriefactura
                // LE PASAMOS POR EJEMPLO: C1-0543,C1-0534,C1-64564 EN ESE FORMATO, CON ESO ACTUALIZA 
                // LAS ORDENES DE SERVICIOS QUE LE PASAMOS
                $arraynumerodeordenes = $numerodeordenes; //explode(",", $numerodeordenes); // SOLO SERA PARA UNA ORDEN
                $html_factura = "";

                $logo = convertirblobimageporruta("../layouts/design/aki/bn-logo.png");
                $dompdf = new Dompdf();

                $fecha = date("Y-m-d");
                $fechaslash = date("d/m/Y");
                $hora = date("H:i");
                $fechahoraunida = date("Ymd") . str_replace(":", "", $hora) . "00";

                $titulo = "";
                $serie = "";
                $tipocliente = "";
                $nombredelcliente = "";
                $tipodedocumento = "";
                $detalleorden = "";
                $inicial = "";

                $data = $pdo->select(
                        tabla('orden'),
                        [
                            //INNER JOIN
                            "[><]" . tabla('cliente') =>
                            [
                                tabla('orden') . ".idcliente" => "id"
                            ],
                            //INNER JOIN
                            "[><]" . tabla('detalleorden') =>
                            [
                                tabla('orden') . ".id" => "idorden"
                            ],
                        ],
                        [
                            // ESTOS DATOS JALO DE LA TABLA ATENCION
                            tabla('cliente') . ".NumeroDocumento_Cliente(numerodedocumento)",
                            tabla('cliente') . ".nombreempresa(nombredeempresa)",
                            tabla('orden') . ".nombre_servicio(nombredeservicio)",
                            tabla('cliente') . ".id(idcliente)",
                            tabla('orden') . ".nombre_cliente(nombredecliente)",
                            tabla('orden') . ".array_detalleorden(detalledeorden)",
                            tabla('orden') . '.idservicio(idservicio)',
                            tabla('orden') . '.nombre_servicio(nombredeservicio)',
                        ],
                        [
                            // WHERE
                            tabla('orden') . '.numeroorden' => $arraynumerodeordenes,
                        ],
                );

                $idservicio = @$data[0]['idservicio'];
                $nombredeservicio = @$data[0]['nombredeservicio'];
                $numerodedocumento = @$data[0]['numerodedocumento'];
                $idtipodefacturasig = 0;
                $codigodesunat = 0;

                if ($facturaelectronica == 'boleta') {
                    $titulo = "BOLETA DE VENTA ELECTRONICA";
                    $serie = $_SESSION['numserieboleta'] . '-';
                    $nombredelcliente = @$data[0]['nombredecliente'];
                    $tipocliente = "Doc. Identidad: " . @$data[0]['numerodedocumento'];
                    $tipodedocumento = "DNI";
                    $detalleorden = @$data[0]['detalledeorden'];
                    $inicial = "B";
                    $nametable = "boleta";
                    $idtipodefacturasig = 2;
                    $codigodesunat = '03';
                } else if ($facturaelectronica == 'factura') {
                    $titulo = "FACTURA ELECTRONICA";
                    $serie = $_SESSION['numseriefactura'] . '-';
                    $nombredelcliente = @$data[0]['nombredeempresa'];
                    $tipocliente = "Numero de RUC: " . @$data[0]['numerodedocumento'];
                    $tipodedocumento = "RUC";
                    $detalleorden = @$data[0]['detalledeorden'];
                    $inicial = "F";
                    $nametable = "factura";
                    $idtipodefacturasig = 1;
                    $codigodesunat = '01';
                }

                try {

                    $pdo->insert(
                            tabla($nametable),
                            [
                                "idrepartidor" => @$_SESSION['id'],
                                "nombrerepartidor" => @$_SESSION['nombrerepartidor'],
                                "idservicio" => $idservicio,
                                "nombreservicio" => $nombredeservicio,
                                "tipofactura" => ucwords(strtolower($facturaelectronica)),
                                "numeroserie" => isEmpty(''),
                                "numeroorden" => $arraynumerodeordenes,
                                "tipodocumento" => $tipodedocumento,
                                "dniruc" => @$data[0]['numerodedocumento'],
                                "nombrecliente" => $nombredelcliente,
                                "idcliente" => @$data[0]['idcliente'],
                                "fecha" => $fecha,
                                "hora" => $hora . ':00',
                                "detalleorden" => @$data[0]['detalledeorden'],
                                "nombredocumento" => isEmpty('')
                            ]
                    );

                    $account_id = $pdo->id();

                    $numerodefactura = $serie . zero_fill($account_id, 7);

                    $codpdf = $numerodefactura . $fechahoraunida . '.pdf';

                    try {
                        $pdo->update(
                                tabla($nametable),
                                [
                                    "numeroserie" => $numerodefactura,
                                    "nombredocumento" => $codpdf
                                ],
                                [
                                    "id" => $account_id
                                ]
                        );
                    } catch (Throwable $e) {
                        
                    }

                    $height = 0;
                    $arrayItems = array();
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
                        <strong style="font-family: sans-serif;line-height: 23px;">LAVANDERIA AKI DRY<br>CLEANERS</strong>
                    </center>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">RUC: 20123257899</strong>
                    </center>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">AV.SAN BORJA NORTE 399 SAN BORJA - </strong>
                    </center>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">LIMA</strong>
                    </center>
                    <br>
                    <center>
                        <strong style="font-family: sans-serif;line-height: 23px;">Tel??f.: 717-8866</strong>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 28px;">' . $titulo . '</label>
                    </center>
                    <center>
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 28px;">Nro. ' . $numerodefactura . '</label>
                    </center>
                    <br>
                    
                    <small style="font-family: sans-serif;line-height: 23px;">FECHA DE EMISION : ' . $fechaslash . ' ' . $hora . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">MONEDAS : Soles</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . $nombredelcliente . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">' . $tipocliente . '</small><br>
                    <br>
                    <br>
                    
                    <table cellspacing="0" style="width: 100%;border-top: 1px solid black;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td><b>CANT.</b></td>
                            <td><b>DESCRIPCION</b></td>
                            <td><b>P.UNIT</b></td>
                            <td><b>TOTAL</b></td>
                        </tr>                        
                    ';
                    $height += 394; // HASTA LA TABLA CANT |   DESCRIPCION    |    IMPORTE     

                    $promociones = objectToArray(json_decode($detalleorden));
                    $piezas = objectToArray(json_decode($detalleorden));

                    $pagototal = 0;
                    $indexItem = 0;
                    $contItem = 1;
                    $contpromociones = 1;
                    if (
                            $nombredeservicio == 'PROMOCIONES' ||
                            $nombredeservicio == 'PROMOCION' ||
                            $nombredeservicio == 'PROMOCI??N'
                    ) {
                        $pagototal = 0;
                        $prendasarray = [];
                        //$html .= '<div style="text-align: left;font-family: sans-serif;">';
                        foreach ($promociones as $promo => $prendas) {
                            $html .= "<tr>";
                            $html .= "<td colspan='2'>1 UNAD &nbsp;" . $promo;
                            $preciostotal = [];

                            $prdas = "";
                            for ($pre = 0; $pre < count(@$prendas); $pre++) {
                                $preciostotal[] = $prendas[$pre]['precioprenda'];
                                $prdas .= "&nbsp;&nbsp;&nbsp; 1 &nbsp;" . @$prendas[$pre]['nombreprenda']; //$prendas[$pre]['precioprenda'] . "</label>";
                                if ($pre < (count(@$prendas) - 1)) {
                                    $prdas .= ",";
                                }
                            }
                            $html .= "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $prdas . "</td>";
                            $sumpreciostotal = array_sum($preciostotal) - min($preciostotal);
                            $pagototal = $pagototal + $sumpreciostotal;
                            $precio_unitario = $sumpreciostotal / 1.18;
                            $html .= "<td><label style='float: right;'>" . number_format($precio_unitario, 2, '.', '') . "</label></td>";
                            $html .= "<td><label style='float: right;'>" . number_format($sumpreciostotal, 2, '.', '') . "</label></td>";
                            $html .= "</tr>";
                            $indexItem = $indexItem + 1;

                            // --------- ITEM PARA LA FACTURA O BOLETA ---------
                            $idpromoselect = $pdo->select(
                                    tabla("articulo"),
                                    [
                                        "codigo_articulo",
                                        "unidadmedida_articulo",
                                        "precio_articulo"
                                    ],
                                    [
                                        "nombre_articulo" => $promo
                                    ],
                                    [
                                        "LIMIT" => 1
                                    ]
                            );

                            $precioigv = $sumpreciostotal / 1.18;
                            $itemIGVMonto = $sumpreciostotal - $precioigv;
                            $arrayItems[] = array(
                                'item' => $contpromociones,
                                'prodCodigoInterno' => $idpromoselect[0]['codigo_articulo'],
                                'prodUniMedida' => $idpromoselect[0]['unidadmedida_articulo'],
                                'prodCantidad' => '1.000',
                                'prodDescripcion' => trim(strval($promo)),
                                'prodPrecioUnitario' => number_format($sumpreciostotal, 4, '.', ''),
                                'prodPrecioVenta' => number_format($sumpreciostotal, 4, '.', ''),
                                'itemDscto' => '0',
                                'itemValorVenta' => number_format($sumpreciostotal, 4, '.', ''),
                                'ItemAfectacion' => '0',
                                'itemObservacion' => '',
                                'itemICBPER' => 0.00,
                                'itemIGVMonto' => number_format($itemIGVMonto, 4, '.', ''),
                            );
                            $contpromociones = $contpromociones + 1;
                            // ----------- ------------------------ ------------
                        }
                        $op_gravada = $pagototal / 1.18;
                        $igv = $op_gravada * 0.18;

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>OP. GRAVADA</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($op_gravada, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>IGV</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($igv, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>TOTAL A PAGAR</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($pagototal, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= '</table>';
                    } else {
                        $arrpagototal = [];
                        //$html .= '<div style="text-align: left;font-family: sans-serif;">';
                        $prendasarray = [];
                        for ($p = 0; $p < count($piezas); $p++) {

                            // --------- ITEM PARA LA FACTURA O BOLETA ---------
                            $idpromoselect = $pdo->select(
                                    tabla("articulo"),
                                    [
                                        "codigo_articulo",
                                        "unidadmedida_articulo",
                                        "precio_articulo"
                                    ],
                                    [
                                        "nombre_articulo" => $piezas[$p]['nombreprenda']
                                    ],
                                    [
                                        "LIMIT" => 1
                                    ]
                            );
                            $prendasarray[] = trim($piezas[$p]['nombreprenda']);
                            $arrayItems[$piezas[$p]['nombreprenda']] = array();
                            $arrayItems[$piezas[$p]['nombreprenda']]['item'] = strval(1); // strval($contItem);
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodCodigoInterno'] = $idpromoselect[0]['codigo_articulo'];
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodUniMedida'] = $idpromoselect[0]['unidadmedida_articulo'];
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodCantidad'] = number_format(countwordrepeat($prendasarray, trim($piezas[$p]['nombreprenda'])), 3, '.', '');
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodDescripcion'] = $piezas[$p]['nombreprenda'];
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodPrecioUnitario'] = number_format($idpromoselect[0]['precio_articulo'], 4, '.', ''); // $idpromoselect[0]['precio_articulo'];
                            $arrayItems[$piezas[$p]['nombreprenda']]['prodPrecioVenta'] = number_format($idpromoselect[0]['precio_articulo'], 4, '.', '');
                            $arrayItems[$piezas[$p]['nombreprenda']]['itemDscto'] = '0';
                            $arrayItems[$piezas[$p]['nombreprenda']]['itemValorVenta'] = number_format($idpromoselect[0]['precio_articulo'], 4, '.', '');
                            $arrayItems[$piezas[$p]['nombreprenda']]['ItemAfectacion'] = '0';
                            $arrayItems[$piezas[$p]['nombreprenda']]['itemObservacion'] = '';
                            $arrayItems[$piezas[$p]['nombreprenda']]['itemICBPER'] = 0.00;
                            $precioigv = $idpromoselect[0]['precio_articulo'] / 1.18;
                            $itemIGVMonto = $idpromoselect[0]['precio_articulo'] - $precioigv;
                            $arrayItems[$piezas[$p]['nombreprenda']]['itemIGVMonto'] = number_format($itemIGVMonto, 4, '.', '');
                            // ----------- ------------------------ ------------

                            $arrpagototal[] = $piezas[$p]['precio'];
                            $html .= "<tr>";
                            $html .= "<td colspan='2'>1 UNAD &nbsp;" . $piezas[$p]['nombreprenda'];
                            $height += 14;
                            $subpiezas = $piezas[$p]['piezas'];
                            if (count($subpiezas) == 1) {
                                $html .= "</td>";
                                $precio_unitario = $piezas[$p]['precio'] / 1.18;
                                $html .= "<td>";
                                $html .= number_format($precio_unitario, 2, '.', '');
                                $html .= "</td>";

                                $html .= "<td>";
                                $html .= $piezas[$p]['precio'];
                                $html .= "</td>";
                                $height += (14 * 3);
                            } else if (count($piezas) >= 2) {
                                // ACA UN FOR
                                $html .= "<br>&nbsp;&nbsp;&nbsp;";
                                $height += 14;
                                for ($sp = 0; $sp < count($subpiezas); $sp++) {
                                    $html .= "1 &nbsp;" . $subpiezas[$sp]['nombrepieza'];
                                    if ($sp < (count($subpiezas) - 1)) {
                                        $html .= ", ";
                                    }
                                    // echo $subpiezas[$sp]['nombrepieza'];
                                }

                                $html .= "</td>";

                                $precio_unitario = $piezas[$p]['precio'] / 1.18;

                                $html .= "<td>";
                                $html .= number_format($precio_unitario, 2, '.', '');
                                $html .= "</td>";

                                $html .= "<td>";
                                $html .= $piezas[$p]['precio'];
                                $html .= "</td>";

                                $height += (14 * 3);
                            }
                            $html .= "</tr>";
                            $contItem = $contItem + 1;
                        }

                        // ITEMS PARA LA FACTURA O BOLETA
                        $foreachpiezas = $arrayItems;
                        $arrayItems = [];
                        $index = 0;
                        foreach ($foreachpiezas as $prendas => $values) {
                            $index = $index + 1;
                            $values['item'] = $index;
                            $arrayItems[] = $values;
                        }
                        // --------------------------------------------------

                        $pagototal = array_sum($arrpagototal);
                        $op_gravada = $pagototal / 1.18;
                        $igv = $op_gravada * 0.18;

                        $op_gravada = $pagototal / 1.18;
                        $igv = $op_gravada * 0.18;

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>OP. GRAVADA</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($op_gravada, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>IGV</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($igv, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= "<tr>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "</td>";
                        $html .= "<td>";
                        $html .= "<strong>TOTAL A PAGAR</strong>";
                        $html .= "</td>";
                        $html .= "<td> : S/.";
                        $html .= number_format($pagototal, 2, '.', '');
                        $html .= "</td>";
                        $html .= "</tr>";

                        $html .= '</table>';
                    }

                    $soles_centimos = @explode('.', str_replace(",", "", strval(number_format($op_gravada, 2, '.', ''))));
                    $html .= "<strong>SON: " . number_words(@$soles_centimos[0], "", "", "") . ' Y ' . @$soles_centimos[1] . '/100 SOLES</strong><br>';

                    $height += 85;

                    // ruc aki| codigo sunat | serie |  numero bv | valor vta | monto vtaa |  fecha doc |  tipo doc |  numero doc
                    $tipo_doc = 1;
                    if ($tipodedocumento == 'RUC') {
                        $tipo_doc = 6;
                    }

                    // OBTENGO RESPUESTA DEL JSON
                    // DATOS DEL CLIENTE
                    // $id_cliente
                    $client = $pdo->select(
                            tabla("cliente"),
                            [
                                "CodDistrito1_Cliente(adqUbigeo)",
                                "NumeroDocumento_Cliente(adqRucNumero)",
                                "nombreempresa(adqNombre)",
                                // NOMBRE DEL CLIENTE Y APELLIDO
                                "Nombre_Cliente(nombre)",
                                "ApellidoPaterno_Cliente(apepaterno)",
                                "ApellidoMaterno_Cliente(apematerno)",
                            ],
                            [
                                "id" => $id_cliente
                            ]
                    );

                    $itemValorVentaSum = 0;
                    $itemIGVMontoSum = 0;
                    for ($imp = 0; $imp < count($arrayItems); $imp++) {
                        $itemValorVentaSum = $itemValorVentaSum + $arrayItems[$imp]['itemValorVenta']; //itemIGVMonto 
                        $itemIGVMontoSum = $itemIGVMontoSum + $arrayItems[$imp]['itemIGVMonto'];
                    }
                    $itemValorVenta = number_format($itemValorVentaSum, 2, '.', '');
                    $itemIGVMonto = number_format($itemIGVMontoSum, 2, '.', '');

                    if (intval($itemValorVenta) >= 700) {
                        $dniruc = "99999999";
                        $razonsocial = "CLIENTES VARIOS";
                        $idtipodefacturasig = '2';
                    }

                    $itemVV = explode(".", $itemValorVenta);

                    $factura_boleta = array(
                        "emiRucTipo" => "6",
                        "emiRucNumero" => "20123257899", // QUEDA IGUAL
                        "emiNombre" => "LAVANDERIA AKI DRY CLEANERS S.R.L.", // QUEDA IGUAL
                        "emiUbigeo" => "150130",
                        "adqRucTipo" => strval($idtipodefacturasig),
                        "adqRucNumero" => $dniruc,
                        "adqNombre" => $razonsocial,
                        "adqUbigeo" => strval(@$client[0]['adqUbigeo']),
                        "adqDireccion" => "Lima", // QUEDA IGUAL
                        "adqProvincia" => "", // QUEDA IGUAL
                        "adqDepartamento" => "", // QUEDA IGUAL
                        "adqDistrito" => "", // QUEDA IGUAL
                        "docFechaEmision" => date('d/m/Y'),
                        "docTipo" => strval($codigodesunat),
                        "docNumero" => str_replace("-", '', $numerodefactura) . '0',
                        "docMoneda" => "PEN", // QUEDA IGUAL
                        "docTipoReferencia" => "", // QUEDA IGUAL
                        "docReferencia" => "", // QUEDA IGUAL
                        "docMovimiento" => "", // QUEDA IGUAL
                        "docTotOperGravada" => strval($itemValorVenta),
                        "docTotOperInafecta" => "0", // QUEDA IGUAL
                        "docTotOperExonerada" => "0", // QUEDA IGUAL
                        "docTotIGVMonto" => $itemIGVMonto,
                        "docTotIGVPctaje" => "18.00", // QUEDA IGUAL, ESTE ES EL IGV
                        "docTotISCMonto" => "0", // QUEDA IGUAL
                        "docTotDsctoGlobMonto" => "0", // QUEDA IGUAL
                        "docTotDsctoMonto" => "0", // QUEDA IGUAL
                        "docImporteTotalVenta" => strval($itemValorVenta),
                        "docImporteVtaLetras" => number_words(@$itemVV[0], "", "", "") . ' Y ' . @$itemVV[1] . '/100 Soles',
                        "docTipoCambio" => "0", // QUEDA IGUAL
                        "docCondPago" => "", // QUEDA IGUAL
                        "docVendCodigo" => "", // QUEDA IGUAL
                        "docTdaCodigo" => "", // QUEDA IGUAL
                        "docEstado" => "", // QUEDA IGUAL
                        "docSUNATCodigo" => "", // QUEDA IGUAL
                        "docSUNATObservacion" => "", // QUEDA IGUAL
                        "docValorResumen" => "", // QUEDA IGUAL
                        "docFechaVcto" => date('d/m/Y'),
                        "docICBPER" => "0.00",
                        "detalle" => $arrayItems
                    );

                    $respuesta = Emitir_Factura_Boleta($factura_boleta);

                    // SI CONTIENE '::::', ES QUE TODO SALIO BIEN
                    if (str_contains($respuesta, '::::')) {
                        // UPDATE
                        try {
                            $data = $pdo->update(
                                    tabla($nametable),
                                    [
                                        "respuesta_sunat" => 'ok',
                                        "xml" => json_encode($factura_boleta)
                                    ],
                                    [
                                        "numeroserie" => $numerodefactura
                                    ]
                            );
                        } catch (Throwable $t) {
                            
                        }
                    }

                    $codigoqr = "20123257899|" . $codigodesunat . '|' . str_replace("-", '|', $numerodefactura) . '|' . number_format($op_gravada, 2, '.', '') . '|' . number_format($pagototal, 2, '.', '') . '|' . $fecha . '|' . $tipo_doc . '|' . $numerodedocumento;
                    QRcode::png($codigoqr, RUTA_PDF . "QR" . $numerodefactura . '.png');
                    $png = convertirblobimageporruta(RUTA_PDF . "QR" . $numerodefactura . '.png');
                    unlink(RUTA_PDF . "QR" . $numerodefactura . '.png');
                    $html .= "<center><img src='" . $png . "' width='135'/></center>";
                    $height += 95 + (14 * 4);
                    $html .= "<label>CAJERO: MIGUEL GIBU</label><br>";
                    $html .= "<label>Medio de pago: " . strtoupper($metododepago) . "</label>";
                    $height += 28;

                    $dompdf->loadHtml($html);
                    $dompdf->set_option('isRemoteEnabled', TRUE);
                    $dompdf->set_paper(array(0, 0, 280, $height));
                    $dompdf->render();
                    $output = $dompdf->output();
                    file_put_contents(RUTA_PDF . $codpdf, $output);

                    // ENVIAR POR CORREO ELECTRONICO
                    if ($enviarporcorreo && !empty($correoelectronico)) {

                        // ENVIO AL CORREO
                        try {
                            $message = '
                                        <h3 align="center">DETALLES DEL INFORME</h3>
                                        <table border="1" width="100%" cellpadding="5" cellspacing="5">
                                        <tr>
                                        <td width="30%">NUMERO DE SERIE:</td>
                                        <td width="70%">' . $numerodefactura . '</td>
                                        </tr>
                                        <tr>
                                        <td width="30%">NOMBRE DEL CLIENTE</td>
                                        <td width="70%">' . $nombredelcliente . '</td>
                                        </tr>
                                        <tr>
                                        <td width="30%">CORREO ELECTRONICO</td>
                                        <td width="70%">' . $correoelectronico . '</td>
                                        </tr>
                                        <tr>
                                        <td width="30%">FEHCA Y HORA</td>
                                        <td width="70%">' . $fechaslash . ' ' . $hora . ':00' . '</td>
                                        </tr>
                                        </table>
                                        ';

                            $mail = new PHPMailer;
                            $mail->SMTPDebug = false;
                            $mail->do_debug = 0;
                            $mail->isSMTP();
                            $mail->Host = 'mail.intellipos.com.pe';
                            $mail->Port = '587'; //Sets the default SMTP server port
                            $mail->SMTPAuth = true;
                            $mail->Username = strval(CORREO_ELECTRONICO_AKI);
                            $mail->Password = strval(CONTRASENIA_AKI);
                            $mail->SMTPSecure = 'tls'; //Sets connection prefix. Options are "", "ssl" or "tls"
                            $mail->From = strval(CORREO_ELECTRONICO_AKI);
                            $mail->FromName = 'Lavanderia Aki';
                            $mail->AddAddress(strval($correoelectronico), 'Lavanderia Aki');
                            $mail->WordWrap = 50;
                            $mail->IsHTML(true); //Sets message type to HTML
                            $mail->AddAttachment(RUTA_PDF . $codpdf);
                            $mail->Subject = $titulo . ' - LAVANDERIA AKI';
                            $mail->Body = $message;
                            //echo 'Message has been sent';
                        } catch (Throwable $e) {
                            $json['msg'] = strings('error_correo');
                        }
                        // FIN ENVIO AL CORREO
                    }

                    try {
                        $updateTurnoxCliente = $pdo->update(
                                tabla('turnoxcliente'),
                                [
                                    'atencion' => 'Atendido',
                                ],
                                [
                                    "numero_orden" => $arraynumerodeordenes,
                                ]
                        );

                        $cantTurnoxCliente = $updateTurnoxCliente->rowCount(); // CUENTO LAS CANTIDADDES DE ACTUALIZACIONES

                        $updateOrden = $pdo->update(
                                tabla('orden'),
                                [
                                    'tipo_cobro' => 'Cancelado',
                                    'tipo_pago' => ucwords(strtolower($metododepago)),
                                    'flag' => 2
                                ],
                                [
                                    "numeroorden" => $arraynumerodeordenes,
                                ]
                        );

                        $cantOrden = $updateOrden->rowCount(); // CUANTO LAS CANTIDADDES DE LAS ACTUALIZACIONES DE LAS ORDENES
                        // SELECCIONO Y ACTUALIZO LATITUD Y LONGITUD DEL CLIENTE
                        // $id_cliente
                        // ACTUALIZO LAS COORDENAS DEL CLIENTE
                        try {
                            if ($latitud_cliente && $longitud_cliente) {
                                $pdo->update(tabla('cliente'),
                                        [
                                            "Latitud" => strval($latitud_cliente),
                                            "Longitud" => strval($longitud_cliente)
                                        ],
                                        [
                                            "id" => @$id_cliente
                                        ]
                                );
                            }
                        } catch (Throwable $e) {
                            
                        }

                        if (intval($cantOrden)) {
                            $json['code'] = '200';
                            $json['status'] = 'Ok';
                            $json['url_archivo'] = strval($codpdf);
                            $json['msg'] = strings('success_update') . ': ' . PHP_EOL . $arraynumerodeordenes;

                            // ENVIAR POR CORREO ELECTRONICO SI MARQUE EL CHECKBOX
                            if ($enviarporcorreo && !empty($correoelectronico)) {
                                // AQUI ENVIO EL ARCHIVO AL CORREO ELECTRONICO PARA CONCATENAR EL MENSAJE
                                try {
                                    $mail->send();
                                    // AQUI ENVIAR EL JSON
                                } catch (Throwable $t) {
                                    $json['msg'] = $json['msg'] . ". " . strings('error_correo');
                                }
                                // FIN AQUI ENVIO EL ARCHIVO AL CORREO ELECTRONICO PARA CONCATENAR EL MENSAJE
                            }
                            // FIN ENVIAR POR CORREO ELECTRONICO SI MARQUE EL CHECKBOX
                        } else {
                            $json['msg'] = strings('error_update') . ', porque los datos ya fueron registrados';
                        }
                    } catch (Throwable $e) {
                        $json['msg'] = strings('error_update');
                    }
                } catch (Exception $ex) {
                    $json['msg'] = strings('error_update');
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
