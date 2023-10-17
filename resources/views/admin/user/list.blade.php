@extends('Admin.layout.main')

@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            <a href="{{route('users.create')}}" class="btn btn-primary">Create</a>
        </div>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">{{$title}}</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->
<!-- End Page Title -->

<section class="section">
    <div class="row">
        <div class="col-lg-12">
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
            @endif
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">User list</h5>
                    <!-- Table with stripped rows -->
                    <table id="dataTable" class="table cell-border display compact">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" onclick="handleCheck(this)" class="checkbox check-all">
                            </th>
                            <th>Role</th>
                            <th>City Name</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>DOB</th>
                            <th>Image</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <!-- End Table with stripped rows -->
                </div>
            </div>

        </div>
    </div>
</section>
@endsection
@section('page-js')
@include('Admin.user.pageJs')
@endsection
