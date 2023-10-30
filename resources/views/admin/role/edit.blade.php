@extends('admin.layout.main')

@section('content')
    <div class="pagetitle">
        <h1>Edit {{$title}}</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Home</a></li>
                <li class="breadcrumb-item">Tables</li>
                <li class="breadcrumb-item active">Data</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Edit {{$title}}</h5>
            @if (session('msg'))
                <div class="alert alert-success">
                    {{ session('msg') }}
                </div>
        @endif
        <!-- Floating Labels Form -->
            <form class="row g-3" method="post" action="{{route('role.update',$role->id)}}">
                @csrf
                @method('PUT')
                <div class="form-group col-md-6">
                    <label for="title">Status</label>
                    <select list="is_active" name="is_active" class="form-control">
                        <option value="0"{{$role->is_active==0? 'selected':''}}>In Active</option>
                        <option value="1" {{$role->is_active==1? 'selected':''}}>Active</option>
                    </select>
                    <span class="text-danger">
                @error('is_active')
                        {{ $message }}
                        @enderror
                </span>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form><!-- End floating Labels Form -->

        </div>
    </div>

@endsection
