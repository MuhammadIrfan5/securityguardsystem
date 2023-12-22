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
            <form class="row g-3" method="post" action="{{route('confirmation-call.update',$data->id)}}">
                @csrf
                @method('PUT')

                <div class="col-md-6">
                    <div class="form-floating">
                        <select name="is_approved" class="form-select"
                                id="is_approved">
                            <option {{$data->is_approved==1? 'selected':''}} value="1">Approved</option>
                            <option {{$data->is_approved==0? 'selected':''}} value="0">Not Approved</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <textarea class="form-control" style="height: 100px" name="notes">{{$data->notes}}</textarea>
                        <label for="floatingphone_one">Notes(Optional)</label>
                    </div>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form><!-- End floating Labels Form -->

        </div>
    </div>

@endsection
