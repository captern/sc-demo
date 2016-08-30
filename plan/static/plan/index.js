/**
 * Created by jiangyanghe on 16/6/2.
 */
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
(function(){
    $(".lazy").lazyload();

    //点击回到顶部的元素

    //$(".goToTop").click(function() {
    //    //以1秒的间隔返回顶部
    //    scroll('0px', 500);
    //});
    ////goTop();//实现回到顶部元素的渐显与渐隐
    //function scroll(scrollTo, time) {
    //    var scrollFrom = parseInt(document.body.scrollTop),
    //        i = 0,
    //        runEvery = 5; // run every 5ms
    //    scrollTo = parseInt(scrollTo);
    //    time /= runEvery;
    //    var interval = setInterval(function () {
    //        i++;
    //        document.body.scrollTop = (scrollTo - scrollFrom) / time * i + scrollFrom;
    //        if (i >= time) {
    //            clearInterval(interval);
    //        }
    //    }, runEvery);
    //}
    //
    //$(window).scroll(function(){
    //    if ($(window).scrollTop() >= $(window).height() ) {
    //        $(".goToTop").show();
    //    }else{
    //        $(".goToTop").hide();
    //    }
    //});
})();