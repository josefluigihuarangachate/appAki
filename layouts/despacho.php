<?php
include "../vendor/autoload.php";
include '../servicios/include/config.php';
include '../servicios/include/function.php';
include '../servicios/include/tables.php';
include '../servicios/include/conexion.php';

$ordenes = explode(",", @$_SESSION['numeroordentemp']);

$o = 0;
?>
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
                        $reclamos = $pdo->select(
                                tabla('reclamoxprenda'),
                                [
                                    // ESTOS DATOS JALO DE LA TABLA ATENCION
                                    tabla('reclamoxprenda') . ".id(idprenda)",
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
                    - Agregar en la tabla repartidor serie de comprobante: serie_boleta y serie_factura
                    - Tiene que ser varias prendas o solo por uno no es obligacion por el momento, por el numero de orden del reclamo
                    - Guardar la orden original a al de reclamo
                    - PAGADO: En reclamo, Por Cobrar, Cancelado                  
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

<script>
    function entregaexitosa(confirm) {
        if (confirm) {
            var tipodepago = document.getElementById("metododepago").value;
            var latitud = document.getElementById("latitud_actual").value;
            var longitud = document.getElementById("longitud_actual").value;
            $.post(ruta + "Entrega",
                    {
                        cmd: 'confirmarentregaexitosa',
                        numerosdeordenes: numerosdeordenes,
                        idcliente: id_cliente,
                        tipodepago: tipodepago,
                        latitud: latitud,
                        longitud: longitud
                    }, function (json) {
                DialogAlertConfirm(json['msg'], '');
            });
        }
    }

    function generarReclamo(numerodeorden, keyprenda, idprenda, nombredelaprenda, color, marca) {
        //alert("COLOR: " + color + " - MARCA: " + marca);
        document.getElementById("numerodeorden").value = numerodeorden;
        document.getElementById("keyprenda").value = keyprenda;
        document.getElementById("idprenda").value = idprenda;

        document.getElementById("nombreprenda").value = nombredelaprenda;
        document.getElementById("colorprenda").value = color;
        document.getElementById("marcaprenda").value = marca;
        document.getElementById("textonombreprenda").innerHTML = nombredelaprenda;
        document.getElementById("textocolorprenda").innerHTML = color;
        document.getElementById("textomarcaprenda").innerHTML = marca;


        document.getElementById("divestados").innerHTML = "";
        document.getElementById("divestados").innerHTML = opcionesEstado();
        document.getElementById("observaciones").value = "";

        $('#DialogForm').modal('show');
    }


    // OPCIONES DE ESTADOS
    function opcionesEstado() {
        return chkEstadoPrenda = function () {
            var tmp = '';
            $.ajax({
                'async': false,
                'type': "GET",
                'global': false,
                'dataType': 'json',
                'url': ruta + "EstadoPrenda",
                'data': {'cmd': "listaestadoreclamo"},
                'success': function (json) {
                    if (json['status'] == 'Ok') {
                        if (json['data']) {
                            var datos = json['data'];
                            idestados = datos.length;
                            for (var i = 0; i < datos.length; i++) {
                                tmp += '<div class="">';
                                // AGREGAR FUNCION : chk1 = el id del check box _1,_2 = id del estado de la prenda
                                tmp += '<input type="checkbox" style="transform : scale(1.7);margin-right: 14px;" id="estado' + '_' + i + '" name="estado[]" value="' + datos[i].nombrereclamo + '">';
                                tmp += '<label class="form-check-label">' + datos[i].nombrereclamo.toUpperCase() + '</label>';
                                tmp += '</div>';
                            }
                        }
                    }
                }
            });
            return tmp;
        }();
    }
    // FIN OPCIONES DE ESTADOS

    // PARA CONTAR CUANTAS ARCHIVOS/IMAGENES SE CARGARON
    function contarImagenes(id) {
        var numFiles = $("#archivo" + id)[0].files.length;
        if (numFiles === 0) {
            numFiles = "";
        }
        document.getElementById("cantidadarchivos" + id).innerHTML = "";
        document.getElementById("cantidadarchivos" + id).innerHTML = numFiles;
    }
    // FIN PARA CONTAR CUANTAS ARCHIVOS/IMAGENES SE CARGARON

    // PARA CONTAR CUANTOS AUDIOS SE CARGARON
    function contarAudios(id) {
        var numFiles = $("#audio" + id)[0].files.length;
        if (numFiles === 0) {
            numFiles = "";
        }
        document.getElementById("cantidadaudio" + id).innerHTML = "";
        document.getElementById("cantidadaudio" + id).innerHTML = numFiles;
    }
    // FIN PARA CONTAR CUANTOS AUDIOS SE CARGARON

    // ENVIO EL RECLAMO POR PRENDA Y LO REGISTRO 
    function genegarReclamoporPrenda() {
        var form = new FormData(document.getElementById('formReclamo'));
        form.append('cmd', 'registrarreclamoporprenda');
        var numerodeorden = document.getElementById("numerodeorden").value;
        form.append('numerodeorden', numerodeorden);
        var keyprenda = document.getElementById("keyprenda").value;
        form.append('keyprenda', keyprenda);
        var idprenda = document.getElementById("idprenda").value;
        form.append('idprenda', idprenda);
        var nombreprenda = document.getElementById("nombreprenda").value;
        form.append('nombreprenda', nombreprenda);
        var color = document.getElementById("colorprenda").value;
        form.append('color', color);
        var marca = document.getElementById("marcaprenda").value;
        form.append('marca', marca);
        var nombrecliente = document.getElementById("nombrecliente").value;
        form.append('nombrecliente', nombrecliente);
        //form.append('idcliente', idcliente);

        // ABRO EL MODAL POPUP PARA MOSTRAR LOS DETALLES
        $('#ModalPrintTicket').modal('show');

        $.ajax({
            type: "POST",
            dataType: "html",
            url: ruta + 'Reclamo',
            data: form,
            cache: false,
            contentType: false, //must, tell jQuery not to process the data
            processData: false,
            beforeSend: function () {
                document.getElementById("htmlprint").innerHTML = '';
                document.getElementById("htmlprint").innerHTML = '<div class="div-contenedor"><div class="centrar"><img src="design/aki/lavadora.gif" alt="" style="width: 110px;"/><br><strong>Procesando...</strong></div></div>';
            },
            success: function (data)
            {
                document.getElementById("htmlprint").innerHTML = '';
                document.getElementById("htmlprint").innerHTML = data;
            },
            error: function (xhr) { // if error occured
                console.log(xhr);
            },
            complete: function () {
            }
        });
    }



    // PARA LA FECHA DE ENTREGA, CUANDO SE HACE UN RECLAMO
    // SIRVE PARA SUMAR Y RESTAR FECHAS
    function sumaryrestarFecha(signo) {
        var obtfechaMax = document.getElementById("fechatotalmax");
        var obtfechaMin = document.getElementById("fechatotalmin").value;
        let fechaMaxMenosyMas = moment(obtfechaMax.value).add(signo + 1, 'days').format("YYYY-MM-DD");
        let fechaMaxMenosyMascalular = moment(fechaMaxMenosyMas, 'YYYY-MM-DD');
        if (fechaMaxMenosyMascalular.format('ddd') === 'Sun') {
            fechaMaxMenosyMas = moment(fechaMaxMenosyMas).add(signo + 1, 'days').format("YYYY-MM-DD");
        }
        obtfechaMax.value = fechaMaxMenosyMas;
        nombrediaEspaniol(fechaMaxMenosyMas);
        evaluarfechaMenor();
    }
    // FIN SIRVE PARA SUMAR Y RESTAR FECHAS
    // SIRVE PARA CUANDO LA FECHA QUE ESTAMOS RESTANDO UN DIA, NO SEA MENOR A LA FECHA QUE 
    // NOS DA POR DEFECTO CON LOS DIAS DEL SERVICIO.
    function evaluarfechaMenor() {
        var obtfechaMax = document.getElementById("fechatotalmax");
        var obtfechaMin = document.getElementById("fechatotalmin").value;
        if (moment(obtfechaMax.value).isBefore(moment(obtfechaMin))) {
            obtfechaMax.value = obtfechaMin;
            nombrediaEspaniol(obtfechaMin);
        }
    }
    // FIN SIRVE PARA CUANDO LA FECHA QUE ESTAMOS RESTANDO UN DIA, NO SEA MENOR A LA FECHA QUE NOS DA POR DEFECTO CON LOS DIAS DEL SERVICIO.
// SIRVE PARA SABER EL NOMBRE DEL DIA QUE TIENE UNA FECHA, EN ESPAÑOL
    function nombrediaEspaniol(fecha) {
        let saberdia = moment(fecha, 'YYYY-MM-DD');
        saberdia = saberdia.format('ddd');
        // Mon,Tue,wed,Thu,Fri,Sat,Sun
        var dias = {
            "Mon": "Lunes",
            "Tue": "Martes",
            "Wed": "Miercoles",
            "Thu": "Jueves",
            "Fri": "Viernes",
            "Sat": "Sabado",
            "Sun": "Domingo"
        };
        document.getElementById("nombredia").innerHTML = dias[saberdia];
    }
    // FIN SIRVE PARA SABER EL NOMBRE DEL DIA QUE TIENE UNA FECHA, EN ESPAÑOL

    // SIRVE PARA OBTENER LOS DIAS DEL SERVICIO, NADA MAS
    function obtenerdias() {
        var dias = 3; // POR DEFECTO
        obtenerFechas('hoy', dias);
    }
    obtenerdias();
    // FIN SIRVE PARA OBTENER LOS DIAS DEL SERVICIO, NADA MAS

    // CALCULAR FECHA QUE SE ENTREGARA - FECHA DEFAULT
    function obtenerFechas(fecha, dias) {
        // POR DEFECTO SE SUMA UN DIA, MOMENT JS NO TOMA HOY COMO UN DIA SI NO 
        // DESDE MAÑANA EMPIEZA A CONTAR LOS DIAS
        if (fecha.toLowerCase() === 'hoy') {
            fecha = moment().format("YYYY-MM-DD");
        }

        // FECHA SUMADA LOS DIAS
        fechaestimada = moment(fecha).add(dias, 'd').format("YYYY-MM-DD");

        var Array = calcularFecha(fecha, fechaestimada);
        document.getElementById("fechatotalmax").value = Array['FechaEntrega'];
        document.getElementById("fechatotalmin").value = Array['FechaEntrega'];
        nombrediaEspaniol(Array['FechaEntrega']);
    }
    //obtenerFechas('hoy', 32);
    // FIN CALCULAR FECHA QUE SE ENTREGARA - FECHA DEFAULT

    // CALCULAR FECHA DE ENTREGA, SIN LOS DOMINGOS
    // MOMENTJS - EJM (CONTAR CUANTOS DOMINGOS HAY EN DOS FECHAS): https://stackoverflow.com/a/44469127/16488926
    // AL PARECER LA FUNCION SUMA UN DIA MAS SI LA FECHA ES FERIADO, NO ESTOY SEGURO. PERO EL CALCULO ESTA BIEN
    function calcularFecha(fechainicio, fechafin) {
        if (fechainicio.toLowerCase() === 'hoy') {
            fechainicio = moment().format("YYYY-MM-DD");
        }
        let start = moment(fechainicio, 'YYYY-MM-DD');
        let end = moment(fechafin, 'YYYY-MM-DD');

        let datesum = moment(fechainicio, 'YYYY-MM-DD');

        let weekdayCounter = 0;
        while (start <= end) {
            // SUNDAY = DOMINGO
            if (start.format('ddd') == 'Sun') {
                weekdayCounter++; // CUENTO LOS DOMINGOS
            }
            start = moment(start, 'YYYY-MM-DD').add(1, 'days');

            // SUMO DIAS PARA TENER LA FECHA FINAL
            datesum = moment(datesum).add(1, 'days').format("YYYY-MM-DD");
        }
        // RESTO UN DIA, YA QUE ME ESTA SUMANDO UN DIA MAS
        datesum = moment(datesum).subtract(1, "days").format("YYYY-MM-DD");
        //datesum = moment(datesum).add(-1, 'days').format("YYYY-MM-DD");

        if (weekdayCounter >= 1) {
            return calcularFecha(datesum, moment(datesum).add(weekdayCounter, 'days').format("YYYY-MM-DD"));
        }

        // EJM : https://stackoverflow.com/a/12059550/16488926
        return {
            "FechaInicio": moment().format("YYYY-MM-DD"),
            "FechaEntrega": datesum
        };

        // return weekdayCounter;
    }
    // FIN CALCULAR FECHA DE ENTREGA, SIN LOS DOMINGOS
</script>