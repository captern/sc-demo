var alertbox = require('common:widget/ui/alertbox/alertbox.js');
(function(){
    var orderdetail={
        defaults:{
            ajaxUrl:"http://m.kaluli.com/ucenter/ajaxMyOrder",
            tpl:"#tpl",
            wrap:".myorder section",
            loadingbar:".loadingbar",
            _ajaxG:true,
            _ajaxScroll:true,
            type:""                
        },
        init:function(){
            this.bindFun();
            this.payment();
        },       
        bindFun:function(){
            var url ={
                confirm:"http://m.kaluli.com/order/confirmReceive",
                payfor: "http://m.kaluli.com/order/getPayLink",
                cancel:"http://m.kaluli.com/order/cancelOrder",
                transport:"http://m.kaluli.com/api/getOrderLogistics"
            }
            //确认收货
             $(document).on("tap",'.confirm',function(){
                var  that = this,
                     order_number = $(this).attr("order-number"),
                     domestic_order_number = $(this).attr('domestic-order-number');       
                alertbox().show({
                    title:"您确定收货吗？",
                    confirm:function(){
                        $.post(url.confirm,{order_number:order_number,domestic_order_number:domestic_order_number},function(data){
                            window.location.reload();
                        })       
                    },
                    cancel:function(){
                        alertbox().hide();
                    }
                });                    
            }); 

            //取消订单
            $(document).on("tap",'.cancel',function(){
                var  that = this,
                     order_number = $(this).attr("order-number"),
                     $thisorder = $(this).parents(".orderdetail").prev(".ordertop").find(".status"),
                     $parent = $(this).parent();                
                alertbox().show({
                    title:"您确定要取消订单吗？",
                    confirm:function(){
                        $(".progrid").attr("href","javascript:void(0)");
                        $.post(url.cancel,{order_number:order_number},function(data){
                            var da = $.parseJSON(data);
                            if(da.status == 1){
                                window.location.reload();
                            }else{
                                alert(da.info);
                            }
                            
                        });       
                    },
                    cancel:function(){
                        alertbox().hide();
                    }
                });                  
            }); 
        },
        payment:function(){
            var ajaxLoding = false;
            $(document).on("tap",'.paylink',function(){
                if(ajaxLoding){
                    return false;
                }
                ajaxLoding = true;
                var order_number = $(this).attr("data-orderNumber"),
                    wx_code  =  $(".paytype .checked").attr("data-type") == "zhifubao" ? "" : $("#wx_code").val(),
                    wx_openid = $(".paytype .checked").attr("data-type") == "zhifubao" ? "" : $("#wx_openid").val();
                var data={
                    order_number:order_number,
                    wx_code:wx_code,
                    wx_openid:wx_openid
                };
                var callbackUrl,preData;
                $.post("http://m.kaluli.com/order/getPayLink",data,function(d){
                    var datas = typeof d == "string" ? $.parseJSON(d) : d;
                    if(datas.status == 1){
                        if(datas.data.pay_type == 1){
                            window.location.href = datas.data.pay_url;
                        }else{
                            callbackUrl = datas.data.callbackurl;
                            preData = datas.data.parame;
                            if(typeof WeixinJSBridge == "undefined"){
                                if( document.addEventListener ){
                                    document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                                }else if (document.attachEvent){
                                    document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                                    document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                                }
                            }else{
                                jsApiCall();
                            }
                        }
                    }
                    ajaxLoding = false;
                });
            });
        }
    }
    function jsApiCall(preData,callbackurl) {
        alert('请返回到订单列表页进行支付');
    }
    orderdetail.init();
})();