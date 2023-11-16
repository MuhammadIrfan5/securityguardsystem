@extends('admin.layout.main')

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
            <form class="row g-3" method="post" action="{{route('location.store')}}">
                @csrf

                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingName" placeholder="Location Name"
                               name="name" required>
                        <label for="floatingName">Location Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingAddress" placeholder="Address"
                               name="address" required>
                        <label for="floatingAddress">Address</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="timezone_id" class="form-select"
                                id="state_id">
                            <option disabled selected>Time Zone list</option>
                            @foreach($timeZone as $user)
                                <option value="{{ $user->id }}">{{$user->timezone}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingcoverage_time" placeholder="Coverage Time"
                               name="coverage_start_time" required>
                        <label for="floatingcoverage_time">Coverage Start Time</label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingcoverage_time" placeholder="Coverage Time"
                               name="coverage_end_time" required>
                        <label for="floatingcoverage_time">Coverage End Time</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="locationType_id" class="form-select"
                                id="state_id" required>
                            <option disabled selected>Location Type list</option>
                            @foreach($locationType as $user)
                                <option value="{{ $user['id'] }}">{{$user['type']}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-12">
                </div>

                {{--client detail--}}
                <div class="col-md-12">
                    <h4 class="form-check-label" for="clientDetails">
                        Add Client Details
                    </h4>

{{--                    <div class="form-check">--}}
{{--                        <input class="form-check-input" value="creditcard" type="checkbox" name="payment_mode"--}}
{{--                               id="clientDetails"--}}
{{--                               onclick="showbox(this)">--}}

{{--                    </div>--}}
                </div>
                <div id="cc_baox" class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" maxlength="16" name="client[client_name]"
                                   id="client_name"
                            >
                            <label for="client_name"> Client Name </label>
                            @error('client_name')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" maxlength="16" name="client[client_designation]"
                                   id="client_designation"
                            >
                            <label for="client_designation"> Client Designation </label>
                            @error('client_designation')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" maxlength="16" name="client[client_email]"
                                   id="client_email"
                            >
                            <label for="client_email"> Client Email </label>
                            @error('client_email')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" maxlength="11" name="client[client_phone]"
                                   id="client_phone"
                            >
                            <label for="client_phone"> Client Phone </label>
                            @error('client_phone')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>

                </div>
                {{--License Number--}}
                <div class="col-md-12">
                    <div class="form-check">
                        <input class="form-check-input" value="licenseNumber" type="checkbox" name="clientLicenseNumber"
                               id="clientLicenseNumber"
                               onclick="checkOnsite(this)">
                        <h4 class="form-check-label" for="clientLicenseNumber">
                            Trailer On Site
                        </h4>
                    </div>
                </div>
                <div id="licenseNumber" class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" maxlength="16" name="license_number"
                                   id="license_number">
                            <label for="license_number"> License Number </label>
                            @error('license_number')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>
                {{--Monitoring--}}
                <div class="col-md-12">

                    <div class="form-check">
                        <input class="form-check-input" value="Monitoring" type="radio" name="payment_mode"
                               id="monitoring"
                               onclick="isMonitoring(this)">
                        <h4 class="form-check-label" for="monitoring">
                            Monitoring
                        </h4>
                    </div>

                    <div class="form-check">

                        <input class="form-check-input" value="NonMonitoring" type="radio" name="payment_mode"
                               id="NonMonitoring"
                               checked="" onclick="isMonitoring(this)">
                        <h4 class="form-check-label" for="NonMonitoring">
                            Non Monitoring
                        </h4>
                    </div>
                </div>

                <div id="monitoringCheck" class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" maxlength="16" name="monitor[number_of_camera]"
                                   id="number_of_camera">
                            <label for="number_of_camera"> Number of Camera </label>
                            @error('number_of_camera')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" maxlength="16" name="monitor[camera_tower_number]"
                                   id="camera_tower_number">
                            <label for="camera_tower_number"> Camera Tower Number </label>
                            @error('camera_tower_number')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" maxlength="16" name="monitor[nvr]"
                                   id="nvr">
                            <label for="nvr"> NVR </label>
                            @error('nvr')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes"></textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="col-md-6">
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
    @include('admin.location.addJs')
@endsection