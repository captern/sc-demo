(function(win,$){

    var scrolltopNav = function(){
        var st = $(window).scrollTop(),
            ot = $(".grid-1").offset().top;
        if(st >= ot){
            $(".menu").css({"position":"fixed","top":'0px'});
        }else{
            $(".menu").css({"position":"relative"});
        }

        $(".menu li").on("tap",function(){
            var name = $(this).attr("data-href"),
                h = $(this).height(),
                st = Math.round($("#"+name).offset().top-h);
            $(window).scrollTop(st);
        });

    };

    $(function(){
        scrolltopNav();
        $(window).scroll(function(){
            scrolltopNav();
        });
    });
    
})(window,Zepto);