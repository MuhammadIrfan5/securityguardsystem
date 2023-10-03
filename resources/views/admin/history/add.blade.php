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
                                    <form action="{{route('BannerCreate')}}" method="post"
                                          enctype="multipart/form-data" class="form row">
                                        @csrf
                                        <div class="form-group col-md-6">
                                            <label for="title">Title</label>
                                            <input type="text" class="form-control" placeholder="Banner's Title" name="title"  title="Banner's Title" value="{{old('title')}}" >
                                            <span class="text-danger">
                                            @error('title')
                                                {{ $message }}
                                            @enderror
                                            </span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name">Banner</label>
                                            <input type="file" class="form-control" placeholder="Banner" name="banner"  title="Banner" value="{{old('banner')}}" >
                                            <span class="text-danger">
                                            @error('banner')
                                                {{ $message }}
                                                @enderror
                                            </span>
                                        </div>
                                        <div class=" p-1 col-12 text-right text-white">
                                            <a href="{{url()->previous()}}" class="btn btn-warning  text-center">Cancel</a>
                                            <button type="submit" class="btn btn-primary  text-center">Add Banner</button>
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
