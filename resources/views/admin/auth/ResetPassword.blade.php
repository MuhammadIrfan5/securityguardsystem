@extends('admin.layout.blank')
@section('section')
<style>
    body {
        padding-top: 0 !important;
    }
</style>
<div class="row h-100 ">
    <div class="card col-4 m-auto ml-0 box-shadow-2 " style="border-radius: 10px">
        <div class="border-grey border-lighten-5">
            <div class="card-header card-title text-center" >
                <h3>SOS</h3>
                <h3 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                    <span>Security Organizing System</span>
                </h3>
                <span class="font-small-2 ">Update Password</span>
            </div>
            <div class="card-body">
                @if ($message = Session::get('success'))
                    <div class="alert alert-success alert-block">
                        <strong>{{ $message }}</strong>
                    </div>
                @endif


                @if ($message = Session::get('error'))
                    <div class="alert alert-danger alert-block">
                        <strong>{{ $message }}</strong>
                    </div>
                @endif

                <div class="text-danger my-1">
                    @foreach ($errors->all() as $error)
                        <li>{{$error}}</li>
                    @endforeach
                </div>
                <form class="form-horizontal form-simple" action="{{route('PasswordUpdate')}}" method="post">
                    @csrf
                    <fieldset class="form-group position-relative has-icon-left">
                        <input type="hidden" name="token" value="{{$token}}">
                        <input type="password" class="form-control form-control-lg" name="password" placeholder="Enter Password" required>
                        <div class="form-control-position">
                            <i class="fa fa-key"></i>
                        </div>
                    </fieldset>
                    <fieldset class="form-group position-relative has-icon-left">
                        <input type="password" class="form-control form-control-lg" name="password_confirmation" placeholder="Confirm Password" required>
                        <div class="form-control-position">
                            <i class="fa fa-key"></i>
                        </div>
                    </fieldset>
                    <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="icon-refresh"></i> Reset Pasword</button>
                </form>
            </div>


        </div>
    </div>
</div>


@endsection
<!-- Mirrored from pixinvent.com/stack-responsive-bootstrap-4-admin-template/html/ltr/vertical-menu-template/login-simple.blade.php by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 25 Jun 2018 06:14:08 GMT -->
