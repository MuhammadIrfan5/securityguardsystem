@extends('admin.layout.main')

@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            @if(\App\Models\UserPrivilege::get_single_privilige(auth()->id(),'/time-sheet/create') == true)
{{--                <a href="{{route('time-sheet.create')}}" class="btn btn-primary">Create</a>--}}
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
                                        <input type="time" id="start_time" name="start_time"
                                               class="form-control-sm"
                                               value="">
                                        <input type="time" id="end_time" name="end_time"
                                               class="form-control-sm"
                                               value="">

                                    </td>

                                </tr>
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
                                <th>Location</th>
                                <th>Attendance</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                        </table>
                        <!-- End Table with stripped rows -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="basicModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Time Sheet</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addUpdates" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <input type="hidden" name="id" id="schedule_id" value=""/>
                                <table width="520" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="3" align="center" id="error_show" style="color:red;">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="200" align="center" height="50">Employee list</td>
                                        <td width="">:</td>
                                        <td width="170" align="center">
                                            <select name="employee_id" id="employee_id" class="form-control">
                                                <option value=""></option>
                                            </select>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td width="200" align="center" height="50"> Check In</td>
                                        <td width="10">:</td>
                                        <td width="170" align="left">
                                            <input type="time" class="form-control" id="floatingName"
                                                   placeholder="Check-In"
                                                   name="check_in" value="" required>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200" align="center" height="50"> Check Out</td>
                                        <td width="10">:</td>
                                        <td width="170" align="left">
                                            <input type="time" class="form-control" id="floatingName"
                                                   placeholder="Check-Out"
                                                   name="check_out" value="">
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200" align="center" height="50"> Notes</td>
                                        <td width="10">:</td>
                                        <td width="170" align="left">
                                            <textarea class="form-control" style="height: 100px"
                                                      name="notes"></textarea>
                                            <br/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- End Basic Modal-->

@endsection
@section('page-js')
    @include('admin.timesheet.pageJs')
@endsection
