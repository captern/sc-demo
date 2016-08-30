$(function(){
    $(".mycoupon .coupon-price").on('tap',function(){
        if($(this).hasClass("use")){
            return false
        }
        var id = $(".btn",this).attr("data-couponid"),
            $this = $(this);
        if(login_flag == 1){
            $.ajax({
                type: "get",
                url: "/api/receiveCoupon?id="+id,
                success: function (data) {
                    if(data.status ==0){
                        $(".icon-got").show();
                        $this.find(".btn").text("已领取");
                        $this.addClass("use");
                        $.tips("已成功领取优惠券，<br />请到我的卡路里查收!","success");
                    }else{
                        $.tips(data.msg);
                    }
                },
                dataType: "json"
            });
        }else{
            var loginurl = $(".unlogin").attr("href");
            window.location.href= loginurl;
        }

        return false
    });
});