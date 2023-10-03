

@if(!empty($id))
    <a href="{{route('products.edit',$id)}}" class="primary edit mr-1"><i class="fa fa-pencil"></i></a>
    <a href="{{route('products.destroy',$id)}}" class="danger delete mr-1" onclick="return confirm('Are you want to delete..!')"  ><i class="fa fa-trash-o"></i></a>
@endif


