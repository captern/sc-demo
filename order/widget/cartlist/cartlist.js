var changenum = require("order:widget/cartlist/changenum.js");
var cartUtil = require("order:widget/cartlist/cartUtil.js");
function cartlist(){

}
cartlist.prototype={
    init:function(){
        var changepronum = new changenum();

        changepronum.callback=function(obj){
            var gid = $(obj).parent().attr("gid"),
                objclass = $(obj).attr("class"),
                num = parseInt($(obj).parent().find("input").val()),
                max_length = parseInt($(obj).parent().find("input").attr("maxstock")),
                type;      
            
            if(objclass == "icon-subtract-nosprite"){
                type = 0; 
            }else if(objclass == "icon-add-nosprite"){
                type = 1;
            }     
        
            $(obj).parents("li").find(".pro-number").text("x"+num);
            cartUtil.addGoods({sku_id:gid,type:type},$(".price-id-1"));
        };

        changepronum.overstock = function(obj){
            if($(obj).parent().siblings(".maxnumtips").length > 0){
              return false
            }
            var max_length = parseInt($(obj).attr("maxstock"));
            if(obj.parent().find(".numbox-text").val() > max_length){
                $.tips("最多只能购买 "+max_length+" 件");
            }
        };

        changepronum.init();        
        this.bindFun();
        this.tabFun();
        cartUtil.init();  
    },
    bindFun:function(){
         $(".editBtn").on("tap",function(){
            var $li = $(".cart-list li[data-stock='true']");
            if($(this).attr("data-type")=="edit"){
                $li.attr("class","");
                $(".complete").show();
                $li.find(".editwrap").show();                
                $(".fixedBtn,.edit").hide();
                $li.find(".static").hide(); 
                $(this).attr("data-type","complete");
            }else{
                $li.attr("class","choosewrap");
                $(".complete").hide();
                $li.find(".editwrap").hide(); 
                $(".fixedBtn,.edit").show();
                $li.find(".static").show(); 
                $(this).attr("data-type","edit");
            }            
        });
    },
    tabFun:function(){
        $('.item-tabs').on('tap',function(){
            $('.item-tabs').removeClass('active');
            $(this).addClass('active');
            $(".price-id-3").html('0');
            $(".price-id-2").html('0');
            $(".price-id-1").html('0');
            $(".price-id-4").html('0');

            if($(this).hasClass('item-common')){
                $('.cart-wrap').hide();
                $('#tabs_common').show();
                $('.fixedBtn .fn-fr').css('background-color','#db2735');

                cartUtil.goodList.splice(0,cartUtil.goodList.length);
                $(".cart-list li").attr("data-checked","false");
                    $(".checkall").attr("data-checked","false");
                //alert(cartUtil.goodList.length);
            }else if($(this).hasClass('item-haitao')){
                $('.cart-wrap').hide();
                $('#tabs_haitao').show();
                cartUtil.goodList.splice(0,cartUtil.goodList.length);
                $(".cart-list li").attr("data-checked","false");
                $(".checkall").attr("data-checked","false");
            }else{
                $('.cart-wrap').hide();
                $('#tabs_benniao').show();
                cartUtil.goodList.splice(0,cartUtil.goodList.length);
                $(".cart-list li").attr("data-checked","false");
                $(".checkall").attr("data-checked","false");
            }
        });
    }
};

module.exports=function(){
    return new cartlist();
};