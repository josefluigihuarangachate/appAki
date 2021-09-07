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
                                if($mp != 0){
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
                ],
                [
                    tabla('orden') . '.numeroorden' => $ordenes[$o], // C1, C2, C3
                    tabla('orden') . '.fecha_entrega' => date('Y-m-d'),
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

                if (
                        strtolower($orden[$r]['nombreservicio']) == 'promociones' ||
                        strtolower($orden[$r]['nombreservicio']) == 'promoción' ||
                        strtolower($orden[$r]['idservicio']) == 1
                ) {
                    foreach ($detalleorden as $nombrepromocion => $prendas) {
                        for ($pr = 0; $pr < count($prendas); $pr++) {
                            ?>

                            <li>
                                <a href="#" class="item">
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
                                            <!--<ion-icon name="trash-outline" style="font-size: 25px;color: red;"></ion-icon>-->
                                        </span>
                                    </div>
                                </a>
                            </li>       

                            <?php
                        }
                    }
                } else {
                    //imprimir($detalleorden);
                    for ($p = 0; $p < count($detalleorden); $p++) {
                        $piezas = $detalleorden[$p]['piezas'];
                        if (count($piezas) == 1) {
                            ?>
                            <li>
                                <a href="#" class="item">
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
                                            <!--<ion-icon name="trash-outline" style="font-size: 25px;color: red;"></ion-icon>-->
                                        </span>
                                    </div>
                                </a>
                            </li> 
                            <?php
                        } else if (count($piezas) >= 2) {
                            ?>
                            <li>
                                <a href="#" class="item">
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
                                                <?php
                                                for ($pi = 0; $pi < count($piezas); $pi++) {
                                                    ?>
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
                                            <!--<ion-icon name="trash-outline" style="font-size: 25px;color: red;"></ion-icon>-->
                                        </span>
                                    </div>
                                </a>
                            </li> 
                            <?php
                        }
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


<span class="ir-arriba icon-arrow-up2">
    <ion-icon name="chevron-up-outline"></ion-icon>
</span>

<script>
    document.getElementById("pagototal").innerHTML = "";
    document.getElementById("pagototal").innerHTML = "<?php echo $pagototal; ?>";
    var numerosdeordenes = "<?php echo @$_SESSION['numeroordentemp']; ?>";
</script>

<script>
    function entregaexitosa(confirm) {
        if (confirm) {
            var tipodepago = document.getElementById("metododepago").value;
            $.post(ruta + "Entrega",
                    {
                        cmd: 'confirmarentregaexitosa',
                        numerosdeordenes: numerosdeordenes,
                        tipodepago: tipodepago
                    }, function (json) {
                DialogAlertConfirm(json['msg'], '');
            });
        }
    }
</script>