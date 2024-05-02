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
            "url": "{{route('time.sheet.tableData')}}",
            "data": function (d) {
                var unindexed_array = $("#filterForm").serializeArray();
                console.log('here',unindexed_array);
                $.map(unindexed_array, function (n, i) {
                    d[n['name']] = n['value'];
// console.log(n['value']);
                });
            }
        },

    });
    $("#filterForm").on("submit", function (e) {
        e.preventDefault();
        table.ajax.reload()
    })

</script>
