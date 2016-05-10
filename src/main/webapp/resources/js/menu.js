$(function () {
    var title = $(document).find("title").text();
    var $selectedMenu = $('.navbar').find("li." + title);
    $selectedMenu.addClass("active");
});