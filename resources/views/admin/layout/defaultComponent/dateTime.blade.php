<ul>
    <li>{{$date}}</li>
    @foreach($list as $item)
        <li>{{$item->day. ' - '.($item->start_time).' to '.($item->end_time)}}</li>
    @endforeach
</ul>