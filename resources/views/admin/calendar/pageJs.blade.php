<meta name="csrf-token" content="{{ csrf_token() }}">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    var myDropDown = $("#locationDropdown");
    var length = $('#locationDropdown> option').length;
    //open dropdown
    myDropDown.attr('size', length);

    function loadCalendarEvents(element) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $('#calendar').fullCalendar('destroy');

        var locationId = $('#locationDropdown').val();
        var startDate = "";
        var endDate = "";

        var calendar = $('#calendar').fullCalendar({
            editable: true,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: {
                url: "{{route('getEvents')}}", // Replace with your actual route
                type: 'GET',
                data: {
                    locationId: locationId
                },
                error: function () {
                    alert('There was an error while fetching events!');
                }
            },
            displayEventTime: true,
            eventRender: function (event, element, view) {
                if (event.allDay === 'true') {
                    event.allDay = true;
                } else {
                    event.allDay = false;
                }
                if (event.title === '') {
                    var alertIcon = $('<span>&#x26A0;</span>'); // Create a new span element
                    element.find('.fc-title').append(alertIcon); // Append the span to the existing title element
                    console.log(element.html());
                }
            },
            selectable: true,
            selectHelper: true,
            select: function (start, end, allDay) {
                // Open a modal or show a form to collect information
                openModel();
                startDate = $.fullCalendar.formatDate(start, "Y-MM-DD");
                endDate = $.fullCalendar.formatDate(end, "Y-MM-DD");
            },

            eventDrop: function (event, delta) {
                var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD");
                var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD");

                $.ajax({
                    url: "{{route('CRUD.Event')}}",
                    data: {
                        title: event.title,
                        start: start,
                        end: end,
                        id: event.id,
                        type: 'update'
                    },
                    type: "POST",
                    success: function (response) {
                        if (response['success'] == false) {
                            alert('Schedule Already exist!');
                            calendar.fullCalendar('refetchEvents');
                        } else {
                            displayMessage("Event Updated Successfully");
                            $('#calendar').fullCalendar('refetchEvents');
                        }

                    }
                });
            },
            eventClick: function (event) {
                openEditModal(event);
            }

        });


        function openEditModal(event) {
            // Code to open a modal or form and pre-fill it with event details

            // Assuming you have a modal with id 'editEventModal'
            $('#editEventModal').modal('show');

            // Populate the form fields with the event details
            $('#editEventTitle').val(event.title);
            $('#editEventStart').val($.fullCalendar.formatDate(event.start, "Y-MM-DD"));
            $('#editEventEnd').val($.fullCalendar.formatDate(event.end, "Y-MM-DD"));
            // You can add more fields as needed
            $(function () {
                var employee = $('#edit_employee_id');
                employee.empty();
                $.ajax({
                    url: "{{url('get-edit')}}",
                    type: 'GET',
                    data: {
                        id: event.id,
                    },
                    success: function (result) {
                        var obj = result['record'];
                        $('#edit_startTime').val(obj.start_time);
                        $('#edit_endTime').val(obj.end_time);
                        var employeeList = result['employee'];
                        $.each(employeeList, function (index, value) {
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
            });

            $('#saveEditedEvent').on('click', function () {
                // Perform AJAX request to update the event
                var updatedEmployeeId = $('#edit_employee_id').val();
                var updatedStart = $('#edit_startTime').val();
                var updatedEnd = $('#edit_endTime').val();

                $.ajax({
                    url: "{{ route('CRUD.Event') }}",
                    data: {
                        id: event.id,
                        employee_id: updatedEmployeeId,
                        start: updatedStart,
                        end: updatedEnd,
                        type: 'updateSingle'
                    },
                    type: "POST",
                    success: function (response) {
                        $('#editEventModal').modal('hide');
                        displayMessage("Schedule Updated Successfully");
                        // Refresh the calendar after success
                        calendar.fullCalendar('refetchEvents');
                    },
                    error: function (error) {
                        // Handle error, if needed
                        console.error("Error updating event:", error);
                    }
                });
            });

            // Optionally, you can handle cancel button click to close the modal without updating
            $('#cancelEditEvent').on('click', function () {
                // Close the edit modal without updating
                $('#editEventModal').modal('hide');
            });
        }

        calendar.fullCalendar('refetchEvents');

        $('#saveEvent').on('click', function (event) {
            var starts = startDate;
            var ends = endDate;
            console.log(ends, starts)
            var location = locationId;
            var employee = $('#employee_id').val();
            var startTime = $('#startTime').val();
            var endTime = $('#endTime').val();
            if (location) {
                // Perform AJAX request to save event
                $.ajax({
                    url: "{{route('CRUD.Event')}}",
                    data: {
                        location: location,
                        employee: employee,
                        startTime: startTime,
                        endTime: endTime,
                        start: starts,
                        end: ends,
                        type: 'add'
                    },
                    type: "POST",
                    success: function (data) {
                        $('#eventModal').modal('hide');

                        displayMessage("Event Created Successfully");
                        calendar.fullCalendar('refetchEvents');

                    }
                });
            }
        });
    }

    // Save button click event
    // });

    function openModel(e) {
        $('#eventModal').modal('show');
        $(function () {
            var location = $('#location_id');
            var employee = $('#employee_id');
            var day = $('#daylist');
            location.empty();
            $.ajax({
                url: "{{url('get-locations')}}",
                type: 'GET',
                success: function (result) {
                    var locationList = result['location'];
                    var employeeList = result['employee'];
                    var daylist = result['days'];
                    $.each(locationList, function (index, value) {
                        location.append(
                            $('<option></option>').val(value.id).html(value.name)
                        );
                    });
                    $.each(employeeList, function (index, value) {
                        employee.append(
                            $('<option></option>').val(value.id).html(value.name)
                        );
                    });
                    $.each(daylist, function (index, value) {
                        day.append(
                            $('<option></option>').val(value).html(value)
                        );
                    });
                },
                error: function (error) {
                    console.log(error.status)
                }
            });
        });

    }

    $('#cancelEvent').on('click', function () {
        $('#eventModal').modal('hide');
    });
    $('#EditcancelEvent').on('click', function () {
        $('#editEventModal').modal('hide');
    });

    function displayMessage(message) {
        toastr.success(message, 'Event');
    }

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>