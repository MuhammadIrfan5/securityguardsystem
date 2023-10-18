@extends('Admin.layout.main')

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
            <form class="row g-3" method="post" action="{{route('assign-job.update',$data->id)}}">
                @csrf
                @method('PUT')
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="parent_id">
                            @foreach($location as $user)
                                <option {{$data->location_id==$user->id? 'checked':''}} value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="employee_id" class="form-select"
                                id="employee_id">
                            @foreach($employee as $user)
                                <option {{$data->employee_id==$user->id? 'checked':''}} value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-In" name="check_in" value="{{$data->check_in}}">
                        <label for="floatingName">Check-In</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="is_approved" class="form-select"
                                id="is_approved">
                                <option {{$data->is_approved==1? 'selected':''}} value="1">Approved</option>
                                <option {{$data->is_approved==0? 'selected':''}} value="0">Not Approved</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-12">
                    <input class="form-check-input" value="WhatsApp" type="radio" name="calling_number"
                           id="WhatsApp"
                            {{$data->calling_number=="WhatsApp"? 'checked':''}}>
                    <label class="form-check-label" for="WhatsApp">
                        WhatsApp
                    </label>


                    <input class="form-check-input" value="Dispatch" type="radio" name="calling_number" id="Dispatch"
                            {{$data->calling_number=="Dispatch"? 'checked':''}}>
                    <label class="form-check-label" for="Dispatch">
                        Dispatch
                    </label>

                    <input class="form-check-input" value="Construction" type="radio" name="calling_number" id="Construction"
                            {{$data->calling_number=="Construction"? 'checked':''}}>
                    <label class="form-check-label" for="Construction">
                        Construction
                    </label>

                    <input class="form-check-input" value="Timesheet" type="radio" name="calling_number" id="Timesheet"
                            {{$data->calling_number=="Timesheet"? 'checked':''}}>
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
