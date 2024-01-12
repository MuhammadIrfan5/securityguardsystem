@extends('admin.layout.main')

@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            @if(\App\Models\UserPrivilege::get_single_privilige(auth()->id(),'/time-sheet/create') == true)
                <a href="{{route('time-sheet.create')}}" class="btn btn-primary">Create</a>
            @endif
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
                        <table id="dataTable" class="table cell-border display compact">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Location</th>
                                <th>Employee</th>
                                <th>Attendance</th>
                                <th>Notes</th>
                                {{--                                <th>Status</th>--}}
                                <th>Actions</th>
                            </tr>
                            </thead>
                        </table>
                        <!-- End Table with stripped rows -->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('page-js')
    @include('admin.timesheet.pageJs')
@endsection
