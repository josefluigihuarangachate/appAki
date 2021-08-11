<?php
require '../../../../servicios/include/session.php';
require '../../../../servicios/include/function.php';
?>
<html>
    <head>
        <title>Leaflet Realtime</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />

        <style>
            #mapid {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
            }
            .classR{
                background-color: red;
                color: white;
                padding: 3px;
                padding-left: 10px;
                padding-right: 10px;
                border-radius: 50px;
                width: 300px;
                font-size: 10px;
            }
            .classE{
                background-color: skyblue;
                color: white;
                padding: 3px;
                padding-left: 10px;
                padding-right: 10px;
                border-radius: 50px;
                width: 300px;
                font-size: 10px;
            }
        </style>
    </head>
    <body>
        <div id="mapid"></div>
        
        <script src="../../js/config.js"></script>
        <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet-src.js"></script>
        <script src="../dist/leaflet-realtime.js"></script>
        <script src="../../js/jquery-3.5.0.js" type="text/javascript"></script>
        <script>
            var idrepartidor = "<?php echo @$_SESSION[atributo('id')]; ?>";
        </script>
        <script src="index.js?v=<?php echo @date("Ymdhis");?>"></script>
    </body>
</html>