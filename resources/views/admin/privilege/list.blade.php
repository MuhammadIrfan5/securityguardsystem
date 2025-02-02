@extends('admin.layout.main')

@section('content')

    <div class="pagetitle">
        <h1>{{$title}}</h1>
        <div class="text-end">
            <a href="{{route('privilege.create')}}" class="btn btn-primary">Create</a>
        </div>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item active">{{$title}}</li>
            </ol>
        </nav>
    </div>
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
                        <h5 class="card-title">{{$title}} list</h5>
                        <!-- Table with stripped rows -->
                        <table id="dataTable" class="table cell-border display compact">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Privilege</th>
                                <th>User Name</th>
                                <th>Role</th>
                                <th>Assign By</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                        </table>
                        <!-- End Table with stripped rows -->
                    </div>
                </div>

            </div>
        </div>
    </section>
@endsection
@section('page-js')
    @include('admin.privilege.pageJs')
@endsection
