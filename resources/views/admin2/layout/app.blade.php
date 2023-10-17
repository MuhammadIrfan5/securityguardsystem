<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
@include('admin.layout.head')
<body class="vertical-layout vertical-menu 2-columns menu-expanded fixed-navbar"
      data-open="click" data-menu="vertical-menu" data-col="2-columns">
<!-- ////////////////////////////////////////////////////////////////////////////-->
@include('admin.layout.header')
@include('admin.layout.navigation')
<div class="app-content content">
@yield('section')

</div>
</body>
@include('admin.layout.footer')
@include('admin.layout.script')
@yield('page-js')
</html>
