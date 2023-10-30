<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="{{route('dashboard')}}">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->


{{--                <li>--}}
{{--                    <a href="{{route('sf_guard_group.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/sf_guard_group') ? 'active' : '' }}">--}}

{{--                        <i class="bi bi-circle"></i><span>User Group</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('sf_guard_permission.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/sf_guard_permission') ? 'active' : '' }}">--}}

{{--                        <i class="bi bi-circle"></i><span>Permission list</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('categories.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/categories') ? 'active' : '' }}">--}}

{{--                        <i class="bi bi-circle"></i><span>Category list</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('services.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/services') ? 'active' : '' }}">--}}

{{--                        <i class="bi bi-circle"></i><span>Services list</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('packages.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/packages') ? 'active' : '' }}">--}}

{{--                        <i class="bi bi-circle"></i><span>Packages list</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </li><!-- End Components Nav -->--}}

{{--        <li class="nav-item">--}}
{{--            <a class="nav-link collapsed" data-bs-target="#form-nav1" data-bs-toggle="collapse" href="#">--}}
{{--                <i class="bi bi-layout-text-window-reverse"></i><span>Client Management</span><i--}}
{{--                    class="bi bi-chevron-down ms-auto"></i>--}}
{{--            </a>--}}
{{--            <ul id="form-nav1" class="nav-content collapse" data-bs-parent="#sidebar-nav">--}}
{{--                <li>--}}
{{--                    <a href="{{route('reviews.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/reviews') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Review list</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('testimonials.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/testimonials') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>User Testimonials</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('mobileusers.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/mobileusers') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Mobile Device</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('rating.index')}} "--}}
{{--                       class="{{ request()->is('panel/users/rating') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>User Rating</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('messagesarchive.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/messagesarchive') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Private Message Archive</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('messages.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/messages') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Private Message</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('superdesigners.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/superdesigners') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Super Designer</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('project-holder.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/project-holder') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Project Holder</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('designer-list.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/designer-list') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Designer</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </li><!-- End Components Nav -->--}}

{{--        <li class="nav-item">--}}
{{--            <a class="nav-link collapsed" data-bs-target="#order-nav1" data-bs-toggle="collapse" href="#">--}}
{{--                <i class="bi bi-layout-text-window-reverse"></i><span>Order Management</span><i--}}
{{--                    class="bi bi-chevron-down ms-auto"></i>--}}
{{--            </a>--}}
{{--            <ul id="order-nav1" class="nav-content collapse" data-bs-parent="#sidebar-nav">--}}
{{--                <li>--}}
{{--                    <a href="{{route('orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>All Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('active-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/active-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Active Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('latest-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/latest-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Latest Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('new-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/new-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>New Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('lock-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/lock-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Lock Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('pending-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/pending-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Pending Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('withdraw-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/withdraw-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Withdraw Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('finalized-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/finalized-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Finalized Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('inactive-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/inactive-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Inactive Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('mobile-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/mobile-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Mobile Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="{{route('client-share-orders.index')}}"--}}
{{--                       class="{{ request()->is('panel/users/client-share-orders') ? 'active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Client Share Orders</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </li><!-- End Components Nav -->--}}

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
{{--                    <a href="{{route('users.create')}}"--}}
{{--                       class="{{request()->is('users/create') ? ' active' : '' }}">--}}
{{--                        <i class="bi bi-circle"></i><span>Add Users</span>--}}
{{--                    </a>--}}
{{--                </li>--}}
                <li>
                    <a href="{{route('role.index')}}"
                       class="{{ request()->is('role') ? ' active' : '' }}">
                        <i class="bi bi-circle"></i><span>Roles</span>
                    </a>
                </li>

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
                        <i class="bi bi-circle"></i><span>Job list</span>
                    </a>
                </li>
            </ul>
        </li>

        <!-- End Components Nav -->
    </ul>

</aside><!-- End Sidebar-->
