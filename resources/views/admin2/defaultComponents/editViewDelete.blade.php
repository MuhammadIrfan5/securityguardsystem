@if(!empty($viewUrl))
    <a href="{{$viewUrl}}" class="primary edit mr-1"><i class=" fa fa-eye"></i></a>
@endif
@if(!empty($editUrl))
    <a href="{{$editUrl}}" class="primary edit mr-1"><i class="fa fa-pencil"></i></a>
@endif
@if(!empty($deleteUrl))
    <a href="{{$deleteUrl}}" class="danger delete mr-1" onclick="return confirm('Are you want to delete..!')"  ><i class="fa fa-trash-o"></i></a>
@endif


