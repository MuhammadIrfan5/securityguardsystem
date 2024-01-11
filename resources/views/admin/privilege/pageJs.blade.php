<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>

    let table = new DataTable('#dataTable', {
        responsive: true,
        searchable: false,
        paging: true,
        autoWidth: true,
        processing: true,
        serverSide: true,
        ajax: {
            "url": "{{route('privilege')}}",
            "data": function (d) {
                var unindexed_array = $("#filterForm").serializeArray();
                $.map(unindexed_array, function (n, i) {
                    d[n['name']] = n['value'];
// console.log(n['value']);
                });
            }
        },

    });

    function handleCheck(cb) {
        if ($(cb).hasClass("check-all")) {
            if ($(cb).prop("checked")) {
                $(".checkbox").prop("checked", true);
            } else {
                $(".checkbox").prop("checked", false);
            }
            $('#export').css('opacity', '1');
        } else {
            if ($(cb).prop("checked") && $(".checkbox:checked").length == ($(".checkbox").length - 1)) {
                $(".checkbox").prop("checked", true);
            } else {
                $(".check-all").prop("checked", false);
            }
            $('#export').css('opacity', '1');
        }
    }
</script>
