<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
@include('admin.layout.head')

@yield('page-css')
<body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
      data-open="click" data-menu="vertical-menu" data-col="2-columns">
<!-- ////////////////////////////////////////////////////////////////////////////-->

@yield('section')
{{--    @include('layout.backend.script')--}}

{{--    @yield('page-script')--}}
</body>
</html>
