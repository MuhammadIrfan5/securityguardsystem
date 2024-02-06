<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    // $(document).ready(function() {
    //     $('.form-select').select2();
    // });
    $("#cc_box").hide();
    $("#licenseNumber").hide();
    $("#monitoringCheck").hide();
    $('#client-details-container .delete-client').hide();

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

    $('#add-client').on('click', function () {
        var clonedClientDetails = $('#client-details-container .client-details').first().clone();
        clonedClientDetails.find('.delete-client').show(); // Show delete button for cloned container
        clonedClientDetails.find('input[type="text"], input[type="email"]').val(''); // Clear input fields

        $('#client-details-container').append(clonedClientDetails);
    });

    $('#client-details-container').on('click', '.delete-client', function () {
        var clientDetails = $(this).closest('.client-details');
        if ($('#client-details-container .client-details').length > 1) {
            clientDetails.remove();
        } else {
            alert("At least one set of client details should be present.");
        }
    });

</script>
