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
                <a href="" class="headerButton goBack">
                    <ion-icon name="reload-outline"></ion-icon>
                </a>
            </div>
        </div>
        <!-- * App Header -->

        <!-- App Capsule -->
        <div id="appCapsule">



            <div class="section mt-2">
                <div class="card bg-light mb-2">
                    <div class="card-header">INFORMACIÓN DEL CLIENTE:</div>
                    <div class="card-body">
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

            <!--<label class="btn btn-icon btn-info me-1 btn-lg" style="float: right;">
                <ion-icon name="add-outline"></ion-icon>
            </label>
            <div class="section-title">DETALLES:</div>
            <hr>
            <div class="card">

                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Artículo</th>
                                <th scope="col">No</th>
                                <th scope="col">Primer Servicio</th>
                                <th scope="col">Segundo Servicio</th>
                                <th scope="col">Tercer Servicio</th>
                                <th scope="col">Días</th>
                                <th scope="col">Totales</th>
                                <th scope="col">
                        <center>Observaciones</center>
                        </th>
                        <th scope="col"></th>
                        <th scope="col">Fecha</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Camisa</option>
                                        <option>Terno</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" value="2" class="form-control widthInputDetalles">
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" value="2" class="form-control widthInputDetalles">
                                </td>
                                <td>
                                    <input type="number" value="6" class="form-control widthInputDetalles">
                                </td>
                                <td colspan="1">
                                    <textarea class="form-control widthInputDetalles" placeholder="Observaciones..." rows="1"></textarea>
                                </td>
                                <td>
                                    <label class="btn btn-icon btn-info me-1 btn-info" for="fileObservaciones">
                                        <ion-icon name="images-outline"></ion-icon>
                                    </label>

                                    <input type="file" style="display: none;" id="fileObservaciones" accept=".png, .jpg, .jpeg">

                                    </div>
                                </td>
                                <td>
                                    <input type="date" class="form-control widthInputDetalles" value="<?php echo date("Y-m-d"); ?>">
                                </td>
                            </tr> 
                            <tr>
                                <th scope="row">2</th>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Camisa</option>
                                        <option>Terno</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" value="2" class="form-control widthInputDetalles">
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control custom-select widthInputDetalles">
                                        <option>Servicio 1</option>
                                        <option>Servicio 2</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" value="2" class="form-control widthInputDetalles">
                                </td>
                                <td>
                                    <input type="number" value="6" class="form-control widthInputDetalles">
                                </td>
                                <td colspan="1">
                                    <textarea class="form-control widthInputDetalles" placeholder="Observaciones..." rows="1"></textarea>
                                </td>
                                <td>
                                    <label class="btn btn-icon btn-info me-1 btn-info" for="fileObservaciones">
                                        <ion-icon name="images-outline"></ion-icon>
                                    </label>

                                    <input type="file" style="display: none;" id="fileObservaciones" accept=".png, .jpg, .jpeg">

                                    </div>
                                </td>
                                <td>
                                    <input type="date" class="form-control widthInputDetalles" value="<?php echo date("Y-m-d"); ?>">
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>

            </div>

            <button type="button" class="btn btn-success rounded shadowed  me-1 mb-1" 
                    style="position: fixed;z-index: 999999;bottom: 59px;right: 4px;">
                <ion-icon name="cash-outline"></ion-icon>&nbsp;S/.
                <label>35.00</label>
            </button>
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
    <!--        <script src="design/js/crud/searchFilter.js<?php //echo @$v;              ?>" type="text/javascript"></script>
            <script src="design/js/crud/cliente.js<?php //echo @$v;              ?>" type="text/javascript"></script>-->
            </body>
            </html>
