<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

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
                data: function (d) {
                    var unindexed_array = $("#filterForm").serializeArray();
                    $.map(unindexed_array, function (n, i) {
                        d[n['name']] = n['value'];
                    });
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
                { data: 'status' },
                { data: 'edit' },
            ]
        });

        // Inline editing
        $('#dataTable tbody').on('click', 'td', function () {
            var cell = table.cell(this);
            var cellData = cell.data();
            if ($(this).find('input').length === 0 && $(this).index() !== 0) { // Exclude the ID field
                $(this).html('<input type="text" value="' + cellData + '" />');
                $(this).find('input').focus();

                $(this).find('input').on('blur', function () {
                    var newValue = $(this).val();
                    cell.data(newValue).draw();

                    // Send the update to the server
                    var rowData = table.row($(this).parents('tr')).data();
                    var columnName = table.column(cell.index().column).header().textContent.toLowerCase().replace(/ /g, '_');

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

        // Handle edit button click
        $('#dataTable tbody').on('click', 'button.edit-btn', function () {
            var data = table.row($(this).parents('tr')).data();
            // Handle the edit action (e.g., open a modal for editing)
            console.log('Editing row:', data);
        });
    });
</script>