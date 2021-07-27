$(document).ready(function () {
    $(".btnlogout").click(function () {
        $.ajax({
            url: ruta + 'Login',
            type: 'PUT',
            processData: false,
            contentType: false
        })
                .done(function (json) {
                    setTimeout(function () {
                        window.location.href = json['redirect'];
                    }, 100);
                })
                .always(function () {
                    // Likewise, if .always is defined last, it will execute last:
                })
                .fail(function () {
                    // console.log("An error occurred, the files couldn't be sent!");
                });
    });
});
