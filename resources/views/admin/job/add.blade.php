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
            <form class="row g-3" method="post" action="{{route('assign-job.store')}}">
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
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-In" name="check_in">
                        <label for="floatingName">Check-In</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <input class="form-check-input" value="WhatsApp" type="radio" name="calling_number"
                           id="WhatsApp"
                           checked="">
                    <label class="form-check-label" for="WhatsApp">
                        WhatsApp
                    </label>


                    <input class="form-check-input" value="Dispatch" type="radio" name="calling_number" id="Dispatch">
                    <label class="form-check-label" for="Dispatch">
                        Dispatch
                    </label>

                    <input class="form-check-input" value="Construction" type="radio" name="calling_number" id="Construction">
                    <label class="form-check-label" for="Construction">
                        Construction
                    </label>

                    <input class="form-check-input" value="Timesheet" type="radio" name="calling_number" id="Timesheet">
                    <label class="form-check-label" for="Timesheet">
                        Timesheet
                    </label>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form><!-- End floating Labels Form -->

        </div>
    </div>

@endsection
