@if(!empty($url))
    <img src="{{$url}}" style='border-radius:27px;height: 100px;width: 100px' class='img-thumbnail'/>
@else
    <img src="{{asset('app-assets/images/backgrounds/ice.png')}}" style='border-radius:27px;height: 100px;width: 100px' class='img-thumbnail'/>
@endif
