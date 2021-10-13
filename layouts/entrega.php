<?php
$ordenes = explode(",", @$_SESSION['numeroordentemp']);

$o = 0;
?>
<link href="design/assets/css/recojo.css" rel="stylesheet" type="text/css"/>
<br>
<div style="padding-left: 18px;padding-right: 18px;">
    <div class="card" style="margin-bottom: 20px;text-align: center;">
        <div class="card-body">
            <div class="row">
                <div class="col-7">
                    <label style="margin-bottom: 10px;">METODO DE PAGO:</label><br>
                    <div class="input-group">
                        <select class="form-control" id="metododepago" name="metododepago">
                            <?php
                            for ($mp = 0; $mp < count($metododepago); $mp++) {
                                if ($mp != 0) {
                                    ?>
                                    <option value="<?= $metododepago[$mp]; ?>"><?= strtoupper($metododepago[$mp]); ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-success" onclick="confirmar('entregaexitosa')" style="width: 60px;height: 38px; padding: 5px 5px 5px 9px;border-radius:  0px 10px 10px 0px;">
                                <ion-icon name="cash-outline"></ion-icon>
                            </button>
                        </span>
                    </div>                 
                </div>
                <div class="col-5">
                    <label>PAGO TOTAL:</label><br>
                    S/. <label id="pagototal" name="pagototal" style="line-height: 55px;">0.00</label>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="section mt-1">
    <div class="card">
        <div class="card-body">

            <div class="row">
                <div class="col-6">
                    <div class="form-check mb-1">
                        <input class="form-check-input" type="radio" name="facturaelectronica" id="facturaelectronicab" value="boleta" checked="checked">
                        <label class="form-check-label" for="facturaelectronicab">
                            BOLETA
                        </label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check mb-1">
                        <input class="form-check-input" type="radio" name="facturaelectronica" id="facturaelectronicaf" value="factura">
                        <label class="form-check-label" for="facturaelectronicaf">
                            FACTURA
                        </label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <div class="form-check mb-1">
                        <label>DNI/RUC</label>
                        <input type="text" class="form-control" id="ruc" name="ruc" placeholder="DNI/RUC" value="<?php echo $_SESSION['dniclientetemp']; ?>">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-check mb-1">
                        <label>CLIENTE/EMPRESA</label>
                        <input type="text" class="form-control" id="razonsocial" name="razonsocial" placeholder="NOMBRE DE LA EMPRESA" value="<?php echo $_SESSION['razonsocialtemp']; ?>">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-8">
                    <div class="form-check mb-1">
                        <label>CORREO ELECTRÓNICO</label>
                        <input type="text" class="form-control" placeholder="* Correo Electronico" id="correoelectronico" name="correoelectronico" value="<?php echo $_SESSION['enviarporcorreotemp']; ?>">
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-check mb-1" style="padding-top: 35px;">
                        <input type="checkbox" class="form-check-input" id="enviarporcorreo" name="enviarporcorreo">
                        <label class="form-check-label" for="enviarporcorreo">ENVIARLE</label>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <br>
    <ul class="listview image-listview inset">
        <?php
        $id_cliente = null;
        $pagototal = 0.00;
        while ($o < count($ordenes)) {

            $orden = $pdo->select(
                    tabla('orden'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('zona') =>
                        [
                            tabla('orden') . ".idzona" => "puesto_zona"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('turnoxcliente') =>
                        [
                            tabla('orden') . ".numeroorden" => "numero_orden"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('orden') . ".id(idorden)",
                        tabla('orden') . ".idservicio(idservicio)",
                        tabla('orden') . ".nombre_servicio(nombreservicio)",
                        tabla('orden') . ".numeroorden(numeroorden)",
                        tabla('orden') . ".fecha(fechaorden)",
                        tabla('orden') . ".hora(horaorden)",
                        tabla('orden') . ".fecha_entrega(fechaentrega)",
                        tabla('orden') . ".hora_entrega(horaentrega)",
                        tabla('orden') . ".tipo_cobro(tipocobro)",
                        tabla('orden') . ".total_s_dscto(totalsdscto)",
                        tabla('orden') . ".descuento(descuento)",
                        tabla('orden') . ".total_pagar(totalpagar)",
                        tabla('orden') . ".a_cuenta(acuenta)",
                        tabla('orden') . ".saldo(saldo)",
                        tabla('orden') . ".estado(estado)",
                        tabla('orden') . ".tipo_pago(tipopago)",
                        tabla('orden') . ".tipo_atencion(tipoatencion)",
                        tabla('orden') . ".array_detalleorden(arraydetalleorden)",
                        tabla('zona') . ".id(idzona)",
                        tabla('zona') . ".codigo_zona(codigozona)",
                        tabla('zona') . ".nombre_zona(nombrezona)",
                        tabla('zona') . ".puesto_zona(puestozona)",
                        tabla('turnoxcliente') . ".id_cliente(idcliente)",
                    ],
                    [
                        tabla('orden') . '.numeroorden' => $ordenes[$o], // C1, C2, C3
                    //tabla('orden') . '.fecha_entrega' => date('Y-m-d'),
                    ],
                    [
                        // Multiple condition.
                        "ORDER" => [
                            //tabla('detalleorden') . ".id" => "DESC",
                            tabla('orden') . ".numeroorden" => "DESC"
                        ]
                    ]
            );

            if ($orden) {
                //$detalleorden = objectToArray(json_decode($orden[0]['arraydetalleorden']));
                //imprimir($detalleorden);
                for ($r = 0; $r < count($orden); $r++) {
                    $detalleorden = objectToArray(json_decode($orden[$r]['arraydetalleorden']));
                    $pagototal = $orden[$r]['totalpagar'];
                    $id_cliente = $orden[$r]['idcliente'];

                    if (
                            strtolower($orden[$r]['nombreservicio']) == 'promociones' ||
                            strtolower($orden[$r]['nombreservicio']) == 'promoción' ||
                            strtolower($orden[$r]['idservicio']) == 1
                    ) {
                        foreach ($detalleorden as $nombrepromocion => $prendas) {
                            $keys = [];
                            $idprendas = [];
                            for ($pr = 0; $pr < count($prendas); $pr++) {
                                ?>

                                <li>
                                    <a href="javascript:void(0)" class="item">
                                        <img src="design/aki/ropa.png" alt="image" class="image">
                                        <div class="in">
                                            <div>
                                                <strong>NR°. ORDEN: <?= $orden[$r]['numeroorden']; ?></strong><br>
                                                SERVICIO: <?= $orden[$r]['nombreservicio']; ?><br>

                                                <header>
                                                    <strong>PROMOCIÓN:</strong> <?= $nombrepromocion ?><br> 
                                                    <strong>PRENDA:</strong> <?= $prendas[$pr]['nombreprenda']; ?><br>
                                                    <strong>PRECIO:</strong> <?= $prendas[$pr]['precioprenda']; ?><br>
                                                    <strong>COLOR:</strong> <?= $prendas[$pr]['color']; ?><br>
                                                    <strong>MARCA:</strong> <?= $prendas[$pr]['marca']; ?><br>
                                                    <strong>ESTADO: </strong>
                                                    <?php
                                                    if (!empty(trim($prendas[$pr]['nombreestados']))) {
                                                        echo str_replace("@", ",", $prendas[$pr]['nombreestados']);
                                                    } else {
                                                        echo " ---";
                                                    }
                                                    ?> 
                                                </header>
                                            </div>
                                            <span class="text-muted">
                                                <button class="btn btn-default">
                                                    <ion-icon name="receipt-outline" onclick="generarReclamo('<?= $orden[$r]['numeroorden']; ?>', '<?= $prendas[$pr]['key']; ?>',<?= $prendas[$pr]['idprenda']; ?>, '<?= $prendas[$pr]['nombreprenda']; ?>', '<?= $prendas[$pr]['color']; ?>', '<?= $prendas[$pr]['marca']; ?>');" style="font-size: 25px;"></ion-icon>    
                                                </button>
                                            </span>
                                        </div>
                                    </a>
                                </li>       

                                <?php
                                $keys[] = $prendas[$pr]['key'];
                                $idprendas[] = $prendas[$pr]['idprenda'];
                            }
                            ?>




                            <?php
                            $reclamos = $pdo->select(
                                    tabla('reclamoxprenda'),
                                    [
                                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                                        tabla('reclamoxprenda') . ".id(idprenda)",
                                        tabla('reclamoxprenda') . '.fechaentrega(fechaentrega)',
                                        tabla('reclamoxprenda') . '.horaentrega(horaentrega)',
                                        tabla('reclamoxprenda') . '.numeroorden(numerodereclamo)',
                                        tabla('reclamoxprenda') . ".nombreprenda(nombreprenda)",
                                        tabla('reclamoxprenda') . ".color(colorprenda)",
                                        tabla('reclamoxprenda') . ".marca(marcaprenda)",
                                        tabla('reclamoxprenda') . ".observacion(observacionprenda)",
                                        tabla('reclamoxprenda') . ".estados(estadosprenda)",
                                    ],
                                    [
                                        tabla('reclamoxprenda') . '.origennumeroorden' => $orden[$r]['numeroorden'], // C1, C2, C3
                                        tabla('reclamoxprenda') . '.ordenprenda' => $keys, // strval($piezas[0]['key']),
                                        tabla('reclamoxprenda') . '.idprenda' => $idprendas, //$detalleorden[$p]['idprenda'],
                                    ],
                                    [
                                        // Multiple condition.
                                        "ORDER" => [
                                            //tabla('detalleorden') . ".id" => "DESC",
                                            tabla('reclamoxprenda') . ".id" => "ASC"
                                        ]
                                    ]
                            );
                            //var_dump($pdo->log());
                            //die();
                            if ($reclamos) {
                                ?>
                                <div class="d-flex flex-row flex-nowrap overflow-auto">

                                    <?php
                                    $p1 = 0;
                                    while ($p1 < count($reclamos)) {
                                        ?>
                                        <div class="card" style="min-width: 200px;border-radius: 0px;border: 1px solid #ddd;margin: 18px;">
                                            <div class="card-body" style="width: 200px;">
                                                <h5><center><span class="badge rounded-pill bg-dark"><?= $reclamos[$p1]['numerodereclamo']; ?></span></center></h5>
                                                <h5 class="card-title"><?= $reclamos[$p1]['nombreprenda']; ?></h5>
                                                <label class="card-subtitle text-muted">COLOR: <?= $reclamos[$p1]['colorprenda']; ?></label>
                                                <label class="card-subtitle text-muted">MARCA: <?= $reclamos[$p1]['marcaprenda']; ?></label>
                                                <p class="card-text">
                                                    <strong>ESTADOS:<br></strong> 
                                                    <small>
                                                        <?php
                                                        if (@$reclamos[$p1]['estadosprenda']) {
                                                            echo str_replace(" @ ", ", ", @$reclamos[$p1]['estadosprenda']);
                                                        } else {
                                                            echo "---";
                                                        }
                                                        ?>
                                                    </small>
                                                    <br>
                                                    <strong>OBSERVACIÓN:<br></strong> 
                                                    <small>
                                                        <?php
                                                        if (@$reclamos[$p1]['observacionprenda']) {
                                                            echo str_replace(" @ ", ", ", @$reclamos[$p1]['observacionprenda']);
                                                        } else {
                                                            echo "---";
                                                        }
                                                        ?>
                                                    </small>
                                                </p>
                                            </div>
                                        </div>   
                                        <?php
                                        $p1 = $p1 + 1;
                                    }
                                    ?>

                                </div>
                                <?php
                            }
                            ?>



                            <?php
                        }
                    } else {
                        //imprimir($detalleorden);
                        for ($p = 0; $p < count($detalleorden); $p++) {
                            $piezas = $detalleorden[$p]['piezas'];

                            $keys = [];
                            $idprendas = [];

                            if (count($piezas) == 1) {
                                $keys[] = @strval(@$piezas[0]['key']);
                                $idprendas[] = @intval(@$detalleorden[$p]['idprenda']);
                                ?>
                                <li>
                                    <a href="javascript:void(0)" class="item">
                                        <img src="design/aki/ropa.png" alt="image" class="image">
                                        <div class="in">
                                            <div>
                                                <strong>NR°. ORDEN: <?= $orden[$r]['numeroorden']; ?></strong><br>
                                                SERVICIO: <?= $orden[$r]['nombreservicio']; ?><br>

                                                <header>
                                                    <strong>PRENDA:</strong> <?= $detalleorden[$p]['nombreprenda']; ?><br>
                                                    <strong>PRECIO:</strong> <?= $detalleorden[$p]['precio']; ?><br>
                                                    <strong>COLOR:</strong> <?= $detalleorden[$p]['color']; ?><br>
                                                    <strong>MARCA:</strong> <?= $detalleorden[$p]['marca']; ?><br>
                                                    <strong>ESTADO: </strong>
                                                    <?php
                                                    if (!empty(trim($piezas[0]['nombresestados']))) {
                                                        echo str_replace("@", ",", $piezas[0]['nombresestados']);
                                                    } else {
                                                        echo " ---";
                                                    }
                                                    ?> 
                                                </header>
                                            </div>
                                            <span class="text-muted">
                                                <button class="btn btn-default">
                                                    <ion-icon name="receipt-outline" onclick="generarReclamo('<?= $orden[$r]['numeroorden']; ?>', '<?= $detalleorden[$p]['piezas'][0]['key']; ?>', <?= $detalleorden[$p]['idprenda']; ?>, '<?= $detalleorden[$p]['nombreprenda']; ?>', '<?= $detalleorden[$p]['color']; ?>', '<?= $detalleorden[$p]['marca']; ?>');" style="font-size: 25px;"></ion-icon>    
                                                </button>
                                            </span>
                                        </div>
                                    </a>
                                </li>

                                <?php
                            } else if (count($piezas) >= 2) {
                                ?>
                                <li>
                                    <a href="javascript:void(0)" class="item">
                                        <img src="design/aki/ropa.png" alt="image" class="image">
                                        <div>
                                            <div>
                                                <strong>NR°. ORDEN: <?= $orden[$r]['numeroorden']; ?></strong><br>
                                                SERVICIO: <?= $orden[$r]['nombreservicio']; ?><br>

                                                <header>
                                                    <strong>PRENDA:</strong> <?= $detalleorden[$p]['nombreprenda']; ?><br>
                                                    <strong>PRECIO:</strong> <?= $detalleorden[$p]['precio']; ?><br>
                                                    <strong>COLOR:</strong> <?= $detalleorden[$p]['color']; ?><br>
                                                    <strong>MARCA:</strong> <?= $detalleorden[$p]['marca']; ?><br>
                                                    <?php
                                                    for ($pi = 0; $pi < count($piezas); $pi++) {

                                                        $keys[] = @strval(@$piezas[$pi]['key']);
                                                        $idprendas[] = @intval(@$piezas[$pi]['idpieza']);
                                                        ?>
                                                        <button class="btn btn-default" style="float: right;position: relative;">
                                                            <ion-icon name="receipt-outline" onclick="generarReclamo('<?= $orden[$r]['numeroorden']; ?>', '<?= $piezas[$pi]['key']; ?>', <?= $piezas[$pi]['idpieza']; ?>, '<?= $piezas[$pi]['nombrepieza']; ?>', '<?= $detalleorden[$p]['color']; ?>', '<?= $detalleorden[$p]['marca']; ?>');" style="font-size: 25px;"></ion-icon>  
                                                        </button>
                                                        <strong>PIEZA:</strong> <?= $piezas[$pi]['nombrepieza']; ?><br>
                                                        <strong>ESTADO: </strong> 
                                                        <?php
                                                        if (!empty(trim($piezas[$pi]['nombresestados']))) {
                                                            echo str_replace("@", ",", $piezas[$pi]['nombresestados']);
                                                        } else {
                                                            echo " ---";
                                                        }
                                                        ?>                                                     
                                                        <br>
                                                        <?php
                                                    }
                                                    ?>

                                                </header>
                                            </div>
                                            <span class="text-muted">
                                            </span>
                                        </div>
                                    </a>
                                </li>                             
                                <?php
                            }
                            ?>


                            <?php
                            // SI TIENE RECLAMO LO MUESTRO
                            $reclamos = $pdo->select(
                                    tabla('reclamoxprenda'),
                                    [
                                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                                        tabla('reclamoxprenda') . ".id(idprenda)",
                                        tabla('reclamoxprenda') . '.fechaentrega(fechaentrega)',
                                        tabla('reclamoxprenda') . '.horaentrega(horaentrega)',
                                        tabla('reclamoxprenda') . '.numeroorden(numerodereclamo)',
                                        tabla('reclamoxprenda') . ".nombreprenda(nombreprenda)",
                                        tabla('reclamoxprenda') . ".color(colorprenda)",
                                        tabla('reclamoxprenda') . ".marca(marcaprenda)",
                                        tabla('reclamoxprenda') . ".observacion(observacionprenda)",
                                        tabla('reclamoxprenda') . ".estados(estadosprenda)",
                                    ],
                                    [
                                        tabla('reclamoxprenda') . '.origennumeroorden' => $orden[$r]['numeroorden'], // C1, C2, C3
                                        tabla('reclamoxprenda') . '.ordenprenda' => $keys, // strval($piezas[0]['key']),
                                        tabla('reclamoxprenda') . '.idprenda' => $idprendas, //$detalleorden[$p]['idprenda'],
                                    ],
                                    [
                                        // Multiple condition.
                                        "ORDER" => [
                                            //tabla('detalleorden') . ".id" => "DESC",
                                            tabla('reclamoxprenda') . ".id" => "ASC"
                                        ]
                                    ]
                            );
                            if ($reclamos) {
                                ?>
                                <div class="d-flex flex-row flex-nowrap overflow-auto">

                                    <?php
                                    $p1 = 0;
                                    while ($p1 < count($reclamos)) {
                                        ?>
                                        <div class="card" style="min-width: 200px;border-radius: 0px;border: 1px solid #ddd;margin: 18px;">
                                            <div class="card-body" style="width: 200px;">
                                                <h5><center><span class="badge rounded-pill bg-dark"><?= $reclamos[$p1]['numerodereclamo']; ?></span></center></h5>
                                                <h5 class="card-title"><?= $reclamos[$p1]['nombreprenda']; ?></h5>                                            
                                                <label class="card-subtitle text-muted">COLOR: <?= $reclamos[$p1]['colorprenda']; ?></label>
                                                <label class="card-subtitle text-muted">MARCA: <?= $reclamos[$p1]['marcaprenda']; ?></label>
                                                <p class="card-text">
                                                    <strong>ESTADOS:<br></strong> 
                                                    <small>
                                                        <?php
                                                        if (@$reclamos[$p1]['estadosprenda']) {
                                                            echo str_replace(" @ ", ", ", @$reclamos[$p1]['estadosprenda']);
                                                        } else {
                                                            echo "---";
                                                        }
                                                        ?>
                                                    </small>
                                                    <br>
                                                    <strong>OBSERVACIÓN:<br></strong> 
                                                    <small>
                                                        <?php
                                                        if (@$reclamos[$p1]['observacionprenda']) {
                                                            echo str_replace(" @ ", ", ", @$reclamos[$p1]['observacionprenda']);
                                                        } else {
                                                            echo "---";
                                                        }
                                                        ?>
                                                    </small>
                                                </p>
                                            </div>
                                        </div>   
                                        <?php
                                        $p1 = $p1 + 1;
                                    }
                                    ?>

                                </div>
                                <?php
                            }
                            ?>


                            <?php
                        }
                    }
                }
            }
            // INCREMENTO
            $o++;
        }
        ?>
    </ul>
    <br>



    <!-- Dialog Form -->
    <div class="modal fade dialogbox" id="DialogForm" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">RECLAMO</h5>
                </div>
                <form action="#" method="POST" enctype="multipart/form-data" id="formReclamo" name="formReclamo">
                    <div class="modal-body text-start mb-2">
                        <input value="" type="hidden" hidden="hidden" id="numerodeorden" name="numerodeorden">
                        <input value="<?php echo @$id_cliente; ?>" type="hidden" hidden="hidden" id="idcliente" name="idcliente">
                        <input value="<?php echo @$_SESSION['nombrecliente']; ?>" type="hidden" hidden="hidden" id="nombrecliente" name="nombrecliente">
                        <input value="" type="hidden" hidden="hidden" id="keyprenda" name="keyprenda">
                        <input value="" type="hidden" hidden="hidden" id="idprenda" name="idprenda">
                        <input value="" type="hidden" hidden="hidden" id="colorprenda" name="colorprenda">
                        <input value="" type="hidden" hidden="hidden" id="marcaprenda" name="marcaprenda">
                        <input value="" type="hidden" hidden="hidden" id="nombreprenda" name="nombreprenda">

                        <div class="form-group basic">
                            <label class="label" for="text1">FECHA DE ENTREGA</label>
                            <div class="input-group mb-12">
                                <div class="input-group-prepend">
                                    <button type="button" class="form-control btn btn-outline-danger" id="menosfecha" name="menosfecha" onclick="sumaryrestarFecha('-');" style="border-radius: 5px 0px 0px 5px;padding-right: 15px;padding-left: 15px;">-</button>
                                </div>
                                <input type="date" class="form-control" readonly="readonly" style="text-align: center;" id="fechatotalmax" name="fechatotalmax" placeholder="FECHA ENTREGA">
                                <input type="date" class="form-control" readonly="readonly" hidden="hidden" style="text-align: center;" id="fechatotalmin" name="fechatotalmin" placeholder="FECHA ENTREGA MINIMO">
                                <div class="input-group-append">
                                    <button type="button" class="form-control btn btn-outline-info" id="masfecha" name="masfecha" onclick="sumaryrestarFecha('+');" style="border-radius: 0px 5px 5px 0px;padding-right: 15px;padding-left: 15px;">+</button>
                                </div>
                            </div>
                            <div class="input-info">El dia <label id="nombredia" name="nombredia"></label> es la fecha de entrega</div>
                        </div>


                        <div class="input-wrapper">
                            <label><strong>PRENDA:</strong></label>
                            <span id="textonombreprenda" name="textonombreprenda"></span>
                        </div>


                        <div class="input-wrapper">                            
                            <label><strong>COLOR:</strong></label>
                            <span id="textocolorprenda" name="colorprenda"></span>
                        </div>


                        <div class="input-wrapper">
                            <label><strong>MARCA:</strong></label>
                            <span id="textomarcaprenda" name="textomarcaprenda"></span>
                        </div>

                        <!--
                        TODO
                        
                        - Tiene que ser varias prendas o solo por uno no es obligacion por el momento, por el numero de orden del reclamo
                        - CUANDO LA ENTREGA VENGA DEL SISTEMA BASE, NO MOSTRAR OPCIONES DE METODO 
                          DE PAGO SOLO MOSTRAR CON EL METODO DE PAGO QUE REALIZO SI ES QUE LO HIZO                    
                        - SI TIENE CORREO ELECTRONICO REGISTRADO EL CLIENTE, MOSTRAR UN CHECKBOX 
                          PARA PODER ENVIARLE EL TICKET A SU CORREO ELECTRONICO                    
                        - PREGUNTAR SI DESEA UNA BOLETA DE VENTA O UNA FACTURA                    
                        - SI NO TIENE CORREO ELECTRONICO REGISTRADO EL CLIENTE PARA EL ENVIO DE SU TICKET A SU CORREO ELECTRONICO
                          PEDIR SI NO TIENE Y MARQUE EL CHECKBOX Y AL MOMENTO DE ENVIAR GUARDARLO EN LA TABLA DE LOS CLIENTES,
                          DE LO CONTRARIO SOLO OCULTARLO EL CAMPO DE CORREO ELECTRONICO PARA QUE INGRESE Y SOLO INGRESE EL RUC
                        - EN ENTREGA PASAR DEL FLUTTER AL WEB LA LATITUD Y LONGITUD PARA PODER UBICAR AL CLIENTE LA SIGUIENTE VEZ 
                          QUE SE VALLA A HACER EL RECOJO O LA ENTREGA
                        - CUANDO ACTUALIZAMOS DE RECLAMO NO MOSTRAR METODO DE PAGO 
                        - DENTRO DE UN RECLAMO PUEDO VOLVER A RECLAMAR POR ESA PRENDA SI ES QUE NO ESTOY SATISFECHO CON EL LAVADO
                        - VOLVERA HACER EL MISMO PROCESO
                        - PARA LA ENTREGA, TAMBIEN SE IMPRIMIRA EL TICKET PERO EL TICKET QUE SE GENERO ANTERIORMENTE, YA NO SE IMPRIMIRA
                          CON LOS DETALLES DE LA PRENDA DEL RECLAMO
                        
                        -->
                        <div class="form-group basic">
                            <div class="input-wrapper">
                                <label style="margin-bottom: 10px;">ESTADOS:</label><br>
                                <div id="divestados" name="divestados">                                
                                </div>
                            </div>
                        </div>                        


                        <div class="input-wrapper">
                            <label>OBSERVACIONES:</label>
                            <textarea class="form-control" id="observaciones" name="observaciones" rows="4" class="observacion" placeholder="OBSERVACIONES"></textarea>
                        </div>


                        <div class="form-group basic" style="padding: 0px !important;">
                            <div class="input-wrapper">                         
                                <div class="input-wrapper">
                                    <div class="row">
                                        <div class="col-6">
                                            <center>
                                                <label for="audio">
                                                    <span class="headerButton">
                                                        <ion-icon name="mic-outline" style="font-size: 40px;" role="img" class="md hydrated" aria-label="mic outline"></ion-icon>
                                                        <sup id="cantidadaudio" name="cantidadaudio" class="badge badge-success" style="float: right;"></sup>
                                                    </span>
                                                    <input type="file" id="audio" name="audio[]" accept="audio/*" capture="" style="display: none;" onchange="contarAudios('');">
                                                </label>
                                            </center>
                                        </div>
                                        <div class="col-6">
                                            <center>
                                                <label for="archivo">
                                                    <span class="headerButton">
                                                        <ion-icon name="camera-outline" style="font-size: 40px;" role="img" class="md hydrated" aria-label="camera outline"></ion-icon>
                                                        <sup id="cantidadarchivos" name="cantidadarchivos" class="badge badge-success" style="float: right;"></sup>
                                                    </span>
                                                    <input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="archivo" name="archivo[]" class="choose" style="display: none;" onchange="contarImagenes('');"></label>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="btn-inline">
                            <button type="button" class="btn btn-text-danger btn-block" data-bs-dismiss="modal">CANCELAR</button>
                            <button type="button" class="btn btn-text-success btn-block" onclick="genegarReclamoporPrenda();">GUARDAR</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- * Dialog Form -->



    <!-- Modal Imprimir Ticket -->
    <div class="modal fade modalbox" id="ModalPrintTicket" tabindex="-1" role="dialog" style="z-index: 9999;">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-top: 0px !important;">
                <div class="modal-body">
                    <a href="javascript:;" class="btn btn-close" data-bs-dismiss="modal" style="float: right;border-radius: 50px;" id="closeTicket" name="closeTicket">x</a>
                    <div id="htmlprint" name="htmlprint">                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fin Modal Imprimir Ticket -->




    <span class="ir-arriba icon-arrow-up2">
        <ion-icon name="chevron-up-outline"></ion-icon>
    </span>

    <script>
        document.getElementById("pagototal").innerHTML = "";
        document.getElementById("pagototal").innerHTML = "<?php echo $pagototal; ?>";
        var numerosdeordenes = "<?php echo @$_SESSION['numeroordentemp']; ?>";
        var id_cliente = "<?php echo @$id_cliente; ?>";
    </script>
    <script src="design/js/crud/entrega.js" type="text/javascript"></script>
