@extends('admin.layout.main')

@section('content')
    <div class="pagetitle">
        <h1>Schedule Sheet</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item">Tables</li>
                <li class="breadcrumb-item active">Data</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <div class="card">
        <div class="card-body">
            <div class="tab-pane fade show active profile-overview" id="profile-overview" role="tabpanel">
                <h5 class="card-title">Company Details</h5>
                <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Company:</div>
                    <div class="col-lg-9 col-md-8">{{$location->name}}</div>
                </div>

                <div class="row">
                    <div class="col-lg-3 col-md-4 label">Address:</div>
                    <div class="col-lg-9 col-md-8">{{$location->address}}</div>
                </div>
                <br>
                @if(count($location->clientDetail)>0)
                    @foreach($location->clientDetail as $key=> $item)
                        <div class="row">
                            <div class="col-lg-3 col-md-4 label">Client Name: ({{$key+1}})</div>
                            <div class="col-lg-9 col-md-8">{{$item->client_name}}</div>

                            <div class="col-lg-3 col-md-4 label">Client Phone: ({{$key+1}})</div>
                            <div class="col-lg-9 col-md-8">{{$item->client_phone}}</div>
                        </div>
                        <br>
                    @endforeach
                @endif
            </div>
        </div>
    </div>

    <input type="hidden" name="location_id" id="location_id" value="{{$location->id}}">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Employee list</h5>
            <!-- Table with stripped rows -->
            <table id="dataTable1" class="table cell-border compact">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Phone</th>
                    <th>Attendance</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <?php $total_minutes = 0; // Initialize total minutes ?>

                @foreach($data as $item)
                    @if(!empty($item->employee))
                            <?php
                            $start_datetime = DateTime::createFromFormat('H:i', $item->start_time);
                            $end_datetime = DateTime::createFromFormat('H:i', $item->end_time);
                            if ($end_datetime < $start_datetime) {
                                $end_datetime->add(new DateInterval('P1D')); // Add one day to the end time
                            }
                            $difference = $start_datetime->diff($end_datetime);

                            // Add the difference in minutes to the total
                            $total_minutes += $difference->format('%i') + ($difference->format('%h') * 60);
                            ?>
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->employee->name}}</td>
                            <td>
                                <li>Phone-one: {{$item->employee->phone_one}}</li>
                                <li>Phone-two: {{$item->employee->phone_two}}</li>
                            </td>
                            <td>
                                <ul>
                                    <li>Check-In:{{$item->start_time}}</li>
                                    <li>Check-Out:{{$item->end_time}}</li>
                                </ul>
                            </td>
                            <td>
                                <button
                                        onclick="loadDraftInModal(this)"
                                        value="{{$item->id}}"
                                        data-id="{{$item->employee_id}}"
                                        type="button" class="btn btn-success btn-sm"
                                        data-bs-toggle="modal" data-bs-target="#basicModal">
                                    <i class="bi bi-plus"></i>
                                </button>
                            </td>

                        </tr>
                    @endif
                @endforeach
                </tbody>
                <tfoot>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="1"><b>Total Time: {{ floor($total_minutes / 60) }} hours {{ $total_minutes % 60 }}
                            minutes</b></td>
                </tr>
                </tfoot>
            </table>
            <!-- End Table with stripped rows -->
        </div>
    </div>
    <div class="pagetitle">
        <h1>Time Sheet</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div id="dataTableUpdates_wrapper" class="dataTables_wrapper no-footer">
                        <table id="dataTable" class="table cell-border display compact">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Schedule Employee</th>
                                <th>Present Employee</th>
                                <th>Check IN</th>
                                <th>Check OUT</th>
                                <th>Notes</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <th colspan="1" id="totalHoursFooter">Total Hours:</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- End Transaction Datatable-->
                </div>
            </div>
        </div>
    </div>
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
    @include('admin.timesheet.editDetailJS')
@endsection