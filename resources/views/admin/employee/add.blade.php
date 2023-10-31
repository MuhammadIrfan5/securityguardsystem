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
                @foreach ($errors->all() as $error)
                <div class="alert alert-danger">{{ $error }}</div>
            @endforeach

        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('employee.store')}}">
                @csrf
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingName" placeholder="Employee Name" name="name">
                        <label for="floatingName">Employee Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingid_number" placeholder="Employee ID Number" name="id_number">
                        <label for="floatingid_number">Employee ID Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingphone_one" placeholder="Contact Number" name="phone_one" maxlength="11">
                        <label for="floatingphone_one">Contact Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="11" id="floatingphone_two" placeholder="Phone Number 2" name="phone_two">
                        <label for="floatingphone_one">Phone Number(Optional)</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingguard_number" placeholder="Guard Card Number" name="guard_number">
                        <label for="floatingguard_number">Guard Card Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="date" class="form-control" id="floatingissue_date" placeholder="Issue Date" name="issue_date">
                        <label for="floatingissue_date">Issue Date</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingpay_rate" placeholder="Pay Rate" name="pay_rate">
                        <label for="floatingpay_rate">Pay Rate</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingmanager_name" placeholder="Manager Name" name="manager_name">
                        <label for="floatingmanager_name">Manager Name</label>
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
