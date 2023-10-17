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
                                <form action="{{route('state.store')}}" method="post"
                                      enctype="multipart/form-data" class="form row">
                                    @csrf
                                    <div class="form-group col-md-6">
                                        <label for="line_manager">Country List</label>
                                        <select list="country_id" name="country_id" class="form-control">
                                            <option value="none" selected disabled>Country List</option>
                                            @foreach($country as $user)
                                                <option value="{{ $user->id }}">{{ $user->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger">
                                                @error('country_id')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="title">State Name</label>
                                        <input type="text" class="form-control" placeholder="Name" name="name"
                                               title="Title">
                                        <span class="text-danger">
                                            @error('name')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>


                                    {{--                                    <div class="form-group col-md-6">--}}
                                    {{--                                        <label for="title">Region</label>--}}
                                    {{--                                        <select list="region" name="region" class="form-control">--}}
                                    {{--                                            <option value="none" selected disabled>Country List</option>--}}
                                    {{--                                            @foreach($region as $user)--}}
                                    {{--                                                <option value="{{ $user->id }}">{{ $user->title}}</option>--}}
                                    {{--                                            @endforeach--}}
                                    {{--                                        </select>--}}
                                    {{--                                        <span class="text-danger">--}}
                                    {{--                                                @error('region')--}}
                                    {{--                                            {{ $message }}--}}
                                    {{--                                            @enderror--}}
                                    {{--                                            </span>--}}
                                    {{--                                    </div>--}}
                                    <div class=" p-1 col-12 text-right text-white">
                                        <a href="{{url()->previous()}}" class="btn btn-warning  text-center">Cancel</a>
                                        <button type="submit" class="btn btn-primary  text-center">Add State</button>
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
