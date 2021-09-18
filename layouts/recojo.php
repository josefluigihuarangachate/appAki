<link href="design/assets/css/recojo.css" rel="stylesheet" type="text/css"/>
<div class="card" style="margin-bottom: 18px;text-align: center;">
    <div class="card-body">
        <div class="row">
            <div class="col">
                Hay <label id="totaldeitems" name="totaldeitems">0 orden</label>
            </div>
            <div class="col">
                Total : S/. <label id="pagototal" name="pagototal">0.00</label>
            </div>
        </div>
    </div>
</div>

<form action="javascript:void(0)" method="POST" enctype="multipart/form-data" class="formData" id="formData" name="formData">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
            <div class="card h-100">
                <div class="card-body">                
                    <div class="row">
                        <div class="col-12">
                            <strong>
                                <a href="#" class="text-secondary">SERVICIO:</a>&nbsp;&nbsp;
                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <select class="form-control" id="servicio" name="servicio" onchange="obtenerPrenda(this.value);">                                            
                                        </select>
                                        <input type="hidden" hidden="hidden" name="diasservicios" id="diasservicios" value="0">
                                    </div>
                                </div>
                            </strong>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
        <div id="itemsservicios" name="itemsservicios"></div>
    </div>
</form>
<div style="margin-bottom: 10px;"></div>

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
<script src="design/js/crud/recojo.js" type="text/javascript"></script>