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
                <div class="card-header card-title text-center">
                    <h3>{{env('APP_NAME')}}</h3>
                    <h3 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                        <span>{{env('APP_NAME')}}</span>
                    </h3>
                    <span class="font-small-2 ">Login</span>
                </div>
                <div class="card-body">
                    @if(session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <form method="POST" action="{{ route('verify.otp') }}">
                        @csrf
                        <input type="hidden" name="id" value="{{request()->id}}">
                        <input type="hidden" name="email" value="{{request()->email}}">
                        <input type="hidden" name="password" value="{{request()->password}}">
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
                        <button type="submit" class="btn btn-primary">
                            {{ __('Verify') }}
                        </button>
                    </form>
                </div>
            </div>
        </div>
@endsection
