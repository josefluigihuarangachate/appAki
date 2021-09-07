function DialogAlert(status, msg, ruta) {
    if (ruta === "") {
        if (status.trim() === "Ok" || status.trim() === "ok") {
            var dialogalert = "";
            dialogalert += '<div class="modal fade dialogbox" id="DialogOk" data-bs-backdrop="static" tabindex="-1" role="dialog">';
            dialogalert += '<div class="modal-dialog" role="document">';
            dialogalert += '<div class="modal-content">';
            dialogalert += '<div class="modal-header">';
            dialogalert += '<h5 class="modal-title">MENSAJE IMPORTANTE</h5>';
            dialogalert += '</div>';
            dialogalert += '<div class="modal-body">';
            dialogalert += msg;
            dialogalert += '</div>';
            //dialogalert += '<div class="modal-footer">';
            //dialogalert += '<div class="btn-inline">';
            //dialogalert += '<a href="#" class="btn btn-text-primary" data-bs-dismiss="modal">';
            //dialogalert += '<ion-icon name="checkmark-outline"></ion-icon>';
            //dialogalert += 'ACEPTAR';
            //dialogalert += '</a>';
            //dialogalert += '</div>';
            //dialogalert += '</div>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            document.getElementById("divdialogalert").innerHTML = "";
            document.getElementById("divdialogalert").innerHTML = dialogalert;
            $("#DialogOk").modal('show');
        } else if (status.trim() === "Error" || status.trim() === "error") {
            var dialogalert = "";
            dialogalert += '<div class="modal fade dialogbox" id="DialogError" data-bs-backdrop="static" tabindex="-1" role="dialog">';
            dialogalert += '<div class="modal-dialog" role="document">';
            dialogalert += '<div class="modal-content">';
            dialogalert += '<div class="modal-header">';
            dialogalert += '<h5 class="modal-title">MENSAJE IMPORTANTE</h5>';
            dialogalert += '</div>';
            dialogalert += '<div class="modal-body">';
            dialogalert += msg;
            dialogalert += '</div>';
            dialogalert += '<div class="modal-footer">';
            dialogalert += '<div class="btn-inline">';
            dialogalert += '<a href="#" class="btn btn-text-danger" data-bs-dismiss="modal">';
            dialogalert += '<ion-icon name="close-outline"></ion-icon>';
            dialogalert += 'CANCELAR';
            dialogalert += '</a>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            dialogalert += '</div>';
            document.getElementById("divdialogalert").innerHTML = "";
            document.getElementById("divdialogalert").innerHTML = dialogalert;
            $("#DialogError").modal('show');
        }
    } else if (ruta != "") {

        // FALTA
        var dialogalert = "";
        dialogalert += '<div class="modal fade dialogbox" id="DialogBasic" data-bs-backdrop="static" tabindex="-1" role="dialog">';
        dialogalert += '<div class="modal-dialog" role="document">';
        dialogalert += '<div class="modal-content">';
        dialogalert += '<div class="modal-header">';
        dialogalert += '<h5 class="modal-title">MENSAJE IMPORTANTE</h5>';
        dialogalert += '</div>';
        dialogalert += '<div class="modal-body">';
        dialogalert += msg;
        dialogalert += '</div>';
        dialogalert += '<div class="modal-footer">';
        dialogalert += '<div class="btn-inline">';
        dialogalert += '<a href="#" class="btn btn-text-danger" data-bs-dismiss="modal">';
        dialogalert += '<ion-icon name="close-outline"></ion-icon>';
        dialogalert += 'CANCELAR';
        dialogalert += '</a>';
        dialogalert += '<a href="#" class="btn btn-text-primary" data-bs-dismiss="modal">';
        dialogalert += '<ion-icon name="checkmark-outline"></ion-icon>';
        dialogalert += 'ACEPTAR';
        dialogalert += '</a>';
        dialogalert += '</div>';
        dialogalert += '</div>';
        dialogalert += '</div>';
        dialogalert += '</div>';
        dialogalert += '</div>';
        $("#DialogBasic").modal('show');
    }
}

// FUNCION SIRVE PARA CONFIRMAR Y REALIZAR UNA ACCION POR EJEMPLO ELIMINAR ACTUALZIAR
function DialogAlertConfirm(msg, nombrefuncion) {

    if (cleanStr(msg) === "") {
        msg = "Esta seguro que desea realizar esta operacion?";
    }

    if (cleanStr(nombrefuncion) != "") {
        var booleano = true;
        nombrefuncion = nombrefuncion + "(" + booleano + ");";
    } else {
        nombrefuncion = "#";
    }

    var dialogalert = "";
    dialogalert += '<div class="modal fade dialogbox" id="DialogAlertConfirm" data-bs-backdrop="static" tabindex="-1" role="dialog">';
    dialogalert += '<div class="modal-dialog" role="document">';
    dialogalert += '<div class="modal-content">';
    dialogalert += '<div class="modal-header">';
    dialogalert += '<h5 class="modal-title">MENSAJE IMPORTANTE</h5>';
    dialogalert += '</div>';
    dialogalert += '<div class="modal-body">';
    dialogalert += msg;
    dialogalert += '</div>';
    dialogalert += '<div class="modal-footer">';
    dialogalert += '<div class="btn-inline">';
    dialogalert += '<a href="#" class="btn btn-text-danger" data-bs-dismiss="modal">';
    dialogalert += '<ion-icon name="close-outline"></ion-icon>';
    dialogalert += 'CANCELAR';
    dialogalert += '</a>';
    dialogalert += '<button onclick="' + nombrefuncion + '" class="btn btn-text-primary" data-bs-dismiss="modal">';
    dialogalert += '<ion-icon name="checkmark-outline"></ion-icon>';
    dialogalert += 'ACEPTAR';
    dialogalert += '</a>';
    dialogalert += '</div>';
    dialogalert += '</div>';
    dialogalert += '</div>';
    dialogalert += '</div>';
    dialogalert += '</div>';
    document.getElementById("divdialogalert").innerHTML = "";
    document.getElementById("divdialogalert").innerHTML = dialogalert;
    $("#DialogAlertConfirm").modal('show');

}

function confirmar(nombrefuncion) {
    DialogAlertConfirm('', nombrefuncion);
}
// FIN FUNCION SIRVE PARA CONFIRMAR Y REALIZAR UNA ACCION POR EJEMPLO ELIMINAR ACTUALZIAR
