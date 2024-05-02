<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    function loadDraftInModal(data){
        $('#employee_id').empty();
        let location=$('#location_id').val();
            console.log(location)
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
                        console.log(value);
                        employee.append('<option value ="'+value.id+'">'+value.name+'</option>');
                    });
                },
                error: function (error) {
                    console.log(error.status)
                }
            });

    }

    $('#addUpdates').submit(function(e) {
        e.preventDefault();

        var formData = $(this).serialize();
        var form = $(this);
        $.ajax({
            type: 'POST',
            url: '{{ route("confirmation-call.create") }}',
            data: formData,
            success: function(response) {
                // Handle success response
                updates.ajax.reload();
                form.trigger("reset");
            },
            error: function(xhr, status, error) {
                // Handle error response
                console.error(xhr.responseText);
            }
        });
    });
    let locationId=$('#location_id').val();
    console.log(locationId);
    let table = new DataTable('#dataTable', {
        responsive: true,
        searchable: false,
        paging: true,
        autoWidth: true,
        processing: true,
        serverSide: true,
        ajax: {
            "url": "{{ route('updated.time.sheet.tableData') }}",
            "data": function (d) {
                // Add location_id to the data being sent
                d.location_id = $('#location_id').val();

                // Serialize other form data and add it to the request
                var unindexed_array = $("#filterForm").serializeArray();
                $.map(unindexed_array, function (n, i) {
                    d[n['name']] = n['value'];
                });
            }
        }
    });


</script>