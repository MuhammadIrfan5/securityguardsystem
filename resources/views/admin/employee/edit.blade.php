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
                        <input type="text" class="form-control" id="floatingName" placeholder="Employee Name"
                               name="name" value="{{$record->name}}">
                        <label for="floatingName">Employee Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingid_number" placeholder="Employee ID Number"
                               name="id_number" value="{{$record->id_number}}">
                        <label for="floatingid_number">Employee ID Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingphone_one" placeholder="Contact Number"
                               name="phone_one" maxlength="11" value="{{$record->phone_one}}">
                        <label for="floatingphone_one">Contact Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="category_id" class="form-select"
                                id="state_id">
                            @foreach($categories as $user)
                                <option {{$record->category_id == $user->id  ? 'selected' : ''}}  value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingguard_number"
                               placeholder="Guard Card Number" name="guard_number" value="{{$record->guard_number}}">
                        <label for="floatingguard_number">Guard Card Number</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="date" class="form-control" id="floatingissue_date" placeholder="Issue Date"
                               name="issue_date" value="{{$record->issue_date}}">
                        <label for="floatingissue_date">Issue Date</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="date" class="form-control"  id="floatingexpiry_date"
                               placeholder="Expiry Date" name="expiry_date" value="{{$record->expiry_date}}">
                        <label for="floatingexpiry_date">Expiry Date</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="number" class="form-control" id="floatingpay_rate" placeholder="Pay Rate"
                               name="pay_rate" value="{{$record->pay_rate}}">
                        <label for="floatingpay_rate">Pay Rate</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingmanager_name" placeholder="Manager Name"
                               name="manager_name" value="{{$record->manager_name}}">
                        <label for="floatingmanager_name">Manager Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes">{{$record->notes}}</textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="is_active" class="form-select"
                                id="state_id">
                            <option {{$record->is_active == '1'  ? 'selected' : ''}} value="1">Approved</option>
                            <option {{$record->is_active == '0'  ? 'selected' : ''}} value="0">Not Approved</option>
                        </select>
                        <label for="floatingphone_one">Status</label>

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
