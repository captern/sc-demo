"use strict";
!(function(){
   $("#getCoupon").on("tap",function(){
       $(".mycoupon").hide()
       $(".form-coupon").show();
   });

    var tips = {
        insert:function(status,text){
            var dom = "<p id='coupon_tips' class="+status+">"+text+"</p>";
            $("body").append(dom);
        },
        show:function(status,text){
            var t = this;
            t.insert(status,text);
            setTimeout(function(){
                $("#coupon_tips").remove();
                if(status == "success") window.location.reload()
            },2000);
        }
    };

   $(".clear-btn").on("tap",function(){
       $("input[name=coupon_text]").val('');
   });

   $(".refresh-btn").on("tap",function(){
       var newdate = new Date().getTime();
        $(".validate_img").attr("src",$(".validate_img").attr("data-href")+"?t="+newdate);
   });

   $(".submit-btn").on("tap",function(){
       var url = "http://m.kaluli.com/ucenter/myCouponDuihuan";
       var datas = {
           account:$("input[name=coupon_text]").val(),
           code:$("input[name=validate_num]").val()
       };
       $.post(url,datas,function(res){
           var callback = $.parseJSON(res);
           if(callback.status == 0){
               tips.show("success","亲，恭喜你兑换成功");
           }else{
               tips.show("error",callback.msg);
           }
       });
   });


})();