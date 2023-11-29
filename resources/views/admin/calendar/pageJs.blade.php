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
    $(document).ready(function () {


        var SITEURL = "{{ url('/') }}";

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var startDate = "";
        var endDate = "";
        var calendar = $('#calendar').fullCalendar({
            events: "{{route('getEvents')}}",
            displayEventTime: false,
            editable: true,
            eventRender: function (event, element, view) {
                if (event.allDay === 'true') {
                    event.allDay = true;
                } else {
                    event.allDay = false;
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
                        displayMessage("Event Updated Successfully");
                    }
                });
            },
            eventClick: function (event) {
                var deleteMsg = confirm("Do you really want to delete?");
                if (deleteMsg) {
                    $.ajax({
                        type: "POST",
                        url: "{{route('CRUD.Event')}}",
                        data: {
                            id: event.id,
                            type: 'delete'
                        },
                        success: function (response) {
                            calendar.fullCalendar('removeEvents', event.id);
                            displayMessage("Event Deleted Successfully");
                        }
                    });
                }
            }

        });
        $('#saveEvent').on('click', function (event) {
            var starts = startDate;
            var ends = endDate;
            console.log(ends, starts)
            var location = $('#location_id').val();
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

                        // Render the event on the calendar
                        calendar.fullCalendar('renderEvent', {
                            id: data.id,
                            title: title,
                            start: start,
                            end: end,
                            allDay: allDay
                        }, true);

                        // Close the modal and unselect the date range
                        calendar.fullCalendar('unselect');
                    }
                });
            }
        });

        // Save button click event
    });

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

    function displayMessage(message) {
        toastr.success(message, 'Event');
    }

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>