<?php
$v = '?v=' . date('Ymdhis');
?>
<!-- Bootstrap -->
<script src="design/assets/js/lib/bootstrap.bundle.min.js"></script>
<!-- Splide -->
<script src="design/assets/js/plugins/splide/splide.min.js"></script>
<!-- Ionicons -->
<!--https://ionic.io/ionicons-->
<!--<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>-->
<script type="module" src="https://unpkg.com/ionicons@5.0.0/dist/ionicons/ionicons.esm.js"></script>

<script src="design/js/crud/dialogalert.js<?php echo $v; ?>" type="text/javascript"></script>
<script src="design/js/crud/logout.js<?php echo $v; ?>" type="text/javascript"></script>
<script src="design/js/crud/themeDark.js<?php echo $v; ?>" type="text/javascript"></script>

<script src="design/js/moment.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    // In your Javascript (external .js resource or <script> tag)
    $(document).ready(function () {
        $('.search-live').select2({
            allowClear: true,
            placeholder: "ELEGIR UNA OPCIÓN"
        });
        $(".add-new-tags").select2({
            allowClear: true,
            tags: true,
            minimumResultsForSearch: -1
        });
    });
</script>


<!--<script src="design/leaflet/dist/leaflet-src.js" type="text/javascript"></script>
<script src="design/leafletRealtime/dist/leaflet-realtime.js<?php //echo @$v;         ?>" type="text/javascript"></script>
<script src="design/leafletRealtime/dist/leaflet-realtime.min.js" type="text/javascript"></script>
<script src="design/leafletRealtime/examples/index.js<?php //echo @$v;         ?>" type="text/javascript"></script>-->