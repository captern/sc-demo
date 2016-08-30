/**
 * @file 整站通用JS
 * @author songxiaoqiang@hupu.com
 **/
(function(win,$){
    $.popupBg=function(callback){
        var ele = '<div class="blackBg"></div>';
        if($(".blackBg").length == 0){
            $("body").append(ele);
        };
        $('.blackBg').live("tap",function(){
            $(".blackBg").hide().remove();
            "function"  == typeof callback && callback();
        })
    };
    $.tips = function(string,type){
        var icon = type == "success" ? "\u2714" : "!";
        var str = '<div class="tips_layer" style="position:fixed;left:-100%;top:50%;border-radius:15px;background-color:#000000;visibility:hidden;opacity:0;transition:all 0.3s;z-index:-1;margin-top:-0.65rem;">\
                     <div style="width:1.5rem;height:1.5rem;border-radius:50%;background:none;border:2px solid #FFFFFF;text-align:center;color:#FFFFFF;line-height:1.5rem;margin:0.5rem auto 0;font-size:0.95rem;">'+icon+'</div>\
                     <div class="tips-text" style="padding:0.5rem 0.25rem;font-size:0.7rem;color:#FFFFFF;">'+string+'</div>\
                  </div>';
        if($(".tips_layer")){
            $(".tips_layer").remove();
        }
        $("body").append(str);
        var $tips_text = $(".tips-text"),
            $tips_layer = $(".tips_layer"),
            tips_top = Math.round($(".tips_layer").height()/2)*(-1),
            tips_left = Math.round($(".tips_layer").width()/2)*(-1);
        $tips_layer.css({
            "margin-left":tips_left+"px",
            "left":"50%",
            "opacity":0.8,
            "z-index":"999",
            "visibility":"visible"
        });
        setTimeout(function(){
            $tips_layer.remove();
        },2000);
    };

    /**
     * 底部 电脑版的点击按钮
     * author jiangyanghe
     */
    $("#go_www").click(function(a,e){
            if(!getCookie("redirectPc"))
            {
                setCookie('redirectPc',1,1);
                return true;
            }
    });
    function setCookie(name,value,days) {
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
            }
            else var expires = "";
            document.cookie = name+"="+value+expires+"; path=/;domain=kaluli.com";
        }
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
        }
        return "";
    }


    /**
     * 顶部新会员活动页
      * @type {{set: Function, get: Function, remove: Function}}
     * Cookie.set的第三个参数为cookie过期时间，单位是小时，从当前算起，过expHour个小时后失效。不传，或者传空、传零都默认为会话结束后失效。
     */
    var Cookie = {
        set: function(name,value,expHour,domain,path){
            document.cookie = name+"="+encodeURIComponent(value==undefined?"":value)+(expHour?"; expires="+new Date(new Date().getTime()+(expHour-0)*3600000).toUTCString():"")+"; domain="+(domain?domain:document.domain)+"; path="+(path?path:"/");
        },
        get: function(name){
            return document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"))==null ? null : decodeURIComponent(RegExp.$2);
        },
        remove: function(name){
            if(this.get(name) != null) this.set(name,null,-1);
        }
    };
    if(Cookie.get('test_1') != 1){
        $(".freebies-fixed").addClass("show");
    }


    console.log(Cookie.get('test_1'));

    $('.icon-close').click(function(){
        Cookie.set('test_1',1,72);
        $(".freebies-fixed").addClass("hide").removeClass("show");
    });


})(window,Zepto);