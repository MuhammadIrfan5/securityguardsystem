<script>
    $(document).ready(function(){
        // Disable input fields by default
        $('.time-input').prop('disabled', true);

        $('.day-checkbox').change(function(){
            var isChecked = $(this).is(':checked');
            var $timeInputs = $(this).closest('tr').find('.time-input');

            // If the checkbox is checked or there's data for Monday, enable the input fields
            if (isChecked || ($('.day-checkbox[value="Monday"]').is(':checked') && $(this).val() === 'Monday')) {
                $timeInputs.prop('disabled', false);
            } else {
                $timeInputs.prop('disabled', true);
            }

            // If unchecked, clear the input fields
            if (!isChecked) {
                $timeInputs.val('');
            }
        }).trigger('change'); // Trigger change event initially to set initial state
    });

</script>