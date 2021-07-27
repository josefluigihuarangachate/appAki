<?php
$v = '?v=' . date('Ymdhis');
?>
<!-- Bootstrap -->
<script src="design/assets/js/lib/bootstrap.bundle.min.js"></script>
<!-- Splide -->
<script src="design/assets/js/plugins/splide/splide.min.js"></script>
<!-- Ionicons -->
<!--https://ionic.io/ionicons-->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

<script src="design/js/crud/dialogalert.js<?php echo $v; ?>" type="text/javascript"></script>
<script src="design/js/crud/logout.js<?php echo $v; ?>" type="text/javascript"></script>
<script src="design/js/crud/themeDark.js<?php echo $v; ?>" type="text/javascript"></script>

<script src="design/js/moment.js" type="text/javascript"></script>
<script>
    moment().format();
</script>
<script
    src="https://maps.googleapis.com/maps/api/js?key=<?php echo @$_SESSION['apigooglemap']; ?>&callback=initMap&libraries=&v=weekly&channel=2"
    async
></script>