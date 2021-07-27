<?php
include "./include/sessionstart/session.php";
?>
<!DOCTYPE html>
<html>
    <head>
        <?php
        include "./include/header/header_login.php";
        ?>
    </head>
    <body class="<?php echo @$_SESSION['themedark']; ?>">

        <!-- App Header -->
        <div class="appHeader">
            <div class="left">
                <a href="#" class="headerButton goBack" onclick="goBack();">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </a>
            </div>
            <div class="pageTitle">ZONAS</div>
            <div class="right">
                <a href="" class="headerButton goBack">
                    <ion-icon name="reload-outline"></ion-icon>
                </a>
            </div>
        </div>
        <!-- * App Header -->

        <!-- App Capsule -->

        <div id="appCapsule" name="appCapsule">
        </div>
        <br>
        <!-- * App Capsule -->   

        <?php
        include "./include/bottom_menu.php";
        ?>
        <!-- ========= JS Files =========  -->
        <?php
        include "./include/footer/footer_login.php";
        ?>
        <script src="design/js/crud/zonaXrepartidor.js<?php echo @$v; ?>" type="text/javascript"></script>
    </body>
</html>
