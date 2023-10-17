@if($status == 'pending')
    <button class="btn-warning btn-sm border-white">{{strtoupper($status)}}</button>
@elseif($status == 'approved')
    <button class="btn-success btn-sm border-white">{{strtoupper($status)}}</button>
@elseif($status == 'rejected')
    <button class="btn-danger btn-sm border-white">{{strtoupper($status)}}</button>
@endif
