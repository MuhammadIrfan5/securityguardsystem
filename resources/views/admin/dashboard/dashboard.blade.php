@extends('admin.layout.app')
@section('section')
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <!--stats-->
            <div class="row">
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media">
                                    <div class="media-body text-left w-100">
                                        <h3 class="primary">{{$userCount}}</h3>
                                        <span>New User</span>
                                    </div>
                                    <div class="media-right media-middle">
                                        <i class="icon-user-follow primary font-large-2 float-right"></i>
                                    </div>
                                </div>
                                <div class="progress progress-sm mt-1 mb-0">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="25"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media">
                                    <div class="media-body text-left w-100">
                                        <h3 class="danger">{{$managerCount}}</h3>
                                        <span>Total Admins</span>
                                    </div>
                                    <div class="media-right media-middle">
                                        <i class="icon-social-dropbox danger font-large-2 float-right"></i>
                                    </div>
                                </div>
                                <div class="progress progress-sm mt-1 mb-0">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 40%" aria-valuenow="25"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media">
                                    <div class="media-body text-left w-100">
                                        <h3 class="success">{{$productCount}}</h3>
                                        <span>Total Country</span>
                                    </div>
                                    <div class="media-right media-middle">
                                        <i class="icon-layers success font-large-2 float-right"></i>
                                    </div>
                                </div>
                                <div class="progress progress-sm mt-1 mb-0">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="25"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media">
                                    <div class="media-body text-left w-100">
                                        <h3 class="warning">{{$machineCount}}</h3>
                                        <span>Total City</span>
                                    </div>
                                    <div class="media-right media-middle">
                                        <i class="icon-globe warning font-large-2 float-right"></i>
                                    </div>
                                </div>
                                <div class="progress progress-sm mt-1 mb-0">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 35%" aria-valuenow="25"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/stats-->
        </div>
    </div>
@endsection
