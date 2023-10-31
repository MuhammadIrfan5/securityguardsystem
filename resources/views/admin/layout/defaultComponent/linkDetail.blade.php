@if($is_location==1)
    <a href="{{$url}}">{{ $username }}</a>
@elseif($is_designer==0)
    <a href="{{route('project-holder.show', $Id)}}">{{ $username }}</a>
@else
    <a href="{{ url('/panel/users/sf_guard_user/'.$Id) }}">{{ $username }}</a>
@endif

