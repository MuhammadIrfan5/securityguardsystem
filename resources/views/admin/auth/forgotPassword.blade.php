@extends('admin.template.blank')
@section('section')
<div class="col-12 d-flex align-items-center justify-content-center">
            <div class="col-md-4 col-10 box-shadow-2 p-0">
              <div class="card border-grey border-lighten-3 px-2 py-2 m-0">
              <div class="card-header border-0 card-title text-center p-1">
                  <h2 class="titleArea">{{env('APP_NAME')}}</h2>
                  <h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                    <span>Milky Foods By Salman</span>
                  </h6>
                </div>
                <div class="card-content">
                <h5 class="text-center">Email For Recover Password</h5>
                  <div class="card-body">
                    <div class="text-danger my-1">
                      @foreach ($errors->all() as $error)
                          <li>{{$error}}</li>
                      @endforeach
                    </div>
                    <form class="form-horizontal" action="{{route('EmailRecover')}}" >
                        @csrf
                      <fieldset class="form-group position-relative has-icon-left">
                        <input name="email" class="form-control form-control-lg" id="user-email" placeholder="Your Email Address" >
                        <div class="form-control-position">
                          <i class="ft-mail"></i>
                        </div>
                      </fieldset>
                      <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="fa fa-paper-plane" aria-hidden="true"></i> Send Email</button>
                    </form>
                  </div>
                </div>
                <div class="card-footer border-0">
                  <p class="float-sm-right text-center"><a href="{{route('login')}}" class="card-link">Login</a></p>
                </div>
              </div>
            </div>
          </div>
</div>
@endsection
