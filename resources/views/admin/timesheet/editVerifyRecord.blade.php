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
            <h5 class="card-title">Add {{$title}}</h5>
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
            @endif
            <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('update.verify.record')}}">
                @csrf
                <input type="hidden" name="id" value="{{$data->id}}">
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="location_id" class="form-select"
                                id="location_id" disabled>
                            <option disabled selected>Location</option>
                            @foreach($locations as $user)
                                <option value="{{ $user->id }}" {{($data->location_id)==$user->id?'selected':''}}>{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="employee_id" class="form-select"
                                id="employee_id" disabled>
                            @foreach($employee as $user)
                                <option {{$data->employee_id==$user->id? 'selected':''}} value="{{ $user->id }}">{{$user->name}}</option>
                            @endforeach
                        </select>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-In" name="check_in"
                               value="{{$data->check_in_time}}">
                        <label for="floatingName">Check-In</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="time" class="form-control" id="floatingName" placeholder="Check-Out"
                               name="check_out" value="{{$data->check_out_time}}">
                        <label for="floatingName">Check-Out</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes"></textarea>
                        <label for="floatingphone_one">{{$data->notes}}</label>
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
            $(function () {
                $("#location_id").on('click', function () {
                    var id = $(this).val();
                    console.log(id);
                    var employeeId = $('#employee_id');
                    employeeId.empty();
                    if (id != null) {
                        $.ajax({
                            url: "{{url('get-employee?location_id=')}}" + id,
                            type: 'GET',
                            success: function (result) {
                                console.log(result);
                                $.each(result, function (index, value) {
                                    employeeId.append(
                                        $('<option></option>').val(value.id).html(value.name)
                                    );
                                });
                            },
                            error: function (error) {
                                console.log(error.status)
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
