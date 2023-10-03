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
                                    <h3 class="content-header-title">Add Country</h3>
                                    <p>Add Country to display on application.</p>
                                </div>
                            </div>
                            <div class="card-content collapse show m-1">
                                <form action="{{route('createCountry')}}" method="post"
                                      enctype="multipart/form-data" class="form row">
                                    @csrf
                                    <div class="form-group col-md-6">
                                        <label for="title">Name</label>
                                        <input type="text" class="form-control" placeholder="Country Name" name="name"  title="Banner's Title" value="{{old('title')}}" >
                                        <span class="text-danger">
                                            @error('title')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="title">Alpha-3</label>
                                        <input type="text" class="form-control" placeholder="alpha-3" name="alpha-3"  title="alpha-3" value="{{old('alpha-3')}}" >
                                        <span class="text-danger">
                                            @error('alpha-3')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>
                                    <div class=" p-1 col-12 text-right text-white">
                                        <a href="{{url()->previous()}}" class="btn btn-warning  text-center">Cancel</a>
                                        <button type="submit" class="btn btn-primary  text-center">Add Country</button>
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
