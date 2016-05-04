$(function () {
    setUpHandlers();

    function setUpHandlers() {
        $('#show_add_entity_form').click(function () {
            $('form.add_entity_form').toggle();
        });

        $('.edit_entity_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.find('.member_id').text();
            var company = row.find('.member_company').text();
            var offer = row.find('.member_offer').text();
            var winner = row.find('.member_winner>input[type="checkbox"]').prop('checked');
            var comment = row.find('.member_comment').text();
            var submit_time = row.find('.member_submit_timestamp').text();
            var withdrow_time = row.find('.withdrow').text();
            var edit_div = $('form.edit_entity_form');
            console.log(edit_div);
            edit_div.find('#id').val(id);
            edit_div.find('#company').labselect(company);
            edit_div.find('#offer').val(offer);
            edit_div.find('[name=winner]').prop('checked', winner);
            edit_div.find('#comment').val(comment);
            edit_div.find('#submitTimestamp').val(submit_time);
            edit_div.find('#withdrowTimestamp').val(withdrow_time);
            edit_div.show();
        });

        $('#cancel_edit_entity_form').click(function () {
            var edit_div = $('form.edit_entity_form');
            edit_div.find('#company').val("");
            edit_div.find('#offer').val("");
            edit_div.find('[name=winner]').prop('checked', false);
            edit_div.find('#comment').val("");
            edit_div.find('#submitTimestamp').val("");
            edit_div.find('#withdrowTimestamp').val("");
            edit_div.hide();
        });

        $(".datepicker").each(function () {
            $(this).removeAttr("id");
            $(this).datepicker({
                dateFormat: "dd-mm-yy"
            });
        });

    }

    $.fn.labselect = function (str) {
        $('option', this).filter(function () {
            return $(this).text() == str;
        })[0].selected = true;

        return this;
    };

});


