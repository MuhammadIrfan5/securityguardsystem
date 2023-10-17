<!DOCTYPE html>
<html lang="en">
@include('Admin.layout.head')
@yield('page-css')

<body>
@include('Admin.layout.header')
@include('Admin.layout.sidebar')
<main id="main" class="main">

    @yield('content')

</main><!-- End #main -->

@include('Admin.layout.footer')

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

@include('Admin.layout.script')
@yield('page-js')
</body>
</html>
