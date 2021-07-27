$(document).ready(function () {
    $(".btnsend").click(function () {

        // VALIDO SI MARCARON - RECORDAR CONTRASEÑA
        var chkrecordar = new Boolean(false);
        if (document.getElementById('chkrecordarcuenta').checked)
        {
            chkrecordar = Boolean(true);
        }
        // FIN

        var formData = new FormData($('#formdata')[0]);
        formData.append("chkrecordar", chkrecordar);
        formData.append("cmd", '');
        $.ajax({
            url: ruta + 'Login',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false
        })

                .done(function (json) {
                    DialogAlert(json['status'], json['msg'], '');

                    if (json['status'] == 'Ok') {
                        setTimeout(function () {
                            window.location.href = json['redirect'];
                        }, 1500);
                    }
                })
                .always(function () {
                    // Likewise, if .always is defined last, it will execute last:
                })
                .fail(function () {
                    // console.log("An error occurred, the files couldn't be sent!");
                });
    });
});
