@extends('admin.layout.main')

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
            <form class="row g-3" method="post" action="{{route('location.update',$data->id)}}">
                @method("PUT")
                @csrf
                @if(request()->user()['role_id']==1)
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="user_id" class="form-select"
                                    id="user_id">
                                <option disabled selected>Users list</option>
                                @foreach($users as $user)
                                    <option {{$data->user_id == $user->id  ? 'selected' : ''}} value="{{ $user->id }}">{{$user->first_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endif
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingName" placeholder="Location Name"
                               name="name" value="{{$data->name}}">
                        <label for="floatingName">Location Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingAddress" placeholder="Address"
                               name="address" value="{{$data->address}}">
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
                                        <tr>
                                            <td><input type="checkbox" class="form-check-input day-checkbox" name="days[]"
                                                       {{in_array( $day,$selectedDays) ? 'checked' : ''}}
                                                       value="{{$day}}"></td>
                                            <td>{{$day}}</td>
                                            <td><input type="time" class="form-control time-input" name="start_time[]" value="{{$selectedStartTime[$key]??''}}"></td>
                                            <td><input type="time" class="form-control time-input" name="end_time[]" value="{{$selectedEndTime[$key]??''}}"></td>
                                        </tr>
                                @endforeach
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->
                        </div>
                    </div>

                </div>

                {{--client detail--}}
                <div class="col-md-12">
                    <h4 class="form-check-label" for="clientDetails">
                        <u> Add Client Details</u>
                    </h4>

                    {{--                    <div class="form-check">--}}
                    {{--                        <input class="form-check-input" value="creditcard" type="checkbox" name="payment_mode"--}}
                    {{--                               id="clientDetails"--}}
                    {{--                               onclick="showbox(this)">--}}

                    {{--                    </div>--}}
                </div>

                <div id="client-details-container">
                    <div class="client-details">
                        <div class="col-md-12">
                        </div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" name="client[client_name][]"
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
                                    <input type="text" class="form-control" name="client[client_designation][]"
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
                                    <input type="email" class="form-control" name="client[client_email][]"
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
                                    <input type="text" class="form-control" name="client[client_phone][]"
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
                        <div class="col-md-12 text-end">
                            <button type="button"  class="btn btn-danger delete-client " >X</button>
                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="add-client">Add Client</button>
                </div>
                <div class="col-md-12">
                </div>


                {{--License Number--}}
                <div class="col-md-12">
                    <div class="form-check">
                        <input class="form-check-input" value="licenseNumber" type="checkbox" name="clientLicenseNumber"
                               id="clientLicenseNumber"
                               onclick="checkOnsite(this)">
                        <h4 class="form-check-label" for="clientLicenseNumber">
                            <u> Trailer On Site</u>
                        </h4>
                    </div>
                </div>
                <div id="licenseNumber" class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="license_number"
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
                            <u> Monitoring</u>
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
                            <input type="number" class="form-control" name="monitor[number_of_camera]"
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
                            <input type="number" class="form-control" name="monitor[camera_tower_number]"
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
                            <input type="text" class="form-control" name="monitor[nvr]"
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
