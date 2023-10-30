<!DOCTYPE html>
<html lang="en">
@include('admin.layout.head')
<body>
<main>
    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">

        @yield('content')
    </section>

</main><!-- End #main -->


<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

@include('admin.layout.script')
</body>
</html>
