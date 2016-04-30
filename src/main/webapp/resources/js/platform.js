$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_platform_div').click(function () {
            $('#add_platform_div').toggle();
        });

        $('.edit_platform_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.platform_id').text();
            var name = row.find('.platform_name').text();
            var site = row.find('.platform_site').text();
            var edit_div = $('#edit_platform_div');
            edit_div.find('#id').val(id);
            edit_div.find('#name').val(name);
            edit_div.find('#site').val(site);
            edit_div.show();
        });

        $('#cancel_edit_platform_div').click(function () {
            var edit_div = $('#edit_platform_div');
            edit_div.find('#id').val("");
            edit_div.find('#name').val("");
            edit_div.find('#site').val("");
            edit_div.hide();
        });

    }
});
