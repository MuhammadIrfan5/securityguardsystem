<script>
    function loadDraftInModal(data){
        $('#employee_id').empty();
        let location=$('#location_id').val();
            console.log(location)
            var employee = $('#employee_id');
            employee.empty();
            $.ajax({
                url: "{{url('get-employee')}}",
                type: 'GET',
                data: {
                    id: location,
                },
                success: function (result) {
                    $.each(result, function (index, value) {
                        var option = $('<option></option>').val(value.id).html(value.name);

                        // Check if the current employee's ID matches obj.employee_id
                        if (value.id == obj.employee_id) {
                            option.attr('selected', 'selected');
                        }

                        employee.append(option);
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


</script>