var alertbox = require("common:widget/ui/alertbox/alertbox.js");

$(function(){
    var jumpUrl = window.location.href,
        loginUrl = $(".coupon").attr("data-loginurl")+'&jumpurl=' + jumpUrl,
        hasgetCard = false;
    if(!hasgetCard && $(".coupon").attr("data-received") == 1 ){
        $(".receive").hide();
        $(".hasreceived").show();
        hasgetCard = true;
    }
   $(".coupon").click(function(){
       if(login_flag != 1){
           window.location.href= loginUrl;
       }
       if(!hasgetCard && $(this).attr("data-received") == 1 ){
           $(".receive").hide();
           $(".hasreceived").show();
           hasgetCard = true;
           return false
       }
       !hasgetCard && $.ajax({
           type:"get",
           url:"http://m.kaluli.com/api/getNewUserCard",
           data:{card_group_number:$(".coupon").attr("data-cardnumber")},
           success:function(da){
               var res = typeof da == "string" ? $.parseJSON(da) : da;
               if(res.status == 1){
                   $(".receive").hide();
                   $(".hasreceived").show();
                   hasgetCard = true;
               }
               alertbox().show({
                   title:res.msg
               });
           }
       })
   });
});