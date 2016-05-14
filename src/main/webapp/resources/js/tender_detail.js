$(function () {

    var $FORM = $('form.update_member_form');

    setUpSelectAutocomplete();
    setUpDialog($FORM);
    setUpDatepicker($(".datepicker"));
    setUpHandlers();
    $('table').tablesorter();


    function setUpSelectAutocomplete() {
        $( "#company" ).combobox();
    }

    function setUpDialog($node) {
        $node.dialog({
            title: "Добавление Участника",
            height: 420,
            width: 420,
            autoOpen: false,
            close: function () {
                fillForm($node);
                $(this).dialog('close');
            },
            buttons: [{
                    text: "Сохранить",
                    click: function () {
                        $node.submit();
                    }
                },{
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


    function setUpDatepicker($nodes) {
        $nodes.datepicker({
            dateFormat: "dd-mm-yy"
        });
    }

    function setUpHandlers() {
        $('#show_update_member_form').click(function () {
            $FORM.dialog('open');
        });

        $('.edit_entity_btn').click(function () {
            var row = $(this).closest("tr");
            var id = row.data('id');
            var company = $.trim(row.find('.member_company').text());
            var offer = $.trim(row.find('.member_offer').text());
            var winner = row.find('.member_winner>input[type="checkbox"]').prop('checked');
            var comment = $.trim(row.find('.member_comment').text());
            var submitDate = $.trim(row.find('.member_submitDate').text());
            var withdrowDate = $.trim(row.find('.member_withdrowDate').text());
            fillForm($FORM, id, company, offer, winner, comment, submitDate, withdrowDate);
            $('#show_update_member_form').trigger('click');
        });


    }


    var fillForm = function ($form, id, company, offer, winner, comment, submitDate, withdrowDate) {
        $form.find('#id').val(id);
        console.log(withdrowDate);
        $form.find('#company').labselect(company);
        $form.find('#offer').val(offer);
        $form.find('[name=winner]').prop('checked', winner);
        $form.find('#comment').val(comment);
        $form.find('#submitDate').val(submitDate);
        $form.find('#withdrowDate').val(withdrowDate);
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


