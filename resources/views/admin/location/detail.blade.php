@extends('admin.layout.main')
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
                                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">
                                    Details
                                </button>
                            </li>
                        </ul>
                        <div class="tab-content pt-2">

                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Location list</h5>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label ">Location Name</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->name}}</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label ">Address</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->address}}</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Time Zone</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->timezone}}</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Coverage Start Time</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <td></td>{{$data->coverage_start_time}}</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Coverage End Time</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->coverage_end_time}}</div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">location Type</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->maintype->type}}</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">License Number</div>
                                                    <div class="col-lg-9 col-md-8">{{$data->license_number}}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @if($data->clientDetail->count()>0)
                                        @foreach($data->clientDetail as $key=> $item)
                                            <div class="col-lg-6">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Client Detail ({{(int)$key+1}})</h5>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 label ">Client Name</div>
                                                            <div class="col-lg-9 col-md-8">{{$item->client_name}}</div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 label ">Client Designation</div>
                                                            <div class="col-lg-9 col-md-8">{{$item->client_designation}}</div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 label">Client Email</div>
                                                            <div class="col-lg-9 col-md-8">{{$item->client_email}}</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 label">Client Phone</div>
                                                            <div class="col-lg-9 col-md-8">{{$item->client_phone}}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @endif
                                    @if(!empty($data->monitoring))
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Client Detail</h5>
                                                    <div class="row">
                                                        <div class="col-lg-8 col-md-4 label ">Monitoring Number of Camera</div>
                                                        <div class="col-lg-3 col-md-8">{{$data->monitoring->number_of_camera}}</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-8 col-md-4 label ">Monitoring Camera Tower Number</div>
                                                        <div class="col-lg-3 col-md-8">{{$data->monitoring->camera_tower_number}}</div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-8 col-md-4 label">Monitoring NVR</div>
                                                        <div class="col-lg-3 col-md-8">{{$data->monitoring->nvr}}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div><!-- End Bordered Tabs -->
                    </div>
                </div>

            </div>
        </div>
    </section>

@endsection
