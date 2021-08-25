<?php
include "./include/sessionstart/session.php";
?>
<!DOCTYPE html>
<html>
    <head>
        <?php
        include "./include/header/header_login.php";
        ?>
    </head>
    <body class="<?php echo @$_SESSION['themedark']; ?>">

        <!-- App Header -->
        <div class="appHeader">
            <div class="left">
                <a href="#" class="headerButton goBack" onclick="goBack();">
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
                                        } else if (@$_SESSION['estadoturnotemp'] == 'Despacho') {
                                            ?>
                                            <span class="badge badge-success" style="padding: 14px;font-size: 14px;">
                                                <strong>ENTREGA</strong>                                        
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


            <div class="section mt-2">
                <?php
                if (@$_SESSION['estadoturnotemp'] == 'Recojo') {
                    include "./recojo.php";
                } else if (@$_SESSION['estadoturnotemp'] == 'Despacho') {
                    include "./despacho.php";
                }
                ?>

            </div>
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
<!--        <script src="design/js/crud/searchFilter.js<?php //echo @$v;                       ?>" type="text/javascript"></script>
        <script src="design/js/crud/cliente.js<?php //echo @$v;                       ?>" type="text/javascript"></script>-->
    </body>
</html>
