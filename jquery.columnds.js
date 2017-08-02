//<![CDATA[
$(window).load(function() {
    $(window).on('resize', function() {
        $('#container').height($('.box').last().position().top + $('.box').last().outerHeight());
    }).resize();
});
//]]>
