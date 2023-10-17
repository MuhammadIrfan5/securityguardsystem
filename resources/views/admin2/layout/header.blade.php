<!-- fixed-top-->
<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu fixed-top navbar-semi-dark navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>
                <li class="nav-item">
                    <a class="navbar-brand" href="{{route('dashboard')}}">
                        {{-- <img class="brand-logo" alt="admin logo" src="{{asset('/jeddah_images/logo.png')}}" height="30px"> --}}
                        <h3 class="brand-text">{{env('APP_NAME')}}</h3>
                    </a>
                </li>
                <li class="nav-item d-md-none">
                    <a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a>
                </li>
            </ul>
        </div>
        <div class="navbar-container content">
            <div class="collapse navbar-collapse" id="navbar-mobile">
                <ul class="nav navbar-nav mr-auto float-left">
                    <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a></li>
                </ul>
                <ul class="nav navbar-nav float-right">
                    <li class="dropdown dropdown-user nav-item">
                        <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown" aria-expanded="true">
                <span class="avatar avatar-online">
                  <img src="{{request()->user()->image}}" alt="avatar" style="height: 30px; width: 30px;"><i></i></span>
                            <span class="user-name">{{(request()->user()->name)}}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            {{-- <a class="dropdown-item" href="{{route('admin-Edit',request()->user()->id)}}"><i class="ft-user"></i> Edit Profile</a> --}}
                            {{-- <a class="dropdown-item" href="{{route('inbox')}}"><i class="fa fa-envelope-o" aria-hidden="true"></i> My inbox</a> --}}
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{route("Logout")}}"><i class="ft-power"></i> Logout</a>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
