<div class="coupon-area">
        {%assign var="count" value=count($data) %}
        {%if ($count <= 3)%}
            <ul class="total-{%$count%} fn-clearfix">
                {%foreach $data as $item %}
                <li  class="fn-clearfix coupon-detail {%if (isset($item.received) && $item.received == 1)%}getoff{%/if%}">
                    <div class="text-line coupon-price">
                        <span>¥</span>{%$item.amount%}
                    </div>
                    <div class="text-line coupon-text">
                        <p>{%if (isset({%$item.desc%}))%}满{%$item.desc%}元可用{%else%}无限制{%/if%}</p>
                        {%if (isset($item.received) && $item.received == 1)%}
                            <div data-couponid="{%$item.id%}">已领取</div>
                        {%else%}
                            <div data-couponid="{%$item.id%}" class="getCoupon">点击领取</div>
                        {%/if%}
                    </div>
                </li>
                {%/foreach%}
            </ul>
        {%else%}
        <div id="swiper-coupon" >
            <div class="coupon-wrapper fn-clearfix">
                <div  class="coupon-slide">
                    <ul class="total-3 fn-clearfix">
                        {%section name="coupon" loop=$data max=3%}
                        <li class="fn-clearfix coupon-detail {%if (isset($data[coupon].received) && $data[coupon].received == 1)%}getoff{%/if%}">
                            <div class="text-line coupon-price">
                                <span>¥</span>{%$data[coupon].amount%}
                            </div>
                            <div class="text-line coupon-text">
                                <p>{%if (isset($data[coupon].desc))%}满{%$data[coupon].desc%}元可用{%else%}无限制{%/if%}</p>
                                {%if (isset($data[coupon].received) && $data[coupon].received == 1)%}
                                <div data-couponid="{%$data[coupon].id%}">已领取</div>
                                {%else%}
                                <div data-couponid="{%$data[coupon].id%}" class="getCoupon">点击领取</div>
                                {%/if%}
                            </div>
                        </li>
                        {%/section%}
                    </ul>
                </div>
                <div class="coupon-slide">
                    <ul class="total-{%$count-3%} fn-clearfix">
                        {%section name="coupon1" loop=$data max=(count-3) start=3 %}
                        <li class="fn-clearfix coupon-detail {%if (isset($data[coupon1].received) && $data[coupon1].received == 1)%}getoff{%/if%}">
                            <div class="text-line coupon-price">
                                <span>¥</span>{%$data[coupon1].amount%}
                            </div>
                            <div class="text-line coupon-text">
                                <p>{%if (isset($data[coupon1].desc))%}满{%$data[coupon1].desc%}元可用{%else%}无限制{%/if%}</p>
                                {%if (isset($data[coupon1].received) && $data[coupon1].received == 1)%}
                                <div data-couponid="{%$data[coupon1].id%}">已领取</div>
                                {%else%}
                                <div data-couponid="{%$data[coupon1].id%}" class="getCoupon">点击领取</div>
                                {%/if%}
                            </div>
                        </li>
                        {%/section%}
                    </ul>
                </div>
            </div>
            <div class="coupon-menu">
                {%section name="coupon_menu" loop=2%}
                    <span class="{%if $smarty.section.coupon_menu.index == 0%}on{%/if%}"></span>
                {%/section%}
            </div>
        </div>
        {%/if%}
</div>

{%script%}
var Swipe = require("common:widget/ui/swipe/swipe.js");
var container = document.getElementById("swiper-coupon");
var menu = $(".coupon-menu span");
var slideInstance = new Swipe(container, {
    wrapperClass:'.coupon-wrapper',
    autoplay:0,
    continuous: true,
    slideClass:'.coupon-slide',
    callback:function(pos){
        var i = menu.length;
        while (i--) {
        menu[i].className = ' ';
        }
        menu[pos].className = 'on';
    }
});

$(".coupon-detail").on('tap',function(){
    if(!$(".getCoupon",this)){
        return false
    }
    var id = $(".getCoupon",this).attr("data-couponid"),
    $this = $(this);
    if(login_flag == 1){
        $.ajax({
            type: "get",
            url: "/api/receiveCoupon?id="+id,
            success: function (data) {
                $this.addClass("getoff");
                if(data.status ==0){
                $this.find(".getCoupon").text("已领取").removeClass("getCoupon");
                $.tips("已成功领取优惠券，<br />请到我的卡路里查收!","success");
                }else{
                $.tips(data.msg);
                $this.find(".getCoupon").removeClass("getCoupon");
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
{%/script%}