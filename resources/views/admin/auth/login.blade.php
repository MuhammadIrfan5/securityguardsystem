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
                    <h3>{{env('APP_NAME')}}</h3>
                    <h3 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                        <span>{{env('APP_NAME')}}</span>
                    </h3>
                    <span class="font-small-2 ">Login</span>
                </div>
                <div class="card-body">
                    @foreach ($errors->all() as $error)
                        <span class="text-danger">{{ $error }}</span>
                    @endforeach
                    <form class="form-horizontal form-simple m-1 " action="{{ route('DoLogin') }}" method="post">
                        @csrf
                        <fieldset class="form-group position-relative has-icon-left ">
                            <input type="email" class="form-control " name="email"
                                   placeholder="Your Email" required >
                            <div class="form-control-position">
                                <i class="ft-user"></i>
                            </div>
                        </fieldset>
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="password" class="form-control " name="password"
                                   placeholder="Enter Password" required >
                            <div class="col-12 "><a href="{{ route('PasswordForgot') }}"
                                                    class="card-link text-primary float-right">Forgot Password?</a></div>
                            <div class="form-control-position">
                                <i class="fa fa-key"></i>
                            </div>
                        </fieldset>
                        <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="ft-unlock"></i>
                            Login</button>

                    </form>


                </div>
            </div>
        </div>
    </div>
@endsection
