<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header">
                <span>Main</span>
                <i class=" ft-minus" data-toggle="tooltip" data-placement="right"
                   data-original-title="General"></i>
            </li>
            <li class=" nav-item {{ request()->is('dashboard') ? ' active' : '' }}">
                <a href="{{route('dashboard')}}">
                    <i class="fa fa-home" aria-hidden="true"></i>
                    <span class="menu-title" data-i18n="">
                        Dashboard
                    </span>
                </a>
            </li>
            <li class=" navigation-header">
                <span>Tables</span>
                <i class=" ft-minus" data-toggle="tooltip" data-placement="right"
                   data-original-title="General"></i>
            </li>

            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"
                                                                                                  data-i18n="">Users</span></a>
                <ul class="menu-content">
                    <li class=" {{ request()->is('users') ? ' active' : '' }}">
                        <a class="menu-item" href={{ route('users.index') }}>Users </a>
                    </li>
                    <li class=" {{ request()->is('users/create') ? ' active' : '' }}">
                        <a class="menu-item" href=
                            {{ route('users.create') }}
                        >Add Users</a>
                    </li>
                    <li class=" {{ request()->is('role') ? ' active' : '' }}">
                        <a class="menu-item" href={{ route('role.index') }}>Roles </a>
                    </li>
                </ul>
            </li>

