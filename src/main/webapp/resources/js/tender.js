$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_tender_div').click(function () {
            $('#add_tender_div').toggle();
        });

        $('.edit_tender_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.tender_id').text();
            var owner = row.find('.tender_owner').text();
            var platform = row.find('.tender_platform').text();
            var sum = row.find('.tender_sum').text();
            var state = row.find('.tender_state').text();
            var direction = row.find('.tender_direction').text();
            var nomenclature = row.find('.tender_nomenclature').text();
            var comment = row.find('.tender_comment').text();
            var trade_form = row.find('.tender_trade_form').text();
            var start_timestamp = row.find('.tender_start_timestamp').text();
            var end_timestamp = row.find('.tender_end_timestamp').text();
            var liked = row.find('.tender_liked>input[type="checkbox"]').prop('checked');
            console.log(liked);
            var edit_div = $('#edit_tender_div');
            edit_div.find('#id').val(id);
            edit_div.find('#owner').labselect(owner);
            edit_div.find('#platform').labselect(platform);
            edit_div.find('#sum').val(sum);
            edit_div.find('#state').labselect(state);
            edit_div.find('#direction').val(direction);
            edit_div.find('#nomenclature').val(nomenclature);
            edit_div.find('#comment').val(comment);
            edit_div.find('#tradeForm').val(trade_form);
            edit_div.find('#startTimestamp').val(start_timestamp);
            edit_div.find('#endTimestamp').val(end_timestamp);
            edit_div.find('[name=liked]').prop('checked', liked);
            edit_div.show();
        });

        $('#cancel_edit_tender_div').click(function () {
            var edit_div = $('#edit_tender_div');
            edit_div.find('#id').val("");
            edit_div.find('#owner').val("");
            edit_div.find('#platform').val("");
            edit_div.find('#sum').val("");
            edit_div.find('#state').val("");
            edit_div.find('#direction').val("");
            edit_div.find('#nomenclature').val("");
            edit_div.find('#comment').val("");
            edit_div.find('#trade_form').val("");
            edit_div.find('#start_timestamp').val("");
            edit_div.find('#end_timestamp').val("");
            edit_div.find('#liked').attr('checked', false);
            edit_div.hide();
        });

    }

    $.fn.labselect = function(str) {
        $('option', this).filter(function() {
            return $(this).text() == str;
        })[0].selected = true;

        return this;
    };

// Use it like this

});


