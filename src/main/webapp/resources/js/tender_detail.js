$(function () {

    var $FORM = $('form.update_member_form');
    var $COMPANY_FORM = $('form.update_company_form')

    setUpSelectAutocomplete();
    setUpDialog($FORM, "Добавление Участника");
    setUpDialog($COMPANY_FORM, "Добавление Компании");
    setUpDatepicker($(".datepicker"));
    setUpHandlers();
    $('table').tablesorter();
    $('#offer-order').trigger('click');


    function setUpSelectAutocomplete() {
        $("#company").combobox();
    }

    function setUpDialog($node, title) {
        $node.dialog({
            title: title,
            height: 450,
            width: 520,
            autoOpen: false,
            close: function () {
                fillForm($node);
                $(this).dialog('close');
            },
            buttons: [
                {
                    text: "Сохранить",
                    click: function () {
                        if(title == "Добавление Участника") {
                            $node.submit();
                        } else {
                            var $popup = $(this);
                            jQuery.ajax({
                                url: $node.attr('action') + "/ajax",
                                method: 'POST',
                                data: $node.serialize()
                            }).done(function (response) {
                                $('#company').prepend("<option value=" + response.id + ">" + response.name + "</<option>");
                                $("#company").combobox();
                                fillForm($node);
                                $popup.dialog('close');
                            }).fail(function () {
                                alert("Fail to add company. Try from company form.");
                            });
                        }
                    }
                },
                {
                    text: "Отмена",
                    click: function () {
                        fillForm($node);
                        $(this).dialog('close');
                    }
                }
            ],
            position: {
                my: "center",
                at: "center",
                of: window
            }
        });
    }


    function setUpDatepicker($nodes) {
        $nodes.datepicker({
            dateFormat: "dd-mm-yy"
        });
    }

    function setUpHandlers() {
        $('.add_company_fast').click(function () {
            $COMPANY_FORM.dialog('open');
        });
        $('#show_update_member_form').click(function () {
            $FORM.dialog('open');
        });

        $('.edit_entity_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.data('id');
            var company = $.trim(row.find('.member_company').text());
            var allowed = row.find('.member_allowed>input[type="checkbox"]').prop('checked');
            var offer = $.trim(row.find('.member_offer').text()).replace(/,/g, '');
            var winner = row.find('.member_winner>input[type="checkbox"]').prop('checked');
            var comment = $.trim(row.find('.member_comment').text());
            var submitDate = $.trim(row.find('.member_submitDate').text());
            var withdrowDate = $.trim(row.find('.member_withdrowDate').text());
            fillForm($FORM, id, company, allowed, offer, winner, comment, submitDate, withdrowDate);
            $('#show_update_member_form').trigger('click');
        });


    }


    var fillForm = function ($form, id, company, allowed, offer, winner, comment, submitDate, withdrowDate) {
        $form.find('#id').val(id);
        $form.find('#company').labselect(company);
        $form.find('[name=allowed]').prop('checked', allowed);
        $form.find('.ui-autocomplete-input').focus().val(company);
        $form.find('#offer').val(offer);
        $form.find('[name=winner]').prop('checked', winner);
        $form.find('#comment').val(comment);
        $form.find('#submitDate').val(submitDate);
        $form.find('#withdrowDate').val(withdrowDate);
    };


    $.fn.labselect = function (str) {
        if (str === undefined) {
            return "";
        }
        $('option', this).filter(function () {
            return $(this).text() == str;
        })[0].selected = true;

        return this;
    };

});


