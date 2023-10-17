@extends('Admin.layout.main')
@section('page-css')
    <!-- Datatables CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
@endsection
@section('content')
    <div class="pagetitle">
        <h1>Edit {{$title}}</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('panel.dashboard')}}">Home</a></li>
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
            <form class="" method="post" action="{{route('sf_guard_user.update', $value->id)}}">
                @csrf
                @method('PUT')
                <div class="row g-3">

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="floatingUsername" placeholder="username"
                                   name="username"
                                   value="{{$value->username}}">
                            <label for="floatingUsername">User Name</label>
                            @error('username')
                            <div class="alert alert-danger" role="alert">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Change Password"
                                   name="password">
                            <label for="floatingPassword">Change Password</label>
                            @error('password')
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
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-check form-switch">
                            <input type="checkbox" class="form-check-input" name="is_active" id="flexSwitchCheckChecked" value="1"
                                   @if(old('is_active',$value->is_active)) checked @endif>
                            <label class="form-check-label" for="flexSwitchCheckChecked">Is Active</label>
                        </div>
                        <div class="form-check form-switch">
                            <input type="checkbox" class="form-check-input" name="is_super_admin" id="flexSwitchChecked" value="1"
                                   @if(old('is_super_admin', $value->is_super_admin)) checked @endif>
                            <label class="form-check-label" for="flexSwitchChecked">Super Admin</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-sm-6 col-form-label">Select group</label>
                        <div class="col-sm-10">
                            <select class="form-select js-example-basic-multiple" name="group[]" multiple
                                    aria-label="multiple select example">
                                <option disabled>Open this select menu</option>
                                @foreach($group as $item)
                                    <option value="{{$item->id}}">{{$item->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-sm-6 col-form-label">Select permission</label>
                        <div class="col-sm-10">
                            <select class="form-select js-example-basic-multiple" name="permission[]" multiple
                                    aria-label="multiple select example">
                                <option disabled>Open this select menu</option>
                                @foreach($permission as $item)
                                    <option value="{{$item->id}}">{{$item->name}}</option>
                                @endforeach
                            </select>
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
@section('page-js')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        // Select2 Multiple
        $('.js-example-basic-multiple').select2({
            searchable: true,
            allowClear: true,
            minimumResultsForSearch: Infinity,
        });

        $('.alert-danger').delay(3000).fadeOut('slow');

        $('#floatingRepassword').on('keyup', function () {
            if ($('#floatingPassword').val() == $('#floatingRepassword').val()) {
                $('.redColor').html('Matching').css('border-color', 'green');
                // $('.redColor').html('Matching').css('background-color', 'green');
            } else
                $('.redColor').html('Not Matching').css('border-color', 'red');
            // $('.redColor').html('Not Matching').css('background-color', 'red');
        });

        {{--$.get("{{ url('listOfPermission') }}", function (data) {--}}
        {{--    $.each(data, function (index, value) {--}}
        {{--        subcategory.append(--}}
        {{--            $('<option></option>').val(value.id).html(value.sub_cat_name)--}}
        {{--        );--}}
        {{--    });--}}
        {{--});--}}
    </script>
@endsection
