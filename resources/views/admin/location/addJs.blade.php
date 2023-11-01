<script>

    $("#cc_box").hide();
    $("#licenseNumber").hide();
    $("#monitoringCheck").hide();

    function checkOnsite(obj) {
        $('#licenseNumber').prop('checked', true); // Checks it

        if (obj.checked) {
            $("#licenseNumber").show();
            $('#license_number').attr('required', true);
        } else {
            $("#licenseNumber").hide();
            $('#license_number').attr('required', false);
        }
    }

    function showbox(obj) {
        $('#myCheckbox').prop('checked', true); // Checks it
        if (obj.checked) {
            $("#cc_box").show();
            $('#client_name').attr('required', true);
            $('#client_designation').attr('required', true);
            $('#client_email').attr('required', true);
            $('#client_phone').attr('required', true);
        } else {
            $("#cc_box").hide();
            $('#client_name').attr('required', false);
            $('#client_designation').attr('required', false);
            $('#client_email').attr('required', false);
            $('#client_phone').attr('required', false);
        }
    }

    function isMonitoring(obj) {
        if (obj.value == 'Monitoring') {
            $('#number_of_camera').attr('required', true);
            $('#camera_tower_number').attr('required', true);
            $('#nvr').attr('required', true);
            $("#monitoringCheck").show();
        } else {
            $('#monitoringCheck').hide();
            $('#number_of_camera').attr('required', false);
            $('#camera_tower_number').attr('required', false);
            $('#nvr').attr('required', false);
        }
    }


</script>