var halfH = parseInt($(".popupWindow").height()) / 2;
var halfW = parseInt($(".popupWindow").width()) / 2;
var winH = parseInt($("body").height());
var href = "";

$(document).ready(function () {
    var closeBtn = '<a class="closeButton bg" href="#">Close</a>';
    $(".popupWindow").append(closeBtn);

    // popup functions
    $("a.closeButton").click(function () { popupClose(); });
    $("a.close").click(function () { popupClose(); });
    //$(".popupBg").click(function () { popupClose(); });

    function popUp() {
        $(".popupBg").fadeIn(300).css("min-height", winH);
    }

    function popupClose() {
        $(".popupBg").delay(300).fadeOut(300);
        $(href).fadeOut(300);
    }

    // POPUP BUTTON
    $(".popUp").click(function () {
        href = $(this).attr("href");
        var mt = $(href).height() / 2;
        var ml = $(href).width() / 2;

        $(".popupWindow").css('margin-top', -mt -10);
        $(".popupWindow").css('margin-left', -ml -10);
        $(href).delay(300).fadeIn(300);
        popUp();
    });
});