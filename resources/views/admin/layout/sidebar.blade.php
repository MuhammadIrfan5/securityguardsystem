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
                <i class="bi bi-person-add"></i><span>User list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav1" class="nav-content collapse {{ request()->is('users') ? ' show' : 'hide' }}" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{route('users.index')}}"
                       class="{{ request()->is('users') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Users</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#sales-nav2" data-bs-toggle="collapse" href="#">
                <i class="bi bi-person"></i><span>Employee list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav2" class="nav-content collapse {{ request()->is('employee') ? ' show' : 'hide' }}" data-bs-parent="#sidebar-nav">
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
                <i class="bi bi-map-fill"></i><span>Location list</span><i
                        class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sales-nav3" class="nav-content collapse {{ request()->is('location') ? ' show' : 'hide' }}" data-bs-parent="#sidebar-nav">
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
            <a class="nav-link
                    " href="{{route('schedule.index')}}">
                <i class="bi bi-calendar"></i>
                <span>Scheduling</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link
                    " href="{{route('assign-job.index')}}">
                <i class="bi bi-clock"></i>
                <span>Verify Records</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request()->is('monitoring') ? ' collapsed' : '' }}
                    " href="{{route('monitoring.index')}}">
                <i class="bi bi-laptop"></i>
                <span>Monitoring</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link
{{--{{ request()->is('assign-job') ? ' collapsed' : '' }}--}}
                    " href="{{route('assign-job.index')}}">
                <i class="bi bi-check"></i>
                <span>Confirmation Call</span>
            </a>
        </li>
        <!-- End Components Nav -->
    </ul>

</aside><!-- End Sidebar-->
