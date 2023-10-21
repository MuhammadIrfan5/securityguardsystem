<!DOCTYPE html>
<html lang="en">
@include('admin.layout.head')
@yield('page-css')

<body>
@include('admin.layout.header')
@include('admin.layout.sidebar')
<main id="main" class="main">

    @yield('content')

</main><!-- End #main -->

@include('admin.layout.footer')

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

@include('admin.layout.script')
@yield('page-js')
</body>
</html>