{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Units</span></a>--}}
{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('units') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('units.index') }}--}}
{{--                        >Units</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('units/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('units.create') }}--}}
{{--                        >Add Units</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Units Shift</span></a>--}}
{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('units-shift') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('units-shift.index') }}--}}
{{--                        >Units Shift</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('units-shift/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('units-shift.create') }}--}}
{{--                        >Add Units Shift</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Machine</span></a>--}}
{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('machines') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('machines.index') }}--}}
{{--                        >Machines</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('machines/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('machines.create') }}--}}
{{--                        >Add Machines</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Machine-Product</span></a>--}}
{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('machine-product') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('machine-product.index') }}--}}
{{--                        >Machines-Product</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('machine-product/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('machine-product.create') }}--}}
{{--                        >Add Machine-Product</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Products</span></a>--}}

{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('products') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('products.index') }}--}}
{{--                        >Products</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('products/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                            {{ route('products.create') }}--}}
{{--                        >Add Products</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
{{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
{{--                                                                                                  data-i18n="">Products Variation</span></a>--}}
{{--                <ul class="menu-content">--}}
{{--                    <li class=" {{ request()->is('productsvariation') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                                                        {{ route('productsvariation.index') }}--}}
{{--                        >Products Variation</a>--}}
{{--                    </li>--}}
{{--                    <li class=" {{ request()->is('productsvariation/create') ? ' active' : '' }}">--}}
{{--                        <a class="menu-item" href=--}}
{{--                                                        {{ route('productsvariation.create') }}--}}
{{--                        >Add Products Variation</a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--            </li>--}}
    {{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
    {{--                                                                                                  data-i18n="">Raw</span></a>--}}
    {{--                <ul class="menu-content">--}}
    {{--                    <li class=" {{ request()->is('raw') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('raw.index') }}--}}
    {{--                        >Raw</a>--}}
    {{--                    </li>--}}
    {{--                    <li class=" {{ request()->is('raw/create') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('raw.create') }}--}}
    {{--                        >Add Raw</a>--}}
    {{--                    </li>--}}
    {{--                </ul>--}}
    {{--            </li>--}}
    {{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
    {{--                                                                                                  data-i18n="">Shift Manager</span></a>--}}
    {{--                <ul class="menu-content">--}}
    {{--                    <li class=" {{ request()->is('shiftmanager') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('shiftmanager.index') }}--}}
    {{--                        >Shift Manager</a>--}}
    {{--                    </li>--}}
    {{--                    <li class=" {{ request()->is('shiftmanager/create') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('shiftmanager.create') }}--}}
    {{--                        >Add Shift Manager</a>--}}
    {{--                    </li>--}}
    {{--                </ul>--}}
    {{--            </li>--}}
    {{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
    {{--                                                                                                  data-i18n="">Unit Manager</span></a>--}}
    {{--                <ul class="menu-content">--}}
    {{--                    <li class=" {{ request()->is('unitmanager') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('unitmanager.index') }}--}}
    {{--                        >Unit Manager</a>--}}
    {{--                    </li>--}}
    {{--                    <li class=" {{ request()->is('unitmanager/create') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('shiftmanager.create') }}--}}
    {{--                        >Add Shift Manager</a>--}}
    {{--                    </li>--}}
    {{--                </ul>--}}
    {{--            </li>--}}
    {{--            <li class=" nav-item"><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span class="menu-title"--}}
    {{--                                                                                                  data-i18n="">Recipe</span></a>--}}
    {{--                <ul class="menu-content">--}}
    {{--                    <li class=" {{ request()->is('recipe') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href={{ route('recipe.index') }}>Recipe </a>--}}
    {{--                    </li>--}}
    {{--                    <li class=" {{ request()->is('recipe/create') ? ' active' : '' }}">--}}
    {{--                        <a class="menu-item" href=--}}
    {{--                            {{ route('recipe.create') }}--}}
    {{--                        >Add Recipe</a>--}}
    {{--                    </li>--}}
    {{--                </ul>--}}
    {{--            </li>--}}
                <li class=" nav-item"><a href="#"> <i class="fa fa-flag-o" aria-hidden="true"></i><span class="menu-title"
                                                                                                        data-i18n="">Country</span></a>
                    <ul class="menu-content">
                        <li class=" {{ request()->is('country') ? ' active' : '' }}">
                            <a class="menu-item" href="{{route('Country')}}">Country</a>
                        </li>
                        <li class=" {{ request()->is('add-country') ? ' active' : '' }}">
                            <a class="menu-item" href="{{route('addCountry')}}">Add Country</a>
                        </li>
                    </ul>
                </li>
                        <li class=" nav-item"><a href="#"> <i class="fa fa-flag-o" aria-hidden="true"></i><span
                                        class="menu-title"
                                        data-i18n="">State</span></a>
                            <ul class="menu-content">
                                <li class=" {{ request()->is('state') ? ' active' : '' }}">
                                    <a class="menu-item" href="{{route('state.index')}}">State</a>
                                </li>
                                <li class=" {{ request()->is('state/create') ? ' active' : '' }}">
                                    <a class="menu-item" href="{{route('state.create')}}">Add State</a>
                                </li>
                            </ul>
                        </li>
                <li class=" nav-item"><a href="#"> <i class="fa fa-flag-o" aria-hidden="true"></i><span class="menu-title"
                                                                                                        data-i18n="">City</span></a>
                    <ul class="menu-content">
                        <li class=" {{ request()->is('city') ? ' active' : '' }}">
                            <a class="menu-item" href="{{route('City')}}">City</a>
                        </li>
                        <li class=" {{ request()->is('add-city') ? ' active' : '' }}">
                            <a class="menu-item" href="{{route('addCity')}}">Add City</a>
                        </li>
                    </ul>
                </li>

    {{--            <li class=" nav-item {{ request()->is('report') ? ' active' : '' }}">--}}
    {{--                <a href="--}}
    {{--                {{route('report.index')}}--}}
    {{--                    ">--}}
    {{--                    <i class="fa fa-calendar" aria-hidden="true"></i>--}}
    {{--                    <span class="menu-title" data-i18n="">--}}
    {{--                        Reports List--}}
    {{--                    </span>--}}
    {{--                </a>--}}
    {{--            </li>--}}
    {{--            <li class=" nav-item {{ request()->is('history') ? ' active' : '' }}">--}}
    {{--                <a href="--}}
    {{--                {{route('history.index')}}--}}
    {{--                    ">--}}
    {{--                    <i class="fa fa-list-ol" aria-hidden="true"></i>--}}
    {{--                    <span class="menu-title" data-i18n="">--}}
    {{--                    History List--}}
    {{--                    </span>--}}
    {{--                </a>--}}
    {{--            </li>--}}

        </ul>
    </div>
</div>
