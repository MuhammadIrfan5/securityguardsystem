<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>


<div class="login-box"
     style="width:100%;height:100vh;display: flex;flex-direction:column;align-items:center;align-content: center;justify-content: center">
    <div class="login-logo">
        <a href="{{url("/")}}"><b>{{env('APP_NAME')}}</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="card" style="height: 60vh;width:auto;">
        <div class="card-body login-card-body">
            <p class="login-box-msg">
                To reset your password.follow this link.<br>
                {{$user->resetlink}}
            </p>
        </div>
        <!-- /.login-card-body -->
    </div>
</div>


</body>
</html>


