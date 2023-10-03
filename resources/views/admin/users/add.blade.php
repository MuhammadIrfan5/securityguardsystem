@extends('admin.layout.app')
@section('section')
    <!-- fixed-top-->
    <div class="content-wrapper">
        <div class="content-body">
            <!-- Basic Elements start -->

            <section class="basic-elements">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card p-2" style="border-radius: 10px">
                            <div class="card-header">
                                <div class="text-left m-auto float-left">
                                    <h3 class="content-header-title">{{$activeMenu}}</h3>
                                    <p>Upload the {{$activeMenu}} to display on application.</p>
                                </div>
                            </div>
                            <div class="card-content collapse show m-1">
                                <form action="{{route('users.store')}}" method="post"
                                      enctype="multipart/form-data" class="form row">
                                    @csrf


                                    <div class="form-group col-md-6">
                                        <label for="title">Country</label>
                                        <select list="region" name="country_name" class="form-control">
                                            <option value="none" selected disabled>Country List</option>
                                            @foreach($country as $user)
                                                <option value="{{ $user->title }}">{{ $user->title}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger">
                                                @error('region')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">City</label>
                                        <select list="region" name="city_name" class="form-control">
                                            <option value="none" selected disabled>CIty List</option>
                                            @foreach($city as $user)
                                                <option value="{{ $user->title }}">{{ $user->title}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger">
                                                @error('city_id')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">First Name</label>
                                        <input type="text" class="form-control" placeholder="First Name"
                                               name="first_name" title="First Name">
                                        <span class="text-danger">
                                            @error('first_name')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Last Name</label>
                                        <input type="text" class="form-control" placeholder="Last Name" name="last_name"
                                               title="Last Name">
                                        <span class="text-danger">
                                            @error('last_name')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Phone</label>
                                        <input type="text" class="form-control" placeholder="Last Name" name="phone"
                                               title="Phone">
                                        <span class="text-danger">
                                            @error('phone')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Email</label>
                                        <input type="email" class="form-control" placeholder="Email" name="email"
                                               title="Email">
                                        <span class="text-danger">
                                            @error('email')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Gender</label>
                                        <select list="role" name="gender" class="form-control">
                                            <option value="none" selected disabled>Gender List</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                        <span class="text-danger">
                                            @error('gender')
                                            {{ $message }}
                                            @enderror
                                        </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Remarks</label>
                                        <input type="text" class="form-control" placeholder="Remarks" name="remarks"
                                               title="Remarks">
                                        <span class="text-danger">
                                            @error('remarks')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">Role</label>
                                        <select list="role" name="role" class="form-control">
                                            <option value="none" selected disabled>Status List</option>
                                            <option value="master-admin">Master-Admin</option>
                                            <option value="admin">Admin</option>
                                            <option value="unit-manager">Unit-Manager</option>
                                            <option value="shift-manager">Shift-Manager</option>
                                        </select>
                                        <span class="text-danger">
                                            @error('gender')
                                            {{ $message }}
                                            @enderror
                                        </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="name">Image</label>
                                        <input type="file" class="form-control" placeholder="Image" name="image"
                                               title="Image">
                                        <span class="text-danger">
                                            @error('image')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class=" p-1 col-12 text-right text-white">
                                        <a href="{{url()->previous()}}" class="btn btn-warning  text-center">Cancel</a>
                                        <button type="submit" class="btn btn-primary  text-center">Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Basic Inputs end -->
        </div>
    </div>
@endsection
