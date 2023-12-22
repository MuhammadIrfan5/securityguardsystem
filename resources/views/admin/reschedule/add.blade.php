@extends('admin.layout.main')
@section('page-css')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
@endsection
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
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('reschedule.store')}}">
                @csrf

                <div class="col-md-6">
                    <div class="form-floating">

                        <select name="location_id[]" class="form-select select2Location"
                                id="parent_id" multiple="multiple">
                            @foreach($locations as $location)
                                <option value="{{$location->id}}">{{$location->location->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-check">
                        <input class="form-check-input" value="Last_day" type="radio" name="previous_date" >
                        <h5 class="form-check-label" for="monitoring">
                                Last Day

                        </h5>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" value="Last_week" type="radio" name="previous_date"
                               checked="">
                        <h5 class="form-check-label" for="NonMonitoring">
                            Last Week
                        </h5>
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
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.select2Location').select2();
        });</script>
@endsection