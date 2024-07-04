<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
    $.ajaxSetup({headers: {'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')}});

    let table = new DataTable('#dataTable', {
        responsive: true,
        searchable: false,
        paging: true,
        autoWidth: true,
        processing: true,
        serverSide: true,
        ajax: {
            "url": "{{route('time.sheet.tableData')}}",
            "data": function (d) {
                var unindexed_array = $("#filterForm").serializeArray();
                $.map(unindexed_array, function (n, i) {
                    d[n['name']] = n['value'];
// console.log(n['value']);
                });
            }
        },

    });
    $("#filterForm").on("submit", function (e) {
        e.preventDefault();
        table.ajax.reload()
    })

    function loadDraftInModal(data) {
        $('#schedule_id').val(data.value);
        var employeeId=$(data).data('id');
        $('#employee_id').empty();
        let location = $('#location_id').val();
        var employee = $('#employee_id');
        employee.empty();
        $.ajax({
            url: "{{url('get-employee-By-locationId')}}",
            type: 'GET',
            data: {
                location_id: location,
            },
            success: function (result) {
                $.each(result, function (index, value) {

                    if(value.id==employeeId){
                        employee.append('<option value ="' + value.id + '" selected>' + value.name + '</option>');
                    }
                    else {
                        employee.append('<option value ="' + value.id + '">' + value.name + '</option>');
                    }
                });
            },
            error: function (error) {
                console.log(error.status)
            }
        });

    }
    function loadDraftInModal1(data) {

        $('.schedule_id').val(data.value);
        var employeeId=$(data).data('id');
        $('#employee_id').empty();
        let location = $('#location_id').val();
        var employee = $('#employee_id1');
        employee.empty();
        $.ajax({
            url: "{{url('get-employee-By-locationId')}}",
            type: 'GET',
            data: {
                location_id: location,
            },
            success: function (result) {
                $.each(result, function (index, value) {

                    if(value.id==employeeId){
                        employee.append('<option value ="' + value.id + '" selected>' + value.name + '</option>');
                    }
                    else {
                        employee.append('<option value ="' + value.id + '">' + value.name + '</option>');
                    }
                });
            },
            error: function (error) {
                console.log(error.status)
            }
        });

    }
    $('#addUpdates1').submit(function (e) {
        e.preventDefault();

        $('#basicModal1').modal('hide');

        var formData = $(this).serialize();
        var form = $(this);
        $.ajax({
            type: 'POST',
            url: '{{ route("time-sheet.store") }}',
            data: formData,
            success: function (response) {
                // Handle success response
                table.ajax.reload();
                form.trigger("reset");
            },
            error: function (xhr, status, error) {
                // Handle error response
                console.error(xhr.responseText);
            }
        });
    });
    $('#addUpdates').submit(function (e) {
        e.preventDefault();

        $('#basicModal1').modal('hide');

        var formData = $(this).serialize();
        var form = $(this);
        $.ajax({
            type: 'POST',
            url: '{{ route("time-sheet.store") }}',
            data: formData,
            success: function (response) {
                // Handle success response
                table.ajax.reload();
                form.trigger("reset");

            },
            error: function (xhr, status, error) {
                // Handle error response
                console.error(xhr.responseText);
            }
        });
    });
    $('#addUpdates1').submit(function (e) {
        e.preventDefault();

        $('#basicModal2').modal('hide');

        var formData = $(this).serialize();
        var form = $(this);
        $.ajax({
            type: 'POST',
            url: '{{ route("time-sheet.store") }}',
            data: formData,
            success: function (response) {
                // Handle success response
                table.ajax.reload();
                form.trigger("reset");

            },
            error: function (xhr, status, error) {
                // Handle error response
                console.error(xhr.responseText);
            }
        });
    });
    $('.modal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    })

</script>
<script>
    $(function() {
        $('input[name="daterange"]').daterangepicker();
    });
</script>