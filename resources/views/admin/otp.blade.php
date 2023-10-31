@extends('admin.layout.blank')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                <div class="d-flex justify-content-center py-4">
                    <a href="index.html" class="logo d-flex align-items-center w-auto">
                        <img src="{{asset('admin/assets/img/logo.png')}}" alt="">
                        <span class="d-none d-lg-block">{{env('APP_NAME')}}</span>
                    </a>
                </div><!-- End Logo -->

                <div class="card mb-3">
                    <div class="card-body">

                        <div class="pt-4 pb-2">
                            <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                            <p class="text-center small">Enter your email & password to login</p>
                        </div>
                        @if ($errors->has('email'))
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                {{ $errors->first('email') }}
                            </div>
                        @endif

                        <form method="POST" action="{{ route('verify.otp') }}">
                            @csrf
                            <input type="hidden" name="id" value="{{request()->id}}">
                            <input type="hidden" name="email" value="{{request()->email}}">
                            <input type="hidden" name="password" value="{{request()->password}}">
                            <div class="col-12">

                                <div class="form-group">
                                    <label for="otp">{{ __('OTP') }}</label>
                                    <input id="otp" type="text" class="form-control @error('otp') is-invalid @enderror"
                                           name="otp" required autocomplete="otp" autofocus>
                                    @error('otp')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <br>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Verify') }}
                                </button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
