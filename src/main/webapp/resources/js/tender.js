$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_tender_div').click(function () {
            $('#add_tender_div').toggle();
        });

        $('.edit_tender_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.tender_id').text();
            var name = row.find('.tender_name').text();
            var site = row.find('.tender_site').text();
            var edit_div = $('#edit_tender_div');
            edit_div.find('#id').val(id);
            edit_div.find('#name').val(name);
            edit_div.find('#site').val(site);
            edit_div.show();
        });

        $('#cancel_edit_tender_div').click(function () {
            var edit_div = $('#edit_tender_div');
            edit_div.find('#id').val("");
            edit_div.find('#name').val("");
            edit_div.find('#site').val("");
            edit_div.hide();
        });

    }
});
