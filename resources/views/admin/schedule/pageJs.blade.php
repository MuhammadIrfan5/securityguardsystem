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
                }
            },
            selectable: true,
            selectHelper: true,
            select: function (start, end, allDay) {
                startDate = $.fullCalendar.formatDate(start, "Y-MM-DD");
                endDate = $.fullCalendar.formatDate(end, "Y-MM-DD");
            },
        });

        calendar.fullCalendar('refetchEvents');
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
    @if(!empty($selectedlocation))
    $(document).ready(function () {
        loadCalendarEvents({{$selectedlocation->id}});
    });
    @endif
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>