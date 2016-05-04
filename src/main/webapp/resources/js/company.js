$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_entity_form').click(function () {
            $('form.add_entity_form').toggle();
        });

        $('.edit_entity_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.company_id').text();
            var name = row.find('.company_name').text();
            var comment = row.find('.company_comment').text();
            var color = row.find('.company_color').css('background-color');
            var edit_div = $('form.edit_entity_form');
            edit_div.find('#id').val(id);
            edit_div.find('#name').val(name);
            edit_div.find('#comment').val(comment);
            edit_div.find('#color').val(color);
            edit_div.show();
        });

        $('#cancel_edit_entity_form').click(function () {
            var edit_div = $('form.edit_entity_form');
            edit_div.find('#id').val("");
            edit_div.find('#name').val("");
            edit_div.find('#comment').val("");
            edit_div.find('#color').val("");
            edit_div.hide();
        });

    }
});
