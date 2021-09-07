<?php
include "./include/sessionstart/session.php";
require '../servicios/include/function.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <?php
        include "./include/header/header_login.php";
        ?>
        <style>
            .iframeMap{
                width: 100%;
                height: calc(100vh - 100px);
            }
        </style>
    </head>
    <body class="<?php echo @$_SESSION['themedark']; ?>">
        <input type="hidden" hidden="hidden" id="idrepartidor" name="idrepartidor" value="<?php echo @$_SESSION[atributo('id')]; ?>">

        <!-- App Header -->
        <div class="appHeader">
            <div class="left">
                <a href="#" class="headerButton goBack" onclick="goBack();">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </a>
            </div>
            <div class="pageTitle">ENTREGA Y RECOJO</div>
            <div class="right">
                <a href="" class="headerButton goBack">
                    <ion-icon name="reload-outline"></ion-icon>
                </a>
            </div>
        </div>
        <!-- * App Header -->

        <!-- App Capsule -->
        <div id="appCapsule" name="appCapsule">

            <div class="section mt-2">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-05">
                            Que desea buscar...                            
                        </div>
                        <div class="form-group basic animated">
                            <div class="input-wrapper">
                                <input type="text" class="form-control" id="searchfilter" name="searchfilter" placeholder="Buscar..." onkeyup="searchFilter()">
                                <i class="clear-input">
                                    <ion-icon name="close-circle"></ion-icon>
                                </i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Basic -->
            <div class="modal fade modalbox" id="mapaclientes" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Mapa - Turno <label id="turnoname"></label></h5>
                            <a href="javascript:;" data-bs-dismiss="modal" onclick="cerrarmapaporturno();">Cerrar</a>
                        </div>
                        <div class="modal-body">
                            <div id="iframeMap" name="iframeMap" class="iframeMap"></div> 
                        </div>
                    </div>
                </div>
            </div>
            <!-- * Modal Basic -->


            <div class="section mt-2">
                <div class="card">
                    <div class="card-body">

                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" style="width: 100% !important;">
                                VER MAPA POR TURNO
                            </button>
                            <div class="dropdown-menu" style="width: 100% !important;">
                                <a class="dropdown-item" href="#" onclick="mapaporturno('Mañana');" data-bs-toggle="modal" data-bs-target="#mapaclientes">
                                    <ion-icon name="arrow-forward-outline"></ion-icon>&nbsp;&nbsp;<ion-icon name="map-outline"></ion-icon>
                                    TURNO MAÑANA
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="mapaporturno('Tarde');" data-bs-toggle="modal" data-bs-target="#mapaclientes">
                                    <ion-icon name="arrow-forward-outline"></ion-icon>&nbsp;&nbsp;<ion-icon name="map-outline"></ion-icon>
                                    TURNO TARDE
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div id="divturnos" class="divturnos">

                <div class="listview-title mt-2">
                    Turno Mañana
                </div>
                <ul class="listview image-listview inset turnomaniana" id="turnomaniana" name="turnomaniana">
                </ul>

                <div class="listview-title mt-2">
                    Turno Tarde
                </div>
                <ul class="listview image-listview inset turnotarde" id="turnotarde" name="turnotarde">
                </ul>
            </div>
        </div>
        <br>
        <!-- * App Capsule -->   

        <?php
        include "./include/bottom_menu.php";
        ?>
        <!-- ========= JS Files =========  -->
        <?php
        include "./include/footer/footer_login.php";
        ?>
        <script async src="design/js/crud/searchFilter.js<?php echo @$v; ?>" type="text/javascript"></script>
        <script async src="design/js/crud/cliente.js<?php echo @$v; ?>" type="text/javascript"></script>

        <script>
                                    function mapaporturno(tipoturno) {
                                        document.getElementById("turnoname").innerHTML = tipoturno;
                                        document.getElementById("iframeMap").innerHTML = "<iframe src='design/leafletRealtime/examples/?tipoturno=" + tipoturno + "' class='iframeMap'></iframe>";
                                    }

                                    function cerrarmapaporturno() {
                                        document.getElementById("iframeMap").innerHTML = "";
                                    }
        </script>
    </body>
</html>
