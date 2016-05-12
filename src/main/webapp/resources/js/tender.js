$(function () {
    var $FORM = $('form.update_tender_form');
    var $DATEPICKER_FIELDS = $('.datepicker');


    setUpDialog($FORM);
    setUpDatepicker($DATEPICKER_FIELDS);
    setUpHandlers();
    $('table').tablesorter();


    function setUpDialog($node) {
        $node.dialog({
            height: 650,
            width: 420,
            autoOpen: false,
            close: function () {
                fillForm($node);
                $(this).dialog('close');
            },
            buttons: [
                {
                    text: "Сохранить",
                    click: function () {
                        $node.submit();
                    }
                },
                {
                    text: "Отмена",
                    click: function () {
                        fillForm($node);
                        $(this).dialog('close');
                    }
                }

            ]
        });
    }

    function setUpDatepicker($fields) {
        $fields.datepicker({
            dateFormat: "dd-mm-yy"
        });
    }

    function setUpHandlers() {
        $('#show_update_tender_form').click(function () {
            $FORM.dialog('open');
        });

        $('.edit_tender_btn').click(function () {
            var row = $(this).closest("tr");
            var id = $.trim(row.find('.tender_id').text());
            var number = $.trim(row.find('.tender_number').text());
            var owner = $.trim(row.find('.tender_owner').text());
            var platform = $.trim(row.find('.tender_platform').text());
            var sum = $.trim(row.find('.tender_sum').text());
            var state = $.trim(row.find('.tender_state').text());
            var direction = $.trim(row.find('.tender_direction').text());
            var nomenclature = $.trim(row.find('.tender_nomenclature').text());
            var comment = $.trim(row.find('.tender_comment').text());
            var tradeForm = $.trim(row.find('.tender_trade_form').text());
            var startDate = $.trim(row.find('.tender_start_date').text());
            var endDate = $.trim(row.find('.tender_end_date').text());
            var liked = row.find('.tender_liked>input[type="checkbox"]').prop('checked');
            console.log(liked);
            fillForm($FORM, id, number, owner, platform, sum, state, direction, nomenclature, comment, tradeForm, startDate, endDate, liked);
            $('#show_update_tender_form').trigger('click');
        });

    }


    var fillForm = function ($form, id, number, owner, platform, sum, state, direction, nomenclature, comment, tradeForm, startDate, endDate, liked) {
        $form.find('#id').val(id);
        $form.find('#number').val(number);
        $form.find('#owner').labselect(owner);
        $form.find('#platform').labselect(platform);
        $form.find('#sum').val(sum);
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
        if(str === undefined) {
            return "";
        }
        $('option', this).filter(function () {
            return $(this).text() == str;
        })[0].selected = true;

        return this;
    };

});


