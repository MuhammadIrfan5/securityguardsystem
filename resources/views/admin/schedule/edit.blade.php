@extends('admin.layout.main')
@section('page-css')
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

@endsection
@section('content')
    <div class="pagetitle">
        <h1>Edit {{$title}}</h1>
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
            <h5 class="card-title">Edit {{$title}}</h5>
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
        @endif
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('schedule.update',$record->id)}}">
                @csrf
                @method('PUT')
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="parent_id">
                            <option disabled selected>Location</option>
                            @foreach($location as $user)
                                <option value="{{ $user->id }}"
                                        {{($user->id==$record->location_id)   ? 'selected' : ''}}
                                >{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="employee_id" class="form-select"
                                id="employee_id">
                            <option disabled selected>Employee list</option>
                            @foreach($employee as $user)
                                <option value="{{ $user->id }}"
                                        {{($user->id==$record->employee_id)   ? 'selected' : ''}}

                                >{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control dateTImes" name="dateRange" id="date"/>
                        <label for="gridRadios1">Date Range</label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes">{{$record->notes}}</textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">{{$title}} list</h5>
                            <!-- Table with stripped rows -->
                            <table id="dataTable" class="table cell-border display compact">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Days</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] as $key=> $day)
                                    <?php
                                    $data = new \stdClass();
                                    if (!empty($record->scheduleDays[$key])) {
                                        $data = $record->scheduleDays[$key];
                                    } else {
                                        $data->day = '';
                                        $data->start_time = '';
                                        $data->end_time = '';
                                    }

                                    ?>
                                    <tr>
                                        <td><input type="checkbox" class="form-check-input day-checkbox"
                                                   name="days[]"
                                                   {{$data->day ==$day?'checked':''}}
                                                   value="{{$day}}"></td>
                                        <td>{{$day}}</td>
                                        <td><input type="time" class="form-control time-input" name="start_time[]"
                                                   value="{{$data->start_time}}"></td>
                                        <td><input type="time" class="form-control time-input" name="end_time[]"
                                                   value="{{$data->end_time}}"></td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->
                        </div>
                    </div>

                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form><!-- End floating Labels Form -->

        </div>
    </div>

@endsection
@section('page-js')
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script>
        $(function () {
            $(".dateTImes").daterangepicker({
                timePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().add(1, 'weeks'),
                locale: {
                    format: 'MM-DD-YYYY h:mm A'
                }
            });
        });
    </script>
@endsection