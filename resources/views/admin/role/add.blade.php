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
                                    <h3 class="content-header-title">Add {{$activeMenu}}</h3>
                                    <p>Add {{$activeMenu}} to display on application.</p>
                                </div>
                            </div>
                            <div class="card-content collapse show m-1">
                                <form action="{{route('role.update',$role->id)}}" method="post"
                                      enctype="multipart/form-data" class="form row">
                                    @method('PUT')
                                    @csrf
                                    <div class="form-group col-md-6">
                                        <label for="line_manager">State List</label>
                                        <select list="is_active" name="is_active" class="form-control">
                                            <option value="none" selected disabled>Status</option>
                                                <option value="0"{{$role->is_active==0? 'selected':''}}>In Active</option>
                                                <option value="1" {{$role->is_active==1? 'selected':''}}>Active</option>
                                        </select>
                                        <span class="text-danger">
                                                @error('state_id')
                                            {{ $message }}
                                            @enderror
                                            </span>
                                    </div>
                                    <div class=" p-1 col-12 text-right text-white">
                                        <a href="{{url()->previous()}}" class="btn btn-warning  text-center">Cancel</a>
                                        <button type="submit" class="btn btn-primary  text-center">Update</button>
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
