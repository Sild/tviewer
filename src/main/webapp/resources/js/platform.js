$(function () {



    setUpDialog('form.update_platform_form');

    setUpHandlers();

    $('table').tablesorter();



    function setUpDialog(stringSelector) {
        $(stringSelector).dialog({
            title: "Добавление Площадки",
            height: 250,
            width: 400,
            autoOpen: false,
            close: function() {
                var edit_div = $(stringSelector);
                edit_div.find('#id').val("");
                edit_div.find('#name').val("");
                edit_div.find('#site').val("");
                $(this).dialog("close");
            },
            buttons: [
                {
                    text: "Сохранить",
                    click: function () {
                        $(stringSelector).submit();
                    }
                },
                {
                    text: "Отмена",
                    click: function() {
                        var edit_div = $(stringSelector);
                        edit_div.find('#id').val("");
                        edit_div.find('#name').val("");
                        edit_div.find('#site').val("");
                        edit_div.dialog("close");
                    }
                }

            ],
            position: {
                my: "center",
                at: "top",
                of: window
            }
        });

    }

    function setUpHandlers() {
        $('#show_update_platform_form').click(function () {
            $('form.update_platform_form').dialog('open');
        });

        $('.edit_platform_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.data('id');
            var name = row.find('.platform_name').text();
            var comment = row.find('.platform_site').text();
            var edit_div = $('form.update_platform_form');
            edit_div.find('#id').val($.trim(id));
            edit_div.find('#name').val($.trim(name));
            edit_div.find('#site').val($.trim(comment));
            $('#show_update_platform_form').trigger('click');
        });

    }
});
