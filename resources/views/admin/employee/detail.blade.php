@extends('Admin.layout.main')
@section('content')
    <div class="pagetitle">
        <h1>{{$activeMenu}} Details</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item">{{$activeMenu}}</li>
                <li class="breadcrumb-item active">Profile</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    {{--    @dd($user)--}}
    <section class="section profile">
        <div class="row">
            <div class="col-xl-12">

                <div class="card">
                    <div class="card-body pt-3">
                        <!-- Bordered Tabs -->
                        <ul class="nav nav-tabs nav-tabs-bordered">

                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                            </li>
                        </ul>
                        <div class="tab-content pt-2">

                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                <h5 class="card-title">Profile Details</h5>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">Employee Name</div>
                                    <div class="col-lg-9 col-md-8">{{$data->name}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">Employee Id No.</div>
                                    <div class="col-lg-9 col-md-8">{{$data->id_number}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Contact Number</div>
                                    <div class="col-lg-9 col-md-8">{{$data->phone_one}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Contact Number (Optional)</div>
                                    <div class="col-lg-9 col-md-8">{{$data->city}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Guard Number</div>
                                    <div class="col-lg-9 col-md-8">{{$data->guard_number}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Issue Date</div>
                                    <div class="col-lg-9 col-md-8">{{$data->issue_date}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Pay Rate</div>
                                    <div class="col-lg-9 col-md-8">{{$data->pay_rate}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Manager Name</div>
                                    <div class="col-lg-9 col-md-8">{{$data->manager_name}}</div>
                                </div>
                            </div>
                        </div><!-- End Bordered Tabs -->

                    </div>
                </div>

            </div>
        </div>
    </section>

@endsection
