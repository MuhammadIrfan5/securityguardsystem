<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script>
    $(document).ready(function() {
        let table = new DataTable('#dataTable', {
            responsive: true,
            searchable: false,
            paging: true,
            autoWidth: true,
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('confirmation.call.tableData') }}",
                data: function(d) {
                    var unindexed_array = $("#filterForm").serializeArray();
                    $.map(unindexed_array, function(n, i) {
                        d[n['name']] = n['value'];
                    });
                    d.daterange = $('#daterange').val();
                }
            },
            columns: [
                { data: 'id' },
                { data: 'customer' },
                { data: 'guard_id' },
                { data: 'guard_name' },
                { data: 'timings' },
                { data: 'phone' },
                { data: 'gate_combo' },
                { data: 'post_phone' },
                { data: 'call_time' },
                {
                    data: 'status',
                    render: function(data, type, row) {
                        var checked = data ? 'checked' : '';
                        return `
                        <label class="switch">
                            <input type="checkbox" ${checked} data-id="${row.id}">
                            <span class="slider round"></span>
                        </label>
                    `;
                    }
                },
                { data: 'note' }
            ]
        });

        $("#filterForm").on("submit", function(e) {
            e.preventDefault();
            table.ajax.reload();
        });

        // Inline editing for call_time and note
        $('#dataTable tbody').on('click', 'td', function() {
            var cell = table.cell(this);
            var columnIndex = cell.index().column;

            if ($(this).find('input').length === 0 && (columnIndex === 8 || columnIndex === 10)) { // Only for call_time and note columns
                var cellData = cell.data();
                var inputType = columnIndex === 8 ? 'time' : 'text'; // Set input type based on the column
                $(this).html('<input type="' + inputType + '" value="' + cellData + '" />');
                $(this).find('input').focus();

                $(this).find('input').on('blur', function() {
                    var newValue = $(this).val();
                    cell.data(newValue).draw();

                    // Send the update to the server
                    var rowData = table.row($(this).parents('tr')).data();
                    var columnName = columnIndex === 8 ? 'call_time' : 'note';

                    $.ajax({
                        url: '/api/guards/' + rowData.id, // Update with your actual endpoint
                        type: 'PUT',
                        data: {
                            [columnName]: newValue,
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            console.log('Data updated successfully');
                        },
                        error: function() {
                            console.error('Update failed');
                        }
                    });
                });
            }
        });

        // Handle status toggle
        $('#dataTable tbody').on('change', 'input[type="checkbox"]', function() {
            var isChecked = $(this).is(':checked');
            var id = $(this).data('id');
            var newStatus = isChecked ? 1 : 0;

            $.ajax({
                url: '{{route('create.confirmation.record')}}' + id, // Update with your actual endpoint
                type: 'POST',
                data: {
                    status: newStatus,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    console.log('Status updated successfully');
                },
                error: function() {
                    console.error('Status update failed');
                }
            });
        });
    });
</script>
<script>
    $(function() {
        $('input[name="daterange"]').daterangepicker();
    });
</script>
