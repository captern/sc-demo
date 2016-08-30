function submit(obj){
   
}
submit.prototype={
    ableajax:false,
    noerror:true,
    args:null,
    ajaxLoding:false,
    init:function(){ 
        var that = this;
        $(".confirmBtn").on("tap",function(){
            var type = $(".skucontent").attr("data-type");
            if(type == "submit"){
                if($('#stock').text() == '0' || $('#stock').text() == 0){
                    $.tips('库存不足！');
                    return;
                }
                var url = "http://m.kaluli.com/order/confirm/",
                    obj = ".confirmBtn"; 
                that.checkPro(obj,url,that.StandardPost);  
            }else{
                var url = "http://m.kaluli.com/order/addCart",
                    obj = ".confirmBtn";   
                if(that.ajaxLoding){
                  return false;
                }   
                that.ajaxLoding = true;
                that.checkPro(obj,url,that.cartpost);     
            }
        })        
    },
    checkPro:function(obj,url,fun){
        var that = this;        

        if($(".numbox").attr("data-type") == false){
            that.noerror = false;
            that.ajaxLoding = false;        
        }else{
            that.noerror = true;
        }

        $(".sort").each(function(){                                       
            var self = $(this);             
            if(self.find(".cur").length == 0 ){         
                $.tips("请选择您要购买的商品");                        
                that.ajaxLoding = false;
                that.noerror = false;
            }                        
        });       
        if(that.noerror){
            if($(".sort").length>0){ 
                var itemid = $(".sku-list").attr("data-itemid"),
                    skuid = $(".sku-list").attr("data-skuid"),
                    buysnum = $("#numbox-text").val();                                                                                                                          
            }else{                     
                var itemid,skuid,buysnum = $("#numbox-text").val();
                $.each(sku.detail,function(i,item){
                    itemid = sku.detail[i].itemId;
                    skuid = sku.detail[i].skuId;                            
                })                                                          
            }  

            if($(".skucontent").attr("data-type") == "submit"){
                that.args = {
                    id:itemid,
                    skuId:skuid,
                    num:buysnum
                }    
            }else{
                that.args = {
                    item_id:itemid,
                    sku_id:skuid,
                    number:buysnum
                } 
            }
            fun(url,that.args,that,obj);
        }                    
    },
    cartpost:function(url,args,obj,btn){
        $.getJSON(url+"?item_id="+args["item_id"]+"&sku_id="+args["sku_id"]+"&number="+args["number"],function(data){
            if(data.status == 0){
                obj.animation(data.data.img_path,btn);
                $(".cart-box a").html(data.data.count);
            }else{
                $.tips(data.msg);
            }
            obj.ajaxLoding = false;
        })
    },
    StandardPost:function(url,args){
        $.post("http://m.kaluli.com/api/isNansha",{sku_id:args.skuId,number:args.num},function(data){
            if(data.status == 1){
                $.tips(data.msg);
                return
            }else{
                var form = $("<form method='get'></form>");
                form.attr({"action":url});
                for (arg in args)
                {
                    var input = $("<input type='hidden'>");
                    input.attr({"name":arg});
                    input.val(args[arg]);
                    form.append(input);
                }
                $("body").append(form);
                form.submit();
            }
        },'json');


    },         
    animation:function(data,btn){
        var str = '<img id="cart-img-box" style="z-index:999;position: absolute; left:50%;margin-left:-1rem;top:'+$(btn).offset().top+'px; width:2rem; height:2rem;border-radius:50%;" src="'+data+'" />',
        that = this;
        $(str).appendTo('body');
        $("#cart-img-box").animate({left:$(".cart-box").offset().left,top:$(".cart-box").offset().top},500,function(){
            $("#cart-img-box").remove();
            $(".skucontent").removeClass('show');
            $(".blackBg").remove();
             that.ajaxLoding = false;
        });
    }
}

module.exports=function(obj){
    return new submit(obj);
}