<!DOCTYPE html>
<html>
    <head>
        <?php
        include "./include/header/header_login.php";
        ?>

    </head>
    <body class="bgbody">
        <!-- App Capsule -->
        <div id="appCapsule">
            <div class="section">
                <center>
                    <img src="design/aki/logo.png" alt="image" class="form-image" style="height: 170px; padding: 10px;">
                </center>
            </div>
            <div class="section mt-2 text-center">

                <h1>BIENVENIDO</h1>
                <h4>Ingrese su cuenta</h4>
            </div>

            <div class="section mb-5 p-2">
                <form action="javascript:void(0);" id="formdata" name="formdata" method="POST">
                    <div class="card">
                        <div class="card-body pb-1">
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <label class="label" for="idrepartidor">CODIGO DE REPARTIDOR</label>
                                    <input type="password" value="REP0001" class="form-control" id="idrepartidor" name="idrepartidor" autocomplete="off" placeholder="*****">
                                    <i class="clear-input">
                                        <ion-icon name="close-circle"></ion-icon>
                                    </i>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-check mb-1">
                        <input type="checkbox" class="form-check-input" id="chkrecordarcuenta" name="chkrecordarcuenta">
                        <label class="form-check-label" for="chkrecordarcuenta">Recordar mi cuenta</label>
                    </div>
                    <div class="form-links mt-2">
                        <div>
                            <a href="javascript:void(0)">Version 1.0</a>
                        </div>
                        <div><a href="#" class="text-muted">Olvide mi cuenta?</a></div>
                    </div>
                    <div class="form-button-group  transparent">
                        <button type="button" class="btn btn-primary btn-block btn-lg btnsend" onclick="DialogAlert();">INICIAR SESIÓN</button>
                    </div>
                </form>
            </div>

        </div>
        <!-- * App Capsule -->
        <!-- * Android Add to Home Action Sheet -->

        <!-- ========= JS Files =========  -->
        <?php
        $v = "?v=" . date("Ymdhis");
        include "./include/footer/footer_login.php";
        ?>
        <script src="design/js/crud/login.js<?php echo $v; ?>" type="text/javascript"></script>        
    </body>
</html>