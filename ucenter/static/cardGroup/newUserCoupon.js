var alertbox = require("common:widget/ui/alertbox/alertbox.js");

$(function(){
    var verify = "http://www.kaluli.com/api/verify";
    $(".coupon").on("tap",function() {
        $(".identify-img").attr("src", verify + "?t=" + (new Date().getTime()));
    });

    $(".cancel").on("tap",function(){
       $("input").val("");
    });

    $(".refresh").on("tap",function(){
        $(".identify-img").attr("src",verify+"?t="+ (new Date().getTime()));
    });

    $(".confirm").on("tap",function(){
        $.ajax({
           url:"http://www.kaluli.com/ucenter/bindCardGroup",
           type:"post",
           data:{code:$("input[name='identify']").val(),card:$("input[name='couponid']").val()},
           dataType: 'json',
           xhrFields: {
                withCredentials: true
           },
           crossDomain: true,
           success:function(res){
               var da = "string" == typeof res ? $.parseJSON(res) : res;
               if (da.status == 1 ){
                   alertbox().show({
                       title:"领取成功"
                   });
               }else{
                   alertbox().show({
                       title:da.info
                   });
               }
           }
        });
    });
});