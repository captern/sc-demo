
function goToTop(){
    this.defaults={
        backBtn:".goToTop"
    }
}
goToTop.prototype = {
    scroll:function(scrollTo, time){
        var scrollFrom = parseInt(document.body.scrollTop),
            i = 0,
            runEvery = 5; // run every 5ms
        scrollTo = parseInt(scrollTo);
        time /= runEvery;
        var interval = setInterval(function () {
            i++;
            document.body.scrollTop = (scrollTo - scrollFrom) / time * i + scrollFrom;
            if (i >= time) {
                clearInterval(interval);
            }
        }, runEvery);
    },
    display:function(){
        $(window).scroll(function(){
            if ($(window).scrollTop() >= $(window).height() ) {
                $(".goToTop").show();
            }else{
                $(".goToTop").hide();
            }
        });
    }
}
module.exports=function(){
    return new goToTop()
}