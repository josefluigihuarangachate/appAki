var ruta = "http://192.168.0.103:81/appAki/servicios/"; // IP EN MI CASA
//var ruta = "https://demo1.reidemotech.com/servicios/"; // EN PRODUCCION
//var ruta = "http://192.168.1.26:81/appAki/servicios/"; // IP EN LA EMPRESA 192.168.1.25
//var ruta = "http://192.168.1.29:81/appAki/servicios/";
function goBack() {
    window.history.back();
}

function cleanStr(str) {
    if (str) {
        while (str.indexOf("\t") > -1) {
            str = str.replace("\t", " ");
        }
        while (str.indexOf("  ") > -1) {
            str = str.replace("  ", " ");
        }
    }
    return str;
}