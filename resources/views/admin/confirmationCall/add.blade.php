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
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('confirmation-call.store')}}" enctype="multipart/form-data">
                @csrf

                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="location_id">
                            <option disabled selected>Location</option>
                            @foreach($location as $user)
                                <option value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="employee_id" class="form-select"
                                id="employee_id">
                            <option disabled selected>Employee list</option>
                            {{--                            @foreach($employee as $user)--}}
                            {{--                                <option value="{{ $user->id }}">{{$user->name}}</option>--}}
                            {{--                            @endforeach--}}
                        </select>
                    </div>
                </div>
                <input type="hidden" name="schedule_id" id="schedule_id" value="">

                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="status" class="form-select"
                                id="status">
                            <option disabled selected>Status list</option>
                            <option value="approved">Approved</option>
                            <option value="not approved">Not Approved</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes"></textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
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
    <script>
        $(document).ready(function () {
            $('#location_id').on('change', function () {

                var locationId = $(this).val();
                $.ajax({
                    type: 'GET',
                    data: {
                        locationId: locationId
                    },
                    url: '{{url('get-employees/')}}',
                    success: function (data) {
                        data = data['employee'];
                        $('#employee_id').empty();
                        $.each(data, function (index, item) {
                            $('#employee_id').append('<option value="' + item.id + '">' + item.name + '</option>');

                            $('#schedule_id').append('<input type="hidden" name="schedule_id" value="' + item.schedule_id + '">');

                        });
                    }
                });
            });

        });
    </script>
@endsection