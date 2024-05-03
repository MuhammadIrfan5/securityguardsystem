<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Dashboard - {{env('APP_NAME')}}</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <!-- Favicons -->
    <link href="{{asset("/admin/assets/img/favicon.png")}}" rel="icon">
    <link href="{{asset("/admin/assets/img/apple-touch-icon.png")}}" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="{{asset("https://fonts.gstatic.com")}}" rel="preconnect">
    <link href="{{asset("https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i")}}" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="{{asset("/admin/assets/vendor/bootstrap/css/bootstrap.min.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/boxicons/css/boxicons.min.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/quill/quill.snow.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/quill/quill.bubble.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/remixicon/remixicon.css")}}" rel="stylesheet">
    <link href="{{asset("/admin/assets/vendor/simple-datatables/style.css")}}" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="{{asset("/admin/assets/css/style.css")}}" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

</head>
