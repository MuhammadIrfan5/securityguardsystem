<html>
<head>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">

    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <style>
        td{
            padding: 10%;
        }
        .btn{
            height: auto;
            width: auto;
            padding: 5px 10px;
            color: white;
            font-size: 10px;
            border: 0;
            border-radius: 3px;
            margin: 10px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .success{
            background-color: #16D39A;
        }
        .danger{
            background-color: #FF7588;
        }
    </style>
</head>
<body>

<table class="datatbl table table-striped table-bordered ajax-sourced dataTable" style="width: 100%">
    <caption><h1>SOS Banners</h1> <h4>{{\Carbon\Carbon::now()->format('d.F.Y H:i')}}</h4></caption>
    <thead>
    <tr style="background-color: #fcf1f1; align-content: center">
        <th>S.no</th>
        <th>Name</th>
        <th>Image</th>
        <th>Is Allowed</th>
        <th>Date</th>
    </tr>
    </thead>
    <tbody>
    @foreach($banners as $key=>$table)
        <tr>
            <td>
                {{$key+=1}}
            </td>
            <td>
                <span>
                    {{ $table->name }}
                </span>
            </td>
            <td>
                <img src="{{$table->image ?? 'https://cdn-icons-png.flaticon.com/512/456/456212.png'}}"
                     style="border-radius:2px;height: 150px;"/>
            </td>
            <td>
                @if($table->is_allowed == 1)
                    <span class="btn success">Allowed</span>
                @else
                    <span class="btn danger">Not Allowed</span>
                @endif
            </td>
            <td>
                {{$table->created_at->format('M d,Y')}}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
<script>
    $(document).ready(function () {
        $('.datatbl').DataTable({
            responsive: true,
            searching: false,
            searchable: false,
            lengthChange: false,
            ordering: false,
            autoWidth: true,
            processing: false,
            serverSide: false,
            paging: false,
            info: false
        })
    });
</script>
</body>
</html>


