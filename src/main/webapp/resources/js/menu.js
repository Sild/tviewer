$(function () {
    var title = $(document).find("title").text();
    var $selectedMenu = $('.navbar').find("li." + title);
    $selectedMenu.addClass("active");

    $('#pagination a').click(function(e) {
        e.preventDefault();
        var page = $(this).data('page');
        if (window.location.search.indexOf("page=") >= 0) {
            window.location.href = window.location.search.replace(/page=[^&]*/, "page=" + page);
        } else if (window.location.search.indexOf("?") >= 0 ){
            window.location.href = window.location.href + "&page=" + page
        } else {
            window.location.href = window.location.href + "?page=" + page
        }
    });
});