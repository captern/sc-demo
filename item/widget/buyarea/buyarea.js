var sku = require("item:widget/buyarea/initsku.js");
var iscroll = require("common:widget/ui/iscroll/iscroll.js");
var changenum = require("item:widget/buyarea/changenum.js");
var submit = require("item:widget/buyarea/submit.js");
function buyarea(){
    this.defaults={
        submtBtn:".submit",
        cartBtn:".catBtn",
        skuClass:".skucontent"
    }
}   
buyarea.prototype={
    init:function(skujson){
        this.bindFun();    
        var detailsku = new sku(skujson);
            detailsku.init();
        var detailScroll = new iscroll('#scrollview', {
            click:true,
            scrollbars: true,
            mouseWheel: true
        });      
        var detailChangenum = new changenum();
        detailChangenum.init();
        var detailsubmit = new submit();
        detailsubmit.init();
    },
    bindFun:function(){
        var t=this;
        // $(t.defaults.submtBtn).click(function(){
        //     if(login_flag != 1){
        //         var loginurl = $(".unlogin").attr("href");
        //         window.location.href= loginurl;
        //         return false
        //     }
        //     t.showSku();
        //     $(t.defaults.skuClass).attr("data-type","submit");
        // });
        $(t.defaults.cartBtn).click(function(){
            if(login_flag != 1){
                var loginurl = $(".unlogin").attr("href");
                window.location.href= loginurl;
                return false
            }
            t.showSku();
            $(t.defaults.skuClass).attr("data-type","cartBtn");
        }); 
        $(t.defaults.submtBtn).click(function(){
            if(login_flag != 1){
                $("#login-mask").addClass('maskFadeIn').show();
                $("#loginAlert").show();  

                $("#picYzm").attr("src","http://www.kaluli.com/api/verify");
            }else{
                t.showSku();
                $(t.defaults.skuClass).attr("data-type","submit"); 
            }
        });  
         $("#link-login").on('click', function(){
              var loginurl = $(".unlogin").attr("href");
              window.location.href= loginurl;
              return false;
        });
        // 发送验证码
        $("#sendYzm").on('click', function(){
            var tel = $("#loginAlert .logintel").val();
            var verify = $("#imgyzm").val();
            var reg = /^1[1-9]\d{9}$/;
            if(reg.test(tel)){
                // 发送验证码
                 $.ajax({
                    type: 'POST',
                    url: "http://www.kaluli.com/api/getPassportIdentifyingCode",
                    data: {mobile:tel,verify:verify},
                    dataType: 'json',
                    success: function(data) {
                        if(data.status == 0){
                            var _t2 = new Date();
                            _t2 = Math.ceil(Date.parse(_t2)/1000);
                            countDownReg(_t2);
                        }else{
                           $.tips(data.msg);
                        }
                    },
                    error: function() {
                        $.tips("发送失败");
                    },
                    crossDomain: true,
                    xhrFields: {
                        withCredentials: true
                    }
                });
            }else{
                $.tips("请输入正确的手机号码");
            }
        });
        function countDownReg(t2) {
            var _t = new Date();
            _t = Math.ceil(Date.parse(_t) / 1000);
            _t = 60 - (_t-t2);

            if (_t > 0) {
                $('#sendYzm').val("发送中" + _t +"..").css({"pointer-events": "none"});
                setTimeout(function() {
                    countDownReg(t2);
                }, 1000);
            } else {
                $('#sendYzm').val("重新发送").css({"pointer-events": "auto"});
            }
        }
        // 立刻购买
        $("#btn_lkBuy").on('click', function(){
            var tel = $("#loginAlert .logintel").val();
            var captcha = $("#loginyzm").val();
            if(captcha && tel){
                // 马上领取
                $.ajax({
                    type: 'POST',
                    url: "http://www.kaluli.com/api/getPassportUserInfo",
                    data: {
                        mobile:tel,
                        authcode:captcha
                    },
                    dataType: 'json',
                    success: function(data) {
                        if(data.status == 0){
                            $("#login-mask").removeClass('maskFadeIn').hide();
                            $("#loginAlert").hide();
                            loginflag = true;

                            t.showSku();
                            $(t.defaults.skuClass).attr("data-type","submit");
                        }else{
                            $.tips(data.msg);
                        }
                    },
                    error: function() {
                        $.tips("发送失败，请稍候重试");
                    },
                    crossDomain: true,
                    xhrFields: {
                        withCredentials: true
                    }
                });
            }else{
                 $.tips("请填写手机号、验证码");
            }
        });
        $("#login-mask").on('click', function(){
            $("#login-mask").removeClass('maskFadeIn').hide();
            $("#loginAlert").hide();
        });       
    },
    showSku:function(){
        var t=this;
        $.popupBg(function(){
            $(t.defaults.skuClass).removeClass('show');
        });
        $(t.defaults.skuClass).addClass('show');
    }
}
module.exports=function(){
    return new buyarea()
}