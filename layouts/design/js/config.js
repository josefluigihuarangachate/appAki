var ruta = "http://192.168.0.102:81/appAki/servicios/"; // IP EN MI CASA
// var ruta = "https://demo1.reidemotech.com/servicios/"; // EN PRODUCCION
//var ruta = "http://192.168.1.9:81/appAki/servicios/"; // IP EN LA EMPRESA 192.168.1.25
// var ruta = "http://192.168.1.29:81/appAki/servicios/";
function goBack() {
    if ('referrer' in document) {
        window.location = document.referrer;
        /* OR */
        //location.replace(document.referrer);
    } else {
        window.history.back();
    }
} 