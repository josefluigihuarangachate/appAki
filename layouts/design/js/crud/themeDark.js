$(document).ready(function () {
    $("#cambiarthemedark").click(function () {
        $.post(ruta + "Themedark", function (data) {

            console.log('Theme Dark - Cambiado');
            setTimeout(function () {
                location.reload();
            }, 900);
        });
    });
});