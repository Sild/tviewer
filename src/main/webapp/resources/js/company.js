$(function () {

    $('form.update_company_form').dialog({
        height: 250,
        width: 400,
        autoOpen: false,
        buttons: [
            {
                autoOpen: false,
                text: "Сохранить",
                click: function () {
                    $('form.update_company_form').submit();
                    $(this).dialog("close");
                }
            },
            {
                text: "Отмена",
                click: function () {
                    var edit_div = $('form.edit_entity_form');
                    edit_div.find('#id').val("");
                    edit_div.find('#name').val("");
                    edit_div.find('#comment').val("");
                    edit_div.find('#color').val("");
                    $(this).dialog("close");
                }
            }

        ]
    });
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_entity_form').click(function () {
            $('form.update_company_form').dialog('open');
        });

        $('.edit_entity_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.company_id').text();
            var name = row.find('.company_name').text();
            var comment = row.find('.company_comment').text();
            var color = row.find('.company_color').css('background-color');
            var edit_div = $('form.update_company_form');
            edit_div.find('#id').val($.trim(id));
            edit_div.find('#name').val($.trim(name));
            edit_div.find('#comment').val($.trim(comment));
            edit_div.find('#color').val($.trim(color));
            edit_div.dialog('open');
        });

    }
});
