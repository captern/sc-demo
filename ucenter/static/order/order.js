var alertbox = require('common:widget/ui/alertbox/alertbox.js');
(function(){
    var order={
        defaults:{
            ajaxUrl:"/ucenter/ajaxMyOrder",
            tpl:"#tpl",
            wrap:".myorder section",
            loadingbar:".loadingbar",
            _ajaxG:true,
            _ajaxScroll:true,
            type:""                
        },
        init:function(){
            this.hashHandle();
            this.selectType();
            this.bindFun();
            this.ajaxScroll();
            this.payment();
        }, 
        hashHandle:function(){
            var t = this; 
            t.defaults.type=window.location.hash == "" ? "all" : window.location.hash.replace("#","");
            $(".top-filter li").each(function(){
                if($(this).attr("data-type") == t.defaults.type){
                    $(".top-filter li").attr("class","");
                    $(this).attr("class","cur")
                }
            });
            $("#orderlist").attr("data-type",t.defaults.type);
            t.ajaxload(t,"select",1,t.defaults.type);
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
                     $thisorder = $(this).parents(".orderdetail").prev().find(".status"),
                     $parent = $(this).parent();
                alertbox().show({
                    title:"您确定要取消订单吗？",
                    confirm:function(){
                        $.post(url.cancel,{order_number:order_number},function(data){
                            var da = $.parseJSON(data);
                            if(da.status == 1){
                                $thisorder.text("订单取消");
                                $parent.remove();
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
        selectType:function(){
            var t = this;
            $(".top-filter li").on("tap",function(){ 
                var type=$(this).attr("data-type"),
                    page=$(this).attr("data-page");
                $("#orderlist").attr({"data-type":type,"data-page":page});
                $(".top-filter li").attr("class",""); 
                $(this).attr("class","cur");                                  
                t.ajaxload(t,"select",page,type);  
                t.defaults._ajaxG = false;  
                t.defaults._ajaxScroll = true;                   
            })
        },        
        ajaxScroll:function(){
            var t=this;
            $(window).scroll(function () {              
                if ($(window).scrollTop() >= $(document).height() - $(window).height() && t.defaults._ajaxG) {                      
                    if(!t.defaults._ajaxScroll) return false
                    var type=$("#orderlist").attr("data-type"),
                        page=$("#orderlist").attr("data-page");
                    $(".loadding").show();                                    
                    t.ajaxload(t,"scroll",page,type);
                    t.defaults._ajaxScroll = false;    
                }
            });
        },
        ajaxload:function(t,handle,page,type){      
            if((!t.defaults._ajaxG && handle == "select") || (!t.defaults._ajaxScroll && handle == "scroll")) return false                                                                        
            if($(t.defaults.loadingbar).length==0 && t.defaults.type !=""&& handle=="select"){
                $("body").append("<div class='loadingbar'></div>");
            }                         
            if(handle == "scroll"){
                page++
            }            
            $.post(t.defaults.ajaxUrl,{page:page,pagesize:10,type:type},function(d){
                if(handle == "select"){
                    t.defaults._ajaxG = true;
                    $(t.defaults.loadingbar).remove();
                    $(t.defaults.wrap).html(d);  
                }else{
                    d == "" ? t.defaults._ajaxScroll=false : t.defaults._ajaxScroll = true;                     
                    $(".loadding").hide();                                                                
                    $(t.defaults.wrap).append(d);
                    $("#orderlist").attr("data-page",page);
                }                                                    
            })
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
                                jsApiCall(preData,callbackUrl);
                            }
                        }
                    }
                    ajaxLoding = false;
                });
            });
        }
    };
    function jsApiCall(preData,callbackurl) {
        if (preData) {
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                preData,
                function (res) {
                    if (res.err_msg == "get_brand_wcpay_request:ok") {
                        location.href = callbackurl;
                    }
                }
            );
        }
    }
    order.init();
})();