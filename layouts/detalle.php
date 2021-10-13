<?php
include "../vendor/autoload.php";
include "../servicios/include/function.php";
include "./include/sessionstart/session.php";
include "../servicios/include/config.php";
include "../servicios/include/conexion.php";
include "../servicios/include/tables.php";
?>
<!DOCTYPE html>
<html>
    <head>
        <?php
        include "./include/header/header_login.php";
        ?>
        <script src="design/js/crud/dialogalert.js" type="text/javascript"></script>
        <style>
            .ir-arriba {
                text-align: center;
                display: none;
                border-radius: 50px;
                height: 55px;
                width: 55px;
                background: #24c6f5;
                font-size: 30px;
                line-height: 60px;
                color: #fff;
                cursor: pointer;
                position: fixed;
                bottom: 70px;
                right: 20px;
                opacity: 0.7;
            }
        </style>
    </head>
    <body class="<?php echo @$_SESSION['themedark']; ?>">

        <!-- App Header -->
        <div class="appHeader">
            <div class="left">
                <a href="#" class="headerButton goBack" onclick="goBack();return false;">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </a>
            </div>
            <div class="pageTitle">DETALLE</div>
            <div class="right">
                <a href="" class="headerButton goBack" id="recargarpagina" name="recargarpagina">
                    <ion-icon name="reload-outline"></ion-icon>
                </a>
            </div>
        </div>
        <!-- * App Header -->

        <!-- App Capsule -->
        <div id="appCapsule" style="padding-bottom: 0px !important;">
            <div class="section inset mt-2">
                <div class="accordion" id="accordionExample1">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordion01">
                                INFORMACIÓN DEL CLIENTE:
                            </button>
                        </h2>
                        <div id="accordion01" class="accordion-collapse collapse show" data-bs-parent="#accordionExample1">
                            <div class="accordion-body">
                                <h5 class="card-title">Nombre y Apellido:</h5>
                                <p class="card-text"><?php echo $_SESSION['nombrecliente']; ?></p>                        
                                <h5 class="card-title">Celular:</h5>
                                <p class="card-text">
                                    <?php
                                    if (!empty($_SESSION['telefono'])) {
                                        echo $_SESSION['telefono'];
                                    } else {
                                        echo "---------";
                                    }
                                    ?>
                                </p>
                                <h5 class="card-title">Dirección:</h5>
                                <p class="card-text">
                                    <?php
                                    if (!empty($_SESSION['direccion'])) {
                                        echo $_SESSION['direccion'];
                                    } else {
                                        echo "Sin especificar";
                                    }
                                    ?>
                                </p>
                                <center>
                                    <h5 class="card-title">Tipo de Atención:</h5>
                                    <p class="card-text">
                                        <?php
                                        if (@$_SESSION['estadoturnotemp'] == 'Recojo') {
                                            ?>
                                            <span class="badge badge-danger" style="padding: 14px;font-size: 14px;">
                                                <strong>RECOJO</strong>
                                            </span>   
                                            <?php
                                        } else if (@$_SESSION['estadoturnotemp'] == 'Entrega') {
                                            ?>
                                            <span class="badge badge-success" style="padding: 14px;font-size: 14px;">
                                                <strong>ENTREGA</strong>                                        
                                            </span>  
                                            <?php
                                        } else if (@$_SESSION['estadoturnotemp'] == 'Reclamo') {
                                            ?>
                                            <span class="badge badge-info" style="padding: 14px;font-size: 14px;">
                                                <strong>ENTREGA DE RECLAMO</strong>                                        
                                            </span> 
                                            <?php
                                        }
                                        ?>
                                    </p>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            <!-- * card block -->



            <?php
            $recojoreclamo = $pdo->select(
                    tabla('turnoxcliente'),
                    [
                        "[><]" . tabla('orden') =>
                        [
                            tabla('turnoxcliente') . ".numero_orden" => "numeroorden"
                        ],
                        "[><]" . tabla('servicio') =>
                        [
                            tabla('orden') . ".nombre_servicio" => "Nombre_Servicio"
                        ]
                    ],
                    [
                        tabla('orden') . ".id(idorden)",
                        tabla('orden') . ".numeroorden(numerodeorden)",
                        tabla('orden') . ".nombre_servicio(nombredeservicio)",
                        tabla('servicio') . ".id(idservicio)",
                        tabla('servicio') . ".Dias_Servicio(diasdeservicio)",
                        tabla('turnoxcliente') . ".numero_orden",
                        tabla('turnoxcliente') . ".idprenda",
                    ],
                    [
                        tabla('turnoxcliente') . ".id" => intval(@$_SESSION['idturnoxrepartidortemp'])
                    ],
                    [
                        'LIMIT' => 1
                    ]
            );

            $reclamodeprenda = $pdo->select(
                    tabla('detalleorden'),
                    [
                        tabla('detalleorden') . ".idprenda(idprenda)",
                        tabla('detalleorden') . ".nombreprenda(nombreprenda)",
                        tabla('detalleorden') . ".color",
                        tabla('detalleorden') . ".marca",
                        tabla('detalleorden') . ".ordenpromocion(keyprenda)",
                    ],
                    [
                        tabla('detalleorden') . ".idorden" => @$recojoreclamo[0]['idorden'],
                        tabla('detalleorden') . ".idprenda" => @$recojoreclamo[0]['idprenda'],
                    ],
                    [
                        'LIMIT' => 1
                    ]
            );

            if (@$recojoreclamo && @$_SESSION['estadoturnotemp'] == 'Recojo') {
                ?>
                <div class="section mt-2">
                    <?php include "./recojoreclamo.php"; ?> 
                </div>
                <?php
            } else if (@$_SESSION['estadoturnotemp'] == 'Recojo') {
                ?>
                <div class="section mt-2">
                    <?php include "./recojo.php"; ?> 
                </div>
                <?php
            } else if (@$_SESSION['estadoturnotemp'] == 'Entrega') {
                include "./entrega.php";
            } else if (@$_SESSION['estadoturnotemp'] == 'Reclamo') {
                include "./reclamo.php";
            }
            ?>

            <input type="hidden" hidden="hidden" id="latitud_actual" name="latitud_actual">
            <input type="hidden" hidden="hidden" id="longitud_actual" name="longitud_actual">
        </div>
        <!-- * App Capsule -->
        <br>
        <br>
        <!-- * App Capsule -->   


        <?php
        include "./include/bottom_menu.php";
        ?>
        <!-- ========= JS Files =========  -->
        <?php
        include "./include/footer/footer_login.php";
        ?>
        <script>
            $(document).ready(function () {
                $('.ir-arriba').click(function () {
                    $('body, html').animate({
                        scrollTop: '0px'
                    }, 300);
                });
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 0) {
                        $('.ir-arriba').slideDown(300);
                    } else {
                        $('.ir-arriba').slideUp(300);
                    }
                });

            });
            $(document).ready(function () {
                $('.ir-arriba-add').click(function () {
                    $('.ir-arriba').click();
                });
            });
        </script>
        <!--        <script src="design/js/crud/searchFilter.js<?php //echo @$v;                                                                                   ?>" type="text/javascript"></script>
                <script src="design/js/crud/cliente.js<?php //echo @$v;                                                                                    ?>" type="text/javascript"></script>-->
    </body>
</html>
