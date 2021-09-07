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
<link rel="icon" type="image/png" href="design/aki/logo.png"/>
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

    /*
    https://thecodebeast.com/post/how-to-change-select2-box-height/144
    */    
    .select2-selection__rendered {
        background-color: transparent !important;
        line-height: 45px !important;
        width: 100% !important;
        /*        border: 1px solid transparent !important;
                border-bottom: 1px solid #ccc !important;*/
    }
    .select2-container .select2-selection--single {
        background-color: transparent !important;
        height: 45px !important;
        /*        border: 1px solid transparent !important;*/
    }
    .select2-selection__arrow {
        background-color: transparent !important;
        height: 45px !important;

        /*        border: 1px solid transparent !important;*/
    }

    body{
        font-size: 16px !important;
    }
    h5{
        font-size: 18px;
    }
</style>
<script async>
    var divStr = '<div id="divdialogalert" name="divdialogalert"></div>';
    document.write(divStr);

    var inputStr = '<input type="hidden" hidden="hidden" value="<?php echo @$_SESSION['id']; ?>" id="idrepartidor" name="idrepartidor">';
    document.write(inputStr);

    var inputMac = '<input type="hidden" hidden="hidden" value="<?php echo @$_SESSION['macimpresora']; ?>" id="macimpresora" name="macimpresora">';
    document.write(inputMac);
</script>

<!--<script async src="//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.4.456/pdf.min.js"></script>
<script type="text/javascript">
  pdfjsLib.GlobalWorkerOptions.workerSrc = "//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.4.456/pdf.worker.min.js";
</script>-->

<script async src="https://cdnjs.cloudflare.com/ajax/libs/node-uuid/1.4.7/uuid.min.js"></script>


<!--PONER ULTIMOS-->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

<script src="design/js/moment.js" type="text/javascript"></script>
<script async src="design/js/moment-with-locales.js" type="text/javascript"></script>
<script>
    moment.locale();
</script>
