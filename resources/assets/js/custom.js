
//Chart JS
$(document).ready(function () {
    demo.initDashboardPageCharts();
});

//Main Menu Icon JS
$(document).ready(function () {
    $(".btn_plus_f").click(function () {
        $(".add_menu_ul").show();
        $(".btn_plus_f").hide();
    });
});



//Tab JS
$(document).ready(function () {
    $('#material-tabs').each(function () {

        var $active, $content, $links = $(this).find('a');

        $active = $($links[0]);
        $active.addClass('active');

        $content = $($active[0].hash);

        $links.not($active).each(function () {
            $(this.hash).hide();
        });

        $(this).on('click', 'a', function (e) {

            $active.removeClass('active');
            $content.hide();

            $active = $(this);
            $content = $(this.hash);

            $active.addClass('active');
            $content.show();

            e.preventDefault();
        });
    });
});


//Training Listing Accordian JS
$(function () {
    $(".training_list_row").click(function () {
        // remove classes from all
        $(".training_list_row").removeClass("auto_height");
        // add class to the one we clicked
        $(this).addClass("auto_height");
    });

    $(".btn-view-quiz").click(function () {
        $("#quiz-tab").trigger("click");
    });
});


//Date Picker JS
$(function () {
    $("#datepicker").datepicker();
});


// Layout Select JS
$(function () {
    $(".list_layout li").click(function () {
        // remove classes from all
        $(".list_layout li").removeClass("list_selected");
        // add class to the one we clicked
        $(this).addClass("list_selected");
    });
});


// Tooltips JS
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
});


//Caption Edit Toggle JS
$(document).ready(function () {
    $("#btn_media_edit").click(function () {
        console.log('ok');
        $("#edit_box_holder").toggle(500);
    });
});


//Step Tab JS
$(document).ready(function () {
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);

        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".btn-primary-fnc").click(function (e) {

        var $active = $('.wizard .nav-wizard li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}



////For manage training
    // In your Javascript (external .js resource or <script> tag)
$(document).ready(function() {
    $('.single_select').select2();
});

$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
////For manage training


$(document).ready(function () {
    $(".add_account").click(function () {
        $(".manage_account_form").show();
        $(".account_list_fn").hide();
    });
});