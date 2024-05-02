@extends('admin.layout.main')

@section('content')
    <div class="pagetitle">
        <h1>{{$title}}</h1>
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
            <h5 class="card-title">Employee list</h5>
            <!-- Table with stripped rows -->
            <table id="dataTable" class="table cell-border display compact">
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
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <div id="dataTableUpdates_wrapper" class="dataTables_wrapper no-footer">
                        <div id="dataTableUpdates_processing" class="dataTables_processing" role="status"
                             style="display: none;">
                            <div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                        <table id="dataTableUpdates" class="table cell-border display compact dataTable no-footer"
                               width="100%" style="width: 100%;">
                            <thead>
                            <tr>
                                <th scope="col" class="sorting_disabled" rowspan="1" colspan="1" style="width: 239px;">
                                    From
                                </th>
                                <th scope="col" class="sorting_disabled" rowspan="1" colspan="1" style="width: 299px;">
                                    Update
                                </th>
                                <th scope="col" class="sorting_disabled" rowspan="1" colspan="1" style="width: 396px;">
                                    Created At
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd">
                                <td valign="top" colspan="3" class="dataTables_empty">No matching records found</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- End Transaction Datatable-->
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"></h5>

                    <!-- General Form Elements -->
                    <form id="addUpdates">
                        <input type="hidden" id="location_id" name="location_id" value="{{$location->id}}">
                        <div class="row mb-3">
                            <label for="inputPassword" class="col-sm-3 col-form-label">Message</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="height: 100px" name="message"></textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form><!-- End General Form Elements -->

                </div>
            </div>                                        <!-- End Transaction Datatable-->
        </div>
    </div>
    <div class="modal fade" id="basicModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Donations</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="addUpdates" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" name="contest_id" id="contest_id" value=""/>
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
                                    <td width="200" align="center" height="50"> Donation Date</td>
                                    <td width="10">:</td>
                                    <td width="170" align="left">
                                        <input type="date" class="form-control-sm" name="donation_date"  id="donation_date" maxlength="10"  value="<?php if(!empty($qEdit)):echo substr($qEdit['created_at'],0,strlen($q['created_at'])-9);endif;?>"/>
                                        <br/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="submitAddonation()">Save changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div><!-- End Basic Modal-->

@endsection
@section('page-js')
@include('admin.timesheet.editDetailJS')
@endsection