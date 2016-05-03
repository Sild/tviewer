$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_member_div').click(function () {
            $('#add_member_div').toggle();
        });

        $('.edit_member_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.member_id').text();
            var name = row.find('.member_name').text();
            var site = row.find('.member_site').text();
            var edit_div = $('#edit_member_div');
            edit_div.find('#id').val(id);
            edit_div.find('#name').val(name);
            edit_div.find('#site').val(site);
            edit_div.show();
        });

        $('#cancel_edit_member_div').click(function () {
            var edit_div = $('#edit_member_div');
            edit_div.find('#id').val("");
            edit_div.find('#name').val("");
            edit_div.find('#site').val("");
            edit_div.hide();
        });

    }
});
