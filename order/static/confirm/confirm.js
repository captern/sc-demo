(function(win,$){
    
    var ajaxLoding = false;

    $(".submit-btn").on("tap",function(){
        if(ajaxLoding){
            return false;
        }
        var $this = $(this);
        $this.addClass('submit-btnCC').text("提交中...");
        ajaxLoding = true;

        var wx_code  =  $(".paytype .checked").attr("data-type") == "zhifubao" ? "" : $("#wx_code").val(),
            wx_openid = $(".paytype .checked").attr("data-type") == "zhifubao" ? "" : $("#wx_openid").val();

        var datas = {
            product_id :$("#item_id").val(),
            goods_id:$("#sku_id").val(),
            address_id:$("#address_id").val() || "",
            number:$("#order_number").val(),
            remark :$("#textatea-shuoming").text(),
            card_id:$(".coupon-collapse li[data-checked=checked]").attr("data-cardid"),
            express_type:$(".logistics li.checked").data("type"),
            wx_code:wx_code,
            wx_openid:wx_openid
        };
        var callbackUrl,preData;
        $.post("http://m.kaluli.com/api/submitOrder",{data:datas},function(data){
            if(data.status == 1){
                if(data.data.pay_type == 1){
                    window.location.href = data.data.pay_url;
                }else{
                    callbackUrl = data.data.callbackurl;
                    preData = data.data.parame;
                    if(typeof WeixinJSBridge == "undefined"){
                        if( document.addEventListener ){
                            document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                        }else if (document.attachEvent){
                            document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                            document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                        }
                    }else{
                        jsApiCall(preData,callbackUrl);
                    }
                }
            }else{
              $(".submit-btn").removeClass('submit-btnCC').text("立即支付");
              $.tips(data.info);

            }
            ajaxLoding = false;
        },"json");
    });

    var hastap = false;
    $(".cupon-confirm").on("tap",function(){
        $(".cupon-confirm").text("提交中...");
        if(hastap){
            return false
        }
        hastap = true;
        orderJson(function(){
            hastap = false;
        })
    });

    $(".paytype li").on('tap',function(){
        if($(this).hasClass("checked")){
            return false
        }
        var $this = $(this);
        $(".paytype li").removeClass("checked");
        $(this).addClass("checked");
    });

    $(".logistics li").on('tap',function(){
        if($(this).hasClass("checked")){
            return false
        }
        var $this = $(this);
        $(".logistics li").removeClass("checked");
        $(this).addClass("checked");
        orderJson();

    });

    function orderJson(callback){
        var id = $("#item_id").val(),
            skuId=$("#sku_id").val(),
            num = $("#order_number").val(),
            card_id =$(".coupon-collapse li[data-checked=checked]").attr("data-cardid"),
            address_id=$("#address_id").val() || "",
            express_type = $(".logistics li.checked").data("type");

        if(!address_id){
            $.tips("请填写收货地址");
            return false
        }
        $.post("/api/getOrderPrice",{id:id,skuId:skuId,num:num,card_id:card_id,address_id:address_id,express_type:express_type},function(data){
            var datas = "object" == typeof data ? data :$.parseJSON(data);
            if(datas.code == 1){
                if(card_id != ""){
                    $("#cupon-error-txt").text(datas.msg);
                    $(".cupon-intro").hide();
                }
                $(".error-info").show();
                $(".activity").hide();
            }else{
                if(card_id != ""){
                    $(".cupon-intro").hide();
                    $(".confirm-info").show();
                }
            }
            $("#totalprice").text(datas.data.total_price);
            $(".price-id-1").text(datas.data.original_price);
            if(datas.data.activity){
                $(".price-id-2").text(datas.data.activity.activity_save);
            }else{
                $(".price-id-2").text(0);
            }
            if(datas.data.coupon_fee){
                $(".price-id-3").text(datas.data.coupon_fee);
            }else{
                $(".price-id-3").text(0);
            }
            $(".cupon-confirm").text("提交");
            var shunfeng_freight = datas.data.shunfeng_freight == 0 ? "免邮" : datas.data.shunfeng_freight+"元";

            $("#shunfeng").text(shunfeng_freight);
            if($("#shunfeng_tips").length > 0)   $("#shunfeng_tips").text( datas.data.shunfeng_freight);
            callback && callback();
        });
    }

    function jsApiCall(preData,callbackurl) {
        if (preData) {
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                preData,
                function (res) {
                    if(res.err_msg == "get_brand_wcpay_request:cancel" || res.err_msg == "get_brand_wcpay_request:fail"){
                        $(".submit-btn").removeClass('submit-btnCC').text("立即支付");
                    }
                    if (res.err_msg == "get_brand_wcpay_request:ok") {
                        location.href = callbackurl;
                    }
                }
            );
        }
    }

    $(".coupon-box").on("tap",function(){
        if($(".coupon-collapse li").length > 0){
            $.popupBg();
            $(".coupon-mask").addClass("show");
        }
    });
    $(".coupon-mask").on("tap",function(o){
        if(o.target.className == "coupon-mask show"){
            $(".blackBg").remove();
            $(".coupon-mask").removeClass("show");
        }
    });

    $(".coupon-collapse li").eq(0).attr("data-checked","checked");
    $(".coupon-collapse li").on("tap",function(){
        var $this = $(this);
        if($(this).hasClass("getoff")){
            return false
        }
        $(".coupon-collapse li").attr("data-checked","");
        if($(this).attr("data-checked")!="checked"){
            $(this).attr("data-checked","checked");
            $(".coupon-box").text($this.find(".p1").text());
        }
        $(".blackBg").remove();
        $(".coupon-mask").removeClass("show");
        orderJson();
    });
})(window,Zepto);