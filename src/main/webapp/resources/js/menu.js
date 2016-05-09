$(function () {
    var title = $(document).find("title").text();
    console.log(title);
    var $selectedMenu = $('.navbar').find("li." + title);
    $selectedMenu.addClass("active");
});