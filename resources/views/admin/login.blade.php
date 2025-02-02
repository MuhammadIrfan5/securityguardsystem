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

                        <form class="row g-3 needs-validation" method="post" action="{{ route('DoLogin')}}">
                            @csrf
                            <div class="col-12">
                                <label for="yourUserEmail" class="form-label">Email</label>
                                <div class="input-group has-validation">
                                    <input type="email" name="email" class="form-control" id="yourUserEmail"
                                           placeholder="abc@hotmail.com" required>
                                    <div class="invalid-feedback">Please enter your email.</div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="yourPassword" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="yourPassword" required>
                                <div class="invalid-feedback">Please enter your password!</div>
                            </div>

                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" value="true"
                                           id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-primary w-100" type="submit">Login</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
