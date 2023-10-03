@extends('admin.layout.app')
@section('page-css')
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <style>
        th,td {
            padding: 5px !important;
        }
    </style>
    {{--    <style>--}}
    {{--        table,td,th{--}}
    {{--            border: none !important;--}}
    {{--        }--}}
    {{--        th{--}}
    {{--            padding-left:10px !important; ;--}}
    {{--            padding-right:10px !important; ;--}}
    {{--        }--}}
    {{--        td{--}}
    {{--            border-top: 1px dashed !important;--}}
    {{--            padding: 5px !important;--}}
    {{--        }--}}
    {{--        input[type=checkbox]{--}}
    {{--            width: 20px;--}}
    {{--            height: 20px;--}}
    {{--            margin: auto !important;--}}
    {{--        }--}}
    {{--        .width-auto{--}}
    {{--            width: auto;--}}
    {{--        }--}}
    {{--        .btn-filter{--}}
    {{--            color: #1E1E2D;--}}
    {{--            background: rgba(156, 156, 156, 0.11);;--}}
    {{--        }--}}
    {{--        .btn-filter:hover{--}}
    {{--            /*color: #1E1E2D;*/--}}
    {{--            color: #00B5B8;--}}
    {{--        }--}}
    {{--    </style>--}}
@endsection
@section('section')
    <div class="content-wrapper">
        <div class="content-body">
            <section id="dom">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="border-radius:10px;">
                            <div class="card-header" style="border-radius: 10px">
                                <div class="text-left m-auto float-left">
                                    <h3 class="content-header-title">{{$activeMenu}}</h3>
                                    <p>List of all {{$activeMenu}}.</p>
                                </div>
                                <div class="text-right">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary btn-min-width dropdown-toggle"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Export
                                        </button>
                                        <div class="dropdown-menu" x-placement="bottom-start"
                                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
                                            {{--                                            <a class="dropdown-item" href="#">CSV</a>--}}
                                            <a class="dropdown-item" href="{{ route('BannersPDF') }}">PDF</a>
                                        </div>
                                    </div>
{{--                                    <a class="btn btn-primary text-white" href="{{ route('BannersPDF') }}">Export</a>--}}
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="table" class="table table-striped table-bordered ajax-sourced dataTable" width="100%">
                                    <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" onclick="handleCheck(this)"
                                                   class="checkbox check-all">
                                        </th>

                                        <th>country_name</th>
                                        <th>city_name</th>
                                        <th>first_name</th>
                                        <th>last_name</th>
                                        <th>phone</th>
                                        <th>email</th>
                                        <th>gender</th>
                                        <th>image</th>
                                        <th>status</th>
                                        <th>remarks</th>
                                        <th>role</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
@section('page-js')
    <script>
        let filterData = {
            "name": "saqib waheed"
        };
        let table = new DataTable('#table', {
            responsive: true,
            searching: false,
            searchable: false,
            lengthChange: true,
            ordering: false,
            autoWidth: true,
            processing: true,
            serverSide: true,
            ajax: {
                "url": "{{ route('user.tableData') }}",
                "data": function(d) {
                    var unindexed_array = $("#filterForm").serializeArray();
                    $.map(unindexed_array, function(n, i) {
                        d[n['name']] = n['value'];
                    });4
                }
            },
            columnDefs: [{
                "targets": 0, // your case first column
                "className": "text-center width-auto",
                "width": "20px"
            }]
        });

        $("#export").click(function( d ){
            var unindexed_array = $("#filterForm").serializeArray();
            var unindexedArray={}
            $.map(unindexed_array, function(n, i){
                unindexedArray [n['name']] = n['value'];
            });
            console.log(unindexedArray);
            document.location.href = "{{url('pdf-targets/')}}"+"/"+JSON.stringify(unindexedArray);
        });

        // Check Boxes
        function handleCheck(cb) {
            if ($(cb).hasClass("check-all")) {
                if ($(cb).prop("checked")) {
                    $(".checkbox").prop("checked", true);
                } else {
                    $(".checkbox").prop("checked", false);
                }
            } else {
                if ($(cb).prop("checked") && $(".checkbox:checked").length == ($(".checkbox").length - 1)) {
                    $(".checkbox").prop("checked", true);
                } else {
                    $(".check-all").prop("checked", false);
                }
            }
        }
        /*Filter form*/
        $("#filterForm").on("submit", function(e) {
            e.preventDefault();
            table.ajax.reload(function() {
                $("#myModal").modal("hide")
            }, true)
        })

        /*Reset Filter*/
        $("#filter-reset").click(function() {
            $("#filterForm").trigger("reset");
            $('.select2-add, .select2-filter').val("0").trigger("change")
            table.ajax.reload(function() {
                $("#myModal").modal("hide")
            }, true)
        });
        $("#reload").click(function() {
            table.ajax.reload()
        });

        //Select 2
        $('.select2-filter').select2({
            dropdownParent: $('#myModal')
        });
        $('.select2-add').select2({
            dropdownParent: $('#addTarget')
        });

        // Date Range
        $(function() {

            $('input[name="datefilter"]').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('MM-DD-YYYY') + ' - ' + picker.endDate.format(
                    'MM-DD-YYYY'));
                $('.start-date').val(picker.startDate.format('YYYY-MM-DD'))
                $('.end-date').val(picker.endDate.format('YYYY-MM-DD'))
            });

            $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });
        });
    </script>
    @include('admin.layout.toastrScript');
@endsection
