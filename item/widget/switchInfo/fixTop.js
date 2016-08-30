var fixTop = {
    defaults:{
        suspensioner:".product-content",
        fixed:".swtich-top",
        liclick:false
    }, 
    init:function(){
        var t = this;
        t.scrollhandle();
        $(window).scroll(function(){
            t.scrollhandle();
        });

        $(t.defaults.fixed).find("li").click(function(){
           $(".swtich-top li").removeClass("on");
            $(this).addClass("on");
            // console.log($(this).index());
            fixTop.liclick= true;
        });
    },
    scrollhandle:function(){
        var t = this,
            st = $(window).scrollTop(),
            suspension = $(t.defaults.suspensioner).offset().top,
            aboutus = $("#aboutus").offset().top,
            qa = $("#qa").offset().top;

        if(st >= suspension-20){
            $(t.defaults.fixed).css({"position":"fixed","top":"0"});
            $(".pro-detail").css({"padding-top":"2rem"});  
            
            if(!fixTop.liclick){
                if(st>= aboutus && st< qa-300){
                    $(".swtich-top li").removeClass("on");
                    $(".swtich-top li").eq(1).addClass("on");
                }
                if(st>= qa-300){
                    $(".swtich-top li").removeClass("on");
                    $(".swtich-top li").eq(2).addClass("on");
                }
                if(st < aboutus-300){
                    $(".swtich-top li").removeClass("on");
                    $(".swtich-top li").eq(0).addClass("on");
                }
            }
            fixTop.liclick= false;
        }else{
            $(t.defaults.fixed).css({"position":"relative","top":"0px"});
            $(".pro-detail").css({"padding-top":"0px"});  
        }        
    }
};
module.exports=fixTop;