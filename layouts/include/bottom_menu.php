
<!-- App Bottom Menu -->
<div class="appBottomMenu">
    <a href="zona" class="item">
        <div class="col">
            <ion-icon name="bus-outline"></ion-icon>
            <strong>MIS ZONAS</strong>
        </div>
    </a>
    <!--    <a href="index-2.html" class="item">
            <div class="col">
                <ion-icon name="pie-chart-outline"></ion-icon>
                <strong>Overview</strong>
            </div>
        </a>
        <a href="app-components.html" class="item">
            <div class="col">
                <ion-icon name="apps-outline"></ion-icon>
                <strong>Components</strong>
            </div>
        </a>
        <a href="app-cards.html" class="item">
            <div class="col">
                <ion-icon name="card-outline"></ion-icon>
                <strong>My Cards</strong>
            </div>
        </a>-->

    <a href="#" class="item">
        <div class="col">
            <div class="action-button large mycolor hideButton">
                <ion-icon name="cube-outline"></ion-icon>
            </div>
        </div>
    </a>
    <a href="#" class="item" data-bs-toggle="modal" data-bs-target="#PanelLeft">
        <div class="col">
            <ion-icon name="settings-outline"></ion-icon>
            <strong>CONFIGURACIÓN</strong>
        </div>
    </a>
    <!--    <a class="item btnlogout" href="#">
            <div class="col">
                <ion-icon name="exit-outline"></ion-icon>
                <strong>CERRAR SESIÓN</strong>
            </div>
        </a>-->
</div>
<!-- * App Bottom Menu -->



<!-- Panel Left -->
<div class="panelbox panelbox-left modal fade" id="PanelLeft" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="z-index: 999999;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Configuración</h5>
                <a href="javascript:;" data-bs-dismiss="modal">
                    <ion-icon name="close-outline"></ion-icon>
                </a>
            </div>
            <div class="modal-body">
                <?php
                //echo '<pre>';
                //var_dump($_SESSION['lgid']);
                echo @$_SESSION['nombrecorto'];
                //echo '</pre>';
                ?>
                <br>
                <small><sup>USUARIO</sup></small>
                <!--                <a href="#" class="nav-item nav-link">MI PERFIL</a>
                                <a href="#" class="nav-item nav-link">NOTIFICACIONES</a>-->

                <ul class="listview image-listview">
                    <li>
                        <div class="item">
                            <div class="icon-box">
                                <ion-icon name="person-outline"></ion-icon>
                            </div>
                            <div class="in">
                                <div>MI PERFIL</div>
                            </div>
                        </div>
                    </li>
                </ul>

                <!-- CAMBIAR A COLOR DARK -->
                <ul class="listview image-listview">
                    <li>
                        <div class="item">
                            <div class="icon-box">
                                <ion-icon name="moon-outline"></ion-icon>
                            </div>
                            <div class="in">
                                <div>MODO OSCURO</div>
                                <div class="form-check form-switch  ms-2">
                                    <input class="form-check-input dark-mode-switch" type="checkbox" id="cambiarthemedark"
                                    <?php
                                    if (@$_SESSION['themedark'] != '') {
                                        echo " checked";
                                    }
                                    ?>
                                           >
                                    <label class="form-check-label" for="cambiarthemedark"></label> 
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- CAMBIAR A COLOR DARK -->

            </div>
            <div class="modal-header" style="padding: 0rem 0rem;">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td class="td_header">
                                <a href="#" class="nav-item nav-link btnlogout">
                                    <ion-icon name="exit-outline"></ion-icon>&nbsp;
                                    Cerrar Sessión
                                </a>
                            </td>
                            <td class="td_header">
                                <a href="#" class="nav-item nav-link">
                                    <ion-icon name="help-circle-outline"></ion-icon>&nbsp;
                                    Ayuda
                                </a>
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- * Panel Left -->
