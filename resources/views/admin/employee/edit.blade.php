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
            <form class="row g-3" method="post" action="{{route('employee.update',$record->id)}}">
                @csrf
                @method('PUT')
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingName" placeholder="Employee Name" name="name" value="{{$record->name}}">
                        <label for="floatingName">Employee Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingid_number" placeholder="Employee ID Number" name="id_number" value="{{$record->id_number}}">
                        <label for="floatingid_number">Employee ID Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingphone_one" placeholder="Phone Number" name="phone_one" value="{{$record->phone_one}}">
                        <label for="floatingphone_one">Phone Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingphone_two" placeholder="Phone Number 2" name="phone_two" value="{{$record->phone_two}}">
                        <label for="floatingphone_one">Phone Number(Optional)</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes">{{$record->notes}}</textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="col-md-6">
                </div>
                <div class="col-md-6">
                    <div class="form-check form-switch">
                        <input type="checkbox" class="form-check-input" name="is_regular_guard"  id="flexSwitchCheckChecked"
                               value="1" checked>
                        <label class="form-check-label" for="flexSwitchCheckChecked">Is Regular Guard</label>
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
