@extends('admin.layout.main')
@section('page-css')
<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked + .slider {
        background-color: #2196F3;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>
@endsection
@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            @if(\App\Models\UserPrivilege::get_single_privilige(auth()->id(),'/confirmation-call/create') == true)
                <a href="{{route('confirmation-call.create')}}" class="btn btn-primary">Create</a>
            @endif
        </div>
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
                        <h5 class="card-title">{{$title}}</h5>
                        <form action="#" post="get" id="filterForm">
                            <table width="100%">
                                <tbody>
                                <tr >
                                    <td width="21%" style="font-size:14px;  text-indent: 5px;">Please Select Date:</td>
                                    <td width="16%" colspan="2">
                                        <input type="text" id="daterange" name="daterange" value="" />
                                    </td>
                                </tr>
{{--                                <tr >--}}
{{--                                    <td width="21%" style="font-size:14px;  text-indent: 5px;">Please Select Time:</td>--}}
{{--                                    <td width="16%" colspan="2">--}}
{{--                                        <input type="time" id="start_time" name="start_time"--}}
{{--                                               class="form-control-sm"--}}
{{--                                               value="">--}}
{{--                                        <input type="time" id="end_time" name="end_time"--}}
{{--                                               class="form-control-sm"--}}
{{--                                               value="">--}}
{{--                                    </td>--}}
{{--                                </tr>--}}
                                <tr>
                                    <td width="21%"></td>
                                    <td width="16%" colspan="5">
                                        <input id="filter" type="submit" class="btn btn-primary " value="Filter">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
                                <th>Customer</th>
                                <th>Guard ID</th>
                                <th>Guard Name</th>
                                <th>Timings</th>
                                <th>Phone</th>
                                <th>Gate Combo</th>
                                <th>Post-Phone</th>
                                <th>Call Time</th>
                                <th>Status</th>
                                <th>Notes</th>
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
    @include('admin.confirmationCall.pageJs')
@endsection
