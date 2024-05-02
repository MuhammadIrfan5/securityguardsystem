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
            <h5 class="card-title">{{$title}} list</h5>
            <!-- Table with stripped rows -->
            <table id="dataTable" class="table cell-border display compact">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Phone</th>
                    <th>Attendance</th>
                </tr>
                </thead>
                <tbody>
                @foreach() @endforeach
                </tbody>
            </table>
            <!-- End Table with stripped rows -->
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Schedule List</h5>
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
        @endif
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="
{{--            {{route('time-sheet.update',$record->id)}}--}}
            ">
                @csrf
                @method('PUT')
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="parent_id" disabled>
                            @foreach($location as $user)

{{--                                <option {{$data->location_id==$user->id? 'checked':''}} value="{{ $user->id }}">{{$user->name}}</option>--}}
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="employee_id" class="form-select"
                                id="employee_id" disabled>
                            @foreach($employee as $user)
{{--                                <option {{$data->employee_id==$user->id? 'checked':''}} value="{{ $user->id }}">{{$user->name}}</option>--}}
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-In" name="check_in" value="" required>
                        <label for="floatingName">Check-In</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-Out" name="check_out" value="" >
                        <label for="floatingName">Check-Out</label>
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
    @include('admin.timesheet.pageJs')
@endsection