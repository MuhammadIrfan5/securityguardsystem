@extends('admin.layout.main')
@section('page-css')
    <!-- Datatables CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
@endsection
@section('content')
    <div class="pagetitle">
        <h1>Edit {{$title}}</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
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
            <form class="" method="post" action="{{route('users.update', $value->id)}}">
                @csrf
                @method('PUT')
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="role_id" class="form-select"
                                    id="role_id">
                                <option disabled selected>Role list</option>
                                @foreach($role as $user)
                                    <option {{$value->role_id == $user->id  ? 'selected' : ''}} value="{{ $user->id }}">{{ $user->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="country_name" class="form-select"
                                    id="country_name">
                                @foreach($country as $user)
                                    <option {{$value->country_id == $user->id  ? 'selected' : ''}} value="{{ $user->id }}">{{ $user->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="state_id" class="form-select"
                                    id="state_id">
                                @foreach($state as $user)
                                    <option {{$value->state_id == $user->id  ? 'selected' : ''}} value="{{ $user->id }}">{{ $user->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="city_name" class="form-select"
                                    id="city_name">
                                @foreach($city as $user)
                                    <option {{$value->city_id == $user->id  ? 'selected' : ''}} value="{{ $user->id }}">{{ $user->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingFirstname" placeholder="First Name"
                                   name="first_name"
                                   value="{{$value->first_name}}">
                            <label for="floatingUsername">First Name</label>
                            @error('first_name')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingLastname" placeholder="Last Name"
                                   name="last_name"
                                   value="{{$value->last_name}}">
                            <label for="floatingLastname">Last Name</label>
                            @error('last_name')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingMiddlename" placeholder="Middle Name"
                                   name="middle_name"
                                   value="{{$value->middle_name}}">
                            <label for="floatingMiddlename">Middle Name</label>
                            @error('last_name')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingPhone" placeholder="Phone Number 1"
                                   name="phone1"
                                   value="{{$value->phone1}}">
                            <label for="floatingPhone">Phone Number 1</label>
                            @error('phone1')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="floatingPhone2" placeholder="Phone Number 2"
                                   name="phone2"
                                   value="{{$value->phone2}}">
                            <label for="floatingPhone2">Phone Number 2</label>
                            @error('phone2')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingEmail" placeholder="Email" name="email"
                                   value="{{$value->email}}">
                            <label for="floatingEmail">Email</label>
                            @error('email')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingEmail" placeholder="Secondary Email"
                                   name="secondary_email"
                                   value="{{$value->secondary_email}}">
                            <label for="floatingEmail">Secondary Email</label>
                            @error('secondary_email')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingAddress" placeholder="Address"
                                   name="address"
                                   value="{{$value->address}}">
                            <label for="floatingAddress">Address</label>
                            @error('address')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="date" class="form-control" id="floatingBirth" placeholder="Date Of Birth"
                                   name="dob"
                                   value="{{$value->dob}}">
                            <label for="floatingBirth">Date Of Birth</label>
                            @error('dob')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select name="gender" class="form-select"
                                    id="state_id">
                                <option disabled selected>Gender list</option>
                                <option {{$value->gender == 'male'  ? 'selected' : ''}} value="male">Male</option>
                                <option {{$value->gender == 'female'  ? 'selected' : ''}} value="female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password"
                                   name="password">
                            <label for="floatingPassword">Password</label>
                            @error('password')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form><!-- End floating Labels Form -->
        </div>
    </div>
@endsection
