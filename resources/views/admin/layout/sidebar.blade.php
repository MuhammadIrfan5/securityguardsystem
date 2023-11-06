<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="{{route('dashboard')}}">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#sales-nav1" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>User list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav1" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('users.index')}}"
                       class="{{ request()->is('users') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Users</span>
                    </a>
                </li>
{{--                <li>--}}
{{--                    <a href="{{route('role.index')}}"--}}
{{--                       class="{{ request()->is('role') ? ' active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Roles</span>--}}
{{--                    </a>--}}
{{--                </li>--}}

            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#sales-nav2" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Employee list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav2" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('employee.index')}}"
                       class="{{ request()->is('employee') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Employee list</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#sales-nav3" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Location list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav3" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('location.index')}}"
                       class="{{ request()->is('location') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Location list</span>
                    </a>
                </li>
                <li>
                    <a href="{{route('locationType.index')}}"
                       class="{{ request()->is('locationType') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Location type list</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#sales-nav4" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Job list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav4" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('assign-job.index')}}"
                       class="{{ request()->is('assign-job') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Scheduling</span>
                    </a>
                </li>
            </ul>
            <ul id="sales-nav4" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('assign-job.index')}}"
                       class="{{ request()->is('assign-job') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Time Sheet</span>
                    </a>
                </li>
            </ul>
            <ul id="sales-nav4" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('assign-job.index')}}"
                       class="{{ request()->is('assign-job') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Confirmation Cell</span>
                    </a>
                </li>
            </ul>
            <ul id="sales-nav4" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('assign-job.index')}}"
                       class="{{ request()->is('assign-job') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Monitoring</span>
                    </a>
                </li>
            </ul>
        </li>

        <!-- End Components Nav -->
    </ul>

</aside><!-- End Sidebar-->
