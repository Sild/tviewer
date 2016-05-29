$(function () {
    var $FORM = $('form.update_tender_form');
    var $COMPANY_FORM = $('form.update_company_form');
    var $DATEPICKER_FIELDS = $('.datepicker');

    setUpSelectAutocomplete();
    setUpDialog($FORM, "Добавление Тендера");
    setUpDialog($COMPANY_FORM, "Добавление Компании");
    setUpDatepicker($DATEPICKER_FIELDS);
    setUpHandlers();
    $('table').tablesorter();


    function setUpSelectAutocomplete() {
        $("#owner").combobox();
        $("#platform").combobox();
    }

    function setUpDialog($node, title) {
        $node.dialog({
            title: title,
            height: 750,
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
                        if(title == "Добавление Тендера") {
                            $node.submit();
                        } else {
                            var $popup = $(this);
                            jQuery.ajax({
                                url: $node.attr('action') + "/ajax",
                                method: 'POST',
                                data: $node.serialize()
                            }).done(function (response) {
                                $('#owner').prepend("<option value=" + response.id + ">" + response.name + "</<option>");
                                $("#owner").combobox();
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
                at: "top",
                of: window
            }
        });
    }

    function setUpDatepicker($fields) {
        $fields.datepicker({
            dateFormat: "dd-mm-yy"
        });
    }

    function setUpHandlers() {
        $('.add_company_fast').click(function () {
            $COMPANY_FORM.dialog('open');
        });

        $('#show_update_tender_form').click(function () {
            $FORM.dialog('open');
        });

        $('.edit_tender_btn').click(function () {
            var row = $(this).closest("tr");
            var id = $.trim(row.data('id'));
            var number = $.trim(row.find('.tender_number').text());
            var owner = $.trim(row.find('.tender_owner').text());
            var platform = $.trim(row.find('.tender_platform').text());
            var sum = $.trim(row.find('.tender_sum').text()).replace(/,/g, '');
            var currency = $.trim(row.find('.tender_currency').text());
            var state = $.trim(row.find('.tender_state').text());
            var direction = $.trim(row.find('.tender_direction').text());
            var nomenclature = $.trim(row.find('.tender_nomenclature').text());
            var comment = $.trim(row.find('.tender_comment').text());
            var tradeForm = $.trim(row.find('.tender_trade_form').text());
            var startDate = $.trim(row.find('.tender_start_date').text());
            var endDate = $.trim(row.find('.tender_end_date').text());
            var liked = row.find('.tender_liked>input[type="checkbox"]').prop('checked');
            fillForm($FORM, id, number, owner, platform, sum, currency, state, direction, nomenclature, comment, tradeForm, startDate, endDate, liked);
            $('#show_update_tender_form').trigger('click');
        });

    }


    var fillForm = function ($form, id, number, owner, platform, sum, currency, state, direction, nomenclature, comment, tradeForm, startDate, endDate, liked) {
        $form.find('#id').val(id);
        $form.find('#number').val(number);
        $form.find('#owner').labselect(owner);
        $form.find('.ui-autocomplete-input').focus().val(owner);
        $form.find('#platform').labselect(platform);
        $form.find('#sum').val(sum);
        $form.find('#currency').labselect(currency);
        $form.find('#state').labselect(state);
        $form.find('#direction').val(direction);
        $form.find('#nomenclature').val(nomenclature);
        $form.find('#comment').val(comment);
        $form.find('#tradeForm').val(tradeForm);
        $form.find('#startDate').val(startDate);
        $form.find('#endDate').val(endDate);
        $form.find('[name="liked"]').attr('checked', liked);
    };

    $.fn.labselect = function (str) {
        if (str === undefined) {
            return "";
        }
        var $selected = $('option', this).filter(function () {
            return $(this).text() == str;
        })[0];
        if ($selected === undefined) {
            return;
        }
        $selected.selected = true;

        return this;
    };

});


