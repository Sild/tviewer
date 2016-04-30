$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_company_div').click(function () {
            $('#add_company_div').toggle();
        });

        $('.edit_company_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.company_id').text();
            var name = row.find('.company_name').text();
            var comment = row.find('.company_comment').text();
            var color = row.find('.company_color').css('background-color');
            var edit_div = $('#edit_company_div');
            edit_div.find('#id').val(id);
            edit_div.find('#name').val(name);
            edit_div.find('#comment').val(comment);
            edit_div.find('#color').val(color);
            edit_div.show();
        });

        $('#cancel_edit_company_div').click(function () {
            var edit_div = $('#edit_company_div');
            edit_div.find('#id').val("");
            edit_div.find('#name').val("");
            edit_div.find('#comment').val("");
            edit_div.find('#color').val("");
            edit_div.hide();
        });

    }
});
