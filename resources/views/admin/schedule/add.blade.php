@extends('admin.layout.main')
@section('page-css')
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

@endsection
@section('content')
    <div class="pagetitle">
        <h1>Add {{$title}}</h1>
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
            <h5 class="card-title">Add {{$title}}</h5>
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
        @endif
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('schedule.store')}}">
                @csrf

                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="parent_id">
                            <option disabled selected>Location</option>
                            @foreach($location as $user)
                                <option value="{{ $user->id }}">{{$user->name}}</option>
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
                                <option value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes"></textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="col-md-12">
                </div>
                <fieldset class="row mb-3">
                    <div class="col-md-1">

                        @foreach(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] as $key=> $day)
                            @if($key==0)
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="days[]"
                                           id="gridRadios{{ $day }}"
                                           value="{{ $day }}" checked="">
                                    <label class="form-check-label" for="gridRadios{{ $day }}">
                                        {{ $day }}
                                    </label>
                                </div>
                                <div class="form-check">
                                </div>
                                <br>
                            @else
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="days[]"
                                           id="gridRadios{{ $day }}"
                                           value="{{ $day }}">
                                    <label class="form-check-label" for="gridRadios{{ $day }}">
                                        {{ $day }}
                                    </label>
                                </div>
                                <div class="form-check">
                                </div>
                                <br>
                            @endif

                        @endforeach
                    </div>
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-2">
                        @foreach(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] as $key=> $day)
                            <div class="form-check">
                                <label class="form-check-label" for="gridRadios1">
                                </label>
                                <input type="text" class="dateTImes" name="datetimes[]" id="date_{{$key}}" />
                            </div>
                            <div class="form-check">
                            </div>
                        @endforeach
                    </div>
                </fieldset>
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
        $(function() {
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