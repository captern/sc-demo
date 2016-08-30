var filter_nav={
    init:function(){
        this.bindFun();
    },
    bindFun:function(){
        var t = this;

        $(".check-btn").on("tap",function(){
            var url = $(this).data("url"),status = $(this).attr("data-check");
            if(status == "true"){
                url = url.substring(0,url.indexOf("aIds"));
            }
            window.location.href=url;
        });


        $(".filter li").on("tap",function(){
            var index = $(this).index();
            if($(this).attr("class") == "cur"){
                 $(".filter-grid").eq(index).removeClass('show');
                 $(".filter li").eq(index).removeClass('cur');
                 $(".blackBg").hide().remove();
                 return false
            }
            $(".filter li").removeClass('cur');            
            $(this).addClass('cur');
            $(".filter-grid").removeClass('show');
            $(".filter-grid").eq(index).addClass('show');
            t.popupFun();
        });
        $('.blackBg').live("tap",function(){
            $(".filter-grid").removeClass('show');
            $(".blackBg").hide().remove();
            $(".filter li").removeClass('cur');
        });

        $(".grid-wrap .left").find("a").on("tap",function(){
             var list = $(this).index();
             $(this).addClass('on');
             $(this).siblings().removeClass('on');
             if(list != 0){
                t.ajaxLoding($(this).html(),{type:false});
             }
        });

        if(list_scheme != ""){
            $(".grid-wrap .left a").each(function(){
                if($(this).html() == list_scheme){
                    $(this).addClass('on');
                    t.ajaxLoding($(this).html(),{type:"decode",code:list_type});
                }
            });
        }
    },
    ajaxLoding:function(html,type){
        $.post("/item/ajaxGetType",{scheme:html,aIds:list_aIDs},function(data){
            var allmod = '',x;
            for(x in data.data){
                if(type.type == "decode" && type.code == x){
                    allmod+='<a href="'+data.data[x]+'" class="on">'+x+'</a>';
                }else{
                    allmod+='<a href="'+data.data[x]+'">'+x+'</a>';
                }
                
                $(".grid-wrap .right-box .right").html(allmod).show();
            }
        },"json");
    },
    popupFun:function(){
        var ele = '<div class="blackBg"></div>';
        if($(".blackBg").length == 0){
            $("body").append(ele);
        }
    }
}

module.exports=filter_nav;