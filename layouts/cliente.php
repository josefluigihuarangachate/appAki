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
            <div class="pageTitle">DESPACHO Y RECOJO</div>
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
                            <span class="badge badge-info" style="float: right;border-radius: 50px;width: 30px;height: 30px;font-size: 30px;" data-bs-toggle="modal" data-bs-target="#mapaclientes">
                                <ion-icon name="map-outline"></ion-icon>
                            </span>
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
                            <h5 class="modal-title">Mapa de Ayuda</h5>
                            <a href="javascript:;" data-bs-dismiss="modal">Cerrar</a>
                        </div>
                        <div class="modal-body">
                            <div id="map" style="width: 100%;height: calc(100vh - 100px);"></div> 
                        </div>
                    </div>
                </div>
            </div>
            <!-- * Modal Basic -->


            <div id="divturnos" class="divturnos">

                <div class="listview-title mt-2">Turno Mañana</div>
                <ul class="listview image-listview inset turnomaniana" id="turnomaniana" name="turnomaniana">
                </ul>

                <div class="listview-title mt-2">Turno Tarde</div>
                <ul class="listview image-listview inset turnotarde" id="turnotarde" name="turnotarde">






                    <!--                    <li>
                                            <a href="#" class="item">
                                                <img src="design/aki/recojo.png" alt="image" class="image">
                                                <div class="in">
                                                    <div>
                    
                                                        <label class="label">Ana Margarita Rodriguez Santamarina</label>
                                                        <header class="header">+51934505203</header>                                
                                                        <footer class="footer">AA.hh la molina</footer>
                                                        <footer style="float: right;font-size: 13px;position: relative;">08:09:00</footer>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="item">
                                                <img src="design/aki/despacho.png" alt="image" class="image">
                                                <div class="in">
                                                    <div>
                                                        <label class="label">Henry Margarita Rodriguez Santamarina</label>
                                                        <header class="header">+51934505203</header>                                
                                                        <footer class="footer">AA.hh la molina</footer>
                                                    </div>
                                                    <div>
                                                        <label style="float: right;font-size: 13px;position: relative;">08:09:00</label>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>-->










                </ul>

                <div class="listview-title mt-2">Turno Noche</div>
                <ul class="listview image-listview inset turnonoche" id="turnonoche" name="turnonoche">
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
        <script src="design/js/crud/searchFilter.js<?php echo @$v; ?>" type="text/javascript"></script>
        <script src="design/js/crud/cliente.js<?php echo @$v; ?>" type="text/javascript"></script>



        <script>

                                    // Initialize and add the map
                                    function initMap() {
                                        // The location of Uluru
                                        const uluru = {lat: -25.344, lng: 131.036};
                                        // The map, centered at Uluru
                                        const map = new google.maps.Map(document.getElementById("map"), {
                                            zoom: 4,
                                            center: uluru,
                                        });
                                        // The marker, positioned at Uluru
                                        const marker = new google.maps.Marker({
                                            position: uluru,
                                            map: map,
                                        });
                                    }
        </script>
    </body>
</html>
