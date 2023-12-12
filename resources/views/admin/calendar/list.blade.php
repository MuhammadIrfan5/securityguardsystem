@extends('admin.layout.main')
@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
{{--        <div class="text-end">--}}
{{--            <a href="{{route('assign-job.create')}}" class="btn btn-primary">Create</a>--}}
{{--        </div>--}}
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">{{$title}}</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                @if (session('msg'))
                    <div class="alert alert-success">
                        {{ session('msg') }}
                    </div>
                @endif
            </div>
            <div class="col-md-3">
        <select id="locationDropdown" class="form-select" onchange="loadCalendarEvents()">
            <option value="#" disabled selected>Select location</option>
            @foreach($locations as $location)
                <option value="{{$location->id}}">{{$location->name}}</option>
            @endforeach
        </select>
        </div>
            <div class="col-md-9">

            <div class="container">
            <div id='calendar'></div>
        </div>
        </div>
        </div>

    </section>
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">Add Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="locationId" class="row g-3">
{{--                        <div class="col-md-6">--}}
{{--                            <label for="eventTitle">Location list:</label>--}}
{{--                            <select name="location_id" class="form-select"--}}
{{--                                    id="location_id">--}}
{{--                                <option disabled selected>Location</option>--}}
{{--                            </select>--}}
{{--                        </div>--}}
                        <div class="col-md-6">
                            <label for="employee_id">Employee list:</label>
                            <select name="employee_id" class="form-select"
                                    id="employee_id">
                                <option disabled selected>Employee list</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="startTime">Start Time:</label>
                                <input type="time" class="form-control" id="startTime" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="endTime">End Time:</label>
                                <input type="time" class="form-control" id="endTime" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveEvent">Save</button>
                    <button type="button" class="btn btn-secondary" id="cancelEvent" data-dismiss="modal">Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editEventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">Edit Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="locationId" class="row g-3">
                        <div class="col-md-6">
                            <label for="employee_id">Employee list:</label>
                            <select name="employee_id" class="form-select"
                                    id="edit_employee_id">
                                <option disabled selected>Employee list</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="startTime">Start Time:</label>
                                <input type="time" class="form-control" id="edit_startTime" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="endTime">End Time:</label>
                                <input type="time" class="form-control" id="edit_endTime" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveEditedEvent">Save</button>
                    <button type="button" class="btn btn-secondary" id="EditcancelEvent" data-dismiss="modal">Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('page-js')
    @include('admin.calendar.pageJs')
@endsection
