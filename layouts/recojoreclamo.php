<?php
//echo "recojoreclamo";
//imprimir($recojoreclamo);
//echo "reclamodeprenda";
//imprimir($reclamodeprenda);
?>
<link href="design/assets/css/recojo.css" rel="stylesheet" type="text/css"/>

<form action="javascript:void(0)" method="POST" enctype="multipart/form-data" class="formData" id="formData" name="formData">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
            <div class="card h-100">
                <div class="card-body">                
                    <div class="row">
                        <div class="col-12">
                            <strong>
                                <a href="javascript:void(0)" class="text-secondary">SERVICIO : <?php echo @$recojoreclamo[0]['nombredeservicio']; ?></a>                                
                            </strong>

                            <input type="hidden" hidden="hidden" name="iddeorden" id="iddeorden" value="<?php echo @$recojoreclamo[0]['idorden']; ?>">
                            <input type="hidden" hidden="hidden" name="keyprenda" id="keyprenda" value="<?php echo @$reclamodeprenda[0]['keyprenda']; ?>">
                            <input type="hidden" hidden="hidden" name="numerodeorden" id="numerodeorden" value="<?php echo @$recojoreclamo[0]['numerodeorden']; ?>">
                            <input type="hidden" hidden="hidden" name="idservicio" id="idservicio" value="<?php echo @$recojoreclamo[0]['idservicio']; ?>">
                            <input type="hidden" hidden="hidden" name="nombreservicio" id="nombreservicio" value="<?php echo @$recojoreclamo[0]['nombredeservicio']; ?>">
                            <input type="hidden" hidden="hidden" name="diasservicios" id="diasservicios" value="<?php echo @$recojoreclamo[0]['diasdeservicio']; ?>">
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
        <div id="itemsservicios" name="itemsservicios">

            <div ss="item1" id="item1" name="item1">
                <div class="card" id="card1" name="card1">
                    <div class="card-body">              
                        <div style="margin-bottom: 15px;"></div>
                        <div class="row"> 
                            <div class="col-12">
                                <div class="form-group basic">
                                    <div class="input-wrapper" data-select2-id="select2-data-5-r3mu">   
                                        <div class="input-wrapper" data-select2-id="select2-data-4-918s">
                                            <select class="form-control" id="prenda" name="prenda" onchange="obtenerPrecio(1);piezasPrendas(1);">
                                                <option value="<?php echo @$recojoreclamo[0]['idprenda']; ?>"><?php echo @$reclamodeprenda[0]['nombreprenda']; ?></option> 
                                            </select>
                                            <input type="hidden" hidden="hidden" name="nombredeprenda" id="nombredeprenda" value="<?php echo @$reclamodeprenda[0]['nombreprenda']; ?>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="items" name="items">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group basic">
                                        <div class="input-wrapper">
                                            <div class="input-wrapper">
                                                <select class="form-control" id="color" name="color">
                                                    <option value="<?php echo @$reclamodeprenda[0]['color']; ?>"><?php echo @$reclamodeprenda[0]['color']; ?></option> 
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group basic">
                                        <div class="input-wrapper">
                                            <div class="input-wrapper">
                                                <select class="form-control" id="marca" name="marca">
                                                    <option value="<?php echo @$reclamodeprenda[0]['marca']; ?>"><?php echo @$reclamodeprenda[0]['marca']; ?></option> 
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <strong>
                                        <a href="javascript:void(0)" class="text-secondary">ESTADO:</a>
                                    </strong>
                                    <div class="col-12" id="campo" name="campo" style="margin-top: 10px;">
                                        <?php
                                        $estadosdereclamo = $pdo->select(
                                                tabla('estadoreclamo'),
                                                [
                                                    "id",
                                                    "nombre"
                                                ],
                                                [
                                                    "estado" => 'Activo'
                                                ]
                                        );
                                        for ($edr = 0; $edr < count($estadosdereclamo); $edr++) {
                                            ?>
                                            <div class="">
                                                <input type="checkbox" style="transform : scale(1.7);margin-right: 14px;" id="estado_<?php echo $estadosdereclamo[$edr]['id']; ?>" name="estado[]" value="<?php echo $estadosdereclamo[$edr]['nombre']; ?>"><label class="form-check-label"><?php echo strtoupper($estadosdereclamo[$edr]['nombre']); ?></label>
                                            </div>
                                            <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <strong>
                                        <a href="javascript:void(0)" class="text-secondary">OBSERVACIONES:</a>
                                    </strong>
                                    <textarea class="form-control" id="observacion" name="observacion" rows="4" placeholder="OBSERVACIONES"></textarea>
                                </div>
                            </div>
                            <div class="form-group basic">
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
                                                    <input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="archivo" name="archivo[]" class="choose" style="display: none;" onchange="contarImagenes('');">
                                                </label>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</form>
<div style="margin-bottom: 30px;"></div>

<div style="position: fixed;border-radius: 0px;z-index: 9991;bottom: 0px;left: 0px;height: 56px;width: 100%;font-size: 18px;">
    <div class="row">                             
        <div class="col-10" style="padding-right: 0px;margin-right: 0px;">
            <button class="btn btn-success" style="width: 100%;border-radius: 0px;height: 56px;" data-bs-toggle="modal" data-bs-target="#DialogForm" onclick="obtenerdias();">
                CONFIRMAR RECEPCIÓN
            </button>
        </div>
        <div class="col-2" style="padding-left: 0px;margin-left: 0px;padding-right: 0px;margin-right: 0px;right: 0px;position: absolute;">
            <label class="btn btn-danger ir-arriba-add" style="width: 100%;border-radius: 0px;height: 56px;padding: 0px;" onclick="addItem();">
                <center>
                    <ion-icon name="add-outline"></ion-icon>
                </center>
            </label>      
        </div>
    </div>
</div>

<!-- Dialog Form -->
<div class="modal fade dialogbox hide" id="DialogForm" name="DialogForm" data-bs-backdrop="static" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">CONFIRMAR ENTREGA</h5>
            </div>
            <div class="modal-body text-start mb-2">
                <div class="form-group basic">                    
                    <div class="input-wrapper">   
                        <div class="input-wrapper">
                            <div class="input-group mb-12">
                                <input type="hidden" hidden="hidden" class="form-control" readonly="readonly" style="text-align: center;" min="1" value="0" id="totaldias" name="totaldias" placeholder="TOTAL DE DIAS">
                            </div>
                        </div>
                    </div>
                </div>
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
            </div>
            <div class="modal-footer">
                <div class="btn-inline">
                    <button type="button" class="btn btn-text-danger" data-bs-dismiss="modal" id="cancelarfechaentrega" name="cancelarfechaentrega">CANCELAR</button>
                    <button type="button" class="btn btn-text-primary" id="enviarDatos" name="enviarDatos" data-bs-toggle="modal" data-bs-target="#ModalPrintTicket">GUARDAR</button>
                </div>
            </div>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<style>
    .choose::-webkit-file-upload-button {
        color: white;
        display: inline-block;
        background: #1CB6E0;
        border: none;
        padding: 7px 15px;
        font-weight: 700;
        border-radius: 3px;
        white-space: nowrap;
        cursor: pointer;
        font-size: 10pt;
    }
</style>
<script src="design/js/crud/recojoreclamo.js" type="text/javascript"></script>