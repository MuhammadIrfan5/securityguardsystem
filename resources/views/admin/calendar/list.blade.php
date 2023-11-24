@extends('admin.layout.main')
@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            <a href="{{route('time-sheet.create')}}" class="btn btn-primary">Create</a>
        </div>
        <form action="#" method="get" id="filterForm">
            <div class="row">
                <div class="col-5">
                    <input type="time" name="startTime" class="form-control">
                </div>
                <div class="col-5">
                    <input type="time" name="endTime" class="form-control">
                </div>
                <div class="col-2">
                    <input id="filter" type="submit" class="btn btn-outline-primary " value="Filter">
                </div>
            </div>
        </form>

        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">{{$title}}</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->
    <!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                @if (session('msg'))
                    <div class="alert alert-success">
                        {{ session('msg') }}
                    </div>
                @endif
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">{{$title}} list</h5>
                        <!-- Table with stripped rows -->
                        <div class="container">

                            <div class="page-header text-center">
                                <h1>Example of Calendar</h1>
                            </div>

                            <hr>

                            <form>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="fromDate">Event Name:</label>
                                            <input type="text" class="form-control" placeholder="Enter event" id="eventName">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fromDate">From:</label>
                                            <input type="date" class="form-control" placeholder="Enter from date" id="fromDate">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="toDate">To:</label>
                                            <input type="date" class="form-control" id="toDate">
                                        </div>
                                    </div>

                                </div>

                                <button type="button" class="btn btn-primary" id="addEvent">Add Event</button>

                            </form>

                            <hr>

                            <div class="row">
                                <div class="col-md-12">
                                    <div id="calendar"></div>
                                </div>
                            </div>

                        </div>                        <!-- End Table with stripped rows -->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('page-js')
    @include('admin.calendar.pageJs')
@endsection
