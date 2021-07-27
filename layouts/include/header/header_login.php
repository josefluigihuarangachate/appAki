<?php
$v = "?v=" . date("Ydmhis");
?>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="theme-color" content="#12598e">
<title>Lavanderia Aki</title>
<link rel="icon" type="image/png" href="design/aki/logo.png">
<link rel="apple-touch-icon" href="design/aki/logo.png">
<link rel="stylesheet" href="design/assets/css/style.css<?php echo $v; ?>">
<link rel="manifest" href="__manifest.json">
<script src="design/js/config.js<?php echo $v; ?>"></script>
<script src="design/js/jquery-3.5.0.js<?php echo $v; ?>" type="text/javascript"></script>
<style>
    .mycolor{
        background-color: #12598e !important;
        border: 2px solid #0d4872 !important;
        border-radius: 50px;
    }
    .mycolor:hover{
        background-color: #0d4872 !important;
        border: 2px solid #12598e !important;
    }
    /*    .class-ion-icon {        
            font-size: 18px;
            position: absolute;
            right: 16px;
            color: #A9ABAD;
            opacity: 0.6;
            line-height: 1em;
            height: 18px;
            top: 50%;
            margin-top: -9px;
        }*/
    .td_header, .td_header > a{
        text-align: center;
        padding-top: 10px;
        padding-left: 0px;
        padding-right: 0px;
        padding-bottom: 8px;
        color: #333 !important;
        font-size: 15px;
    }

    .anchofull{
        width: 100% !important;
    }
    .fontSize-20{
        font-size: 15px !important;
        font-weight: bold;
    }

    .fontSize-1{
        font-size: 12px !important;
        font-weight: bold;
    }
    .fontSize-2{
        font-size: 11px !important;

    }
    .fontSize-3{
        font-size: 11px !important;
    }

    .widthInputDetalles{
        width: 250px;
    }

    .botoneliminarorden{
        border-radius: 50px !important;
        background-color: #ededed !important;
        padding: 9px !important;
        font-size: 8px !important;
        float: right !important;
        position: absolute !important;
        right: 0px !important;
        margin: 10px !important;
    }
</style>
<script>
    var divStr = '<div id="divdialogalert" name="divdialogalert"></div>';
    document.write(divStr);
</script>

<!--<link href="design/leaflet/dist/leaflet.css" rel="stylesheet" type="text/css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
<script src="design/leaflet/dist/leaflet.js" type="text/javascript" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    