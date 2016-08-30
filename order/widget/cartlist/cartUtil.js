var alertbox = require('common:widget/ui/alertbox/alertbox.js');
var cartUtil = {
   changeFlag:true,
   submitUp:false,
   goodCheck:[],
   goodList:[],
   goodGid:null,
   init:function(){  
       this.bindFun();
   },
   bindFun:function(){
       var that = this;

       $(".input-true").show();
       $(".input-false").hide();

       $(".checkall").on("tap",function(){

           if($('.item-common').hasClass('active')){
               console.log($(this).attr("data-checked"));
               var check = $(this).attr("data-checked");
               if(check == "false"){
                   $(".common-cart-list li").attr("data-checked","checked");
                   $(this).attr("data-checked","checked");
               }else{
                   $(".common-cart-list li").attr("data-checked","false");
                   $(this).attr("data-checked","false");
               }
               that.getGoodsIdPost();
           }else if($('.item-haitao').hasClass('active')){
               var check = $(this).attr("data-checked");
               if(check == "false"){
                   $(".haitao-cart-list li").attr("data-checked","checked");
                   $(this).attr("data-checked","checked");
               }else{
                   $(".haitao-cart-list li").attr("data-checked","false");
                   $(this).attr("data-checked","false");
               }
               that.getGoodsIdPost();
           }else{
               var check = $(this).attr("data-checked");
               if(check == "false"){
                   $(".benniao-cart-list li").attr("data-checked","checked");
                   $(this).attr("data-checked","checked");
               }else{
                   $(".benniao-cart-list li").attr("data-checked","false");
                   $(this).attr("data-checked","false");
               }
               that.getGoodsIdPost();
           }


       });          

       $(".cart-list li").on("tap",function(){          
          if($(this).attr("class") != "" && null != $(this).attr("class")){          
             var checkAll = true,
                 length = $(".cart-list li").length-1;

             if($(this).attr("data-checked") == "checked"){
                  $(this).attr("data-checked","false")
             }else{
                  $(this).attr("data-checked","checked")
             }

             $(".cart-list li").each(function(i,d){                
                 if($(this).attr("data-checked")=="false"){
                    checkAll = false;
                 }                             
             });   

             if(checkAll){
                 $(".checkall").attr("data-checked","checked");
             }else{
                 $(".checkall").attr("data-checked","false");
             }
             that.checkAllFun();
             that.getGoodsIdPost();
           }
       });

       $(".del-btn").click(function(){
            that.goodGid = $(this).attr("gid");
            that.deleteConfirm([that.goodGid]);
       });       

       $("#submit-all").click(function(){
           if(that.goodList.length > 0){
              that.fromSubmit();
           }else{
              $.tips("请勾选商品");
           }
           return false;
       });


       $("#submit-all-haitao").click(function(){
           if(that.goodList.length > 0){
               that.fromSubmit();
           }else{
               $.tips("请勾选商品");
           }
           return false;
       });

       $("#submit-all-benniao").click(function(){
           if(that.goodList.length > 0){
               that.fromSubmit();
           }else{
               $.tips("请勾选商品");
           }
           return false;
       });
   },
   checkAllFun:function(){
       var check = false;
       $(".cart-list li").each(function(i,d){            
            if($(this).attr("data-checked") == "false"){
                check = true;
                return false;
            }
       });

       if(check){
          $(".checkall").attr("data-checked","false");
       }else{
          $(".checkall").attr("data-checked","checked");
       }
   },
   getGoodsIdPost:function(){
       var that = this;
       that.goodCheck = [];
       that.goodList = [];
       $(".cart-list li").each(function(i,d){
            if($(this).attr("data-checked") == "checked"){
                that.goodCheck.push(d.getAttribute("gid"));  
                that.goodList.push(d.getAttribute("gilist"));                  
            }
        });

       console.log(that.goodCheck);

       //http://m.kaluli.com/order/getCartAllPrice   |   test/ajax/getCartAllPrice
        $.post("http://m.kaluli.com/order/getCartAllPrice",{data:that.goodCheck},function(data){
            console.log(data.status);
            if(data.status*1 == 0){
                $('#submit-all-haitao').removeAttr('disabled');
                $('#submit-all-benniao').removeAttr('disabled');
                $('.fixedBtn .fn-fr').css('background-color','#db2735');
            }else if(data.status*1 == 1){
                $('#submit-all-haitao').attr('disabled','disabled');
                $('#submit-all-benniao').attr('disabled','disabled');
                $('.fixedBtn .fn-fr').css('background-color','#999');
                $.tips(data.msg);
            }
            $(".price-id-3").html(data.data.original_price);
            $(".price-id-2").html(data.data.total_count);
            $(".price-id-1").html(data.data.total_price);

            if( "undefined" == typeof data.data.activity){
                $(".activity-discount b").text(0);
                $(".price-id-4").text(0);
                return false
            }
            for(var type in data.data.activity.activity){
                if(data.data.activity.activity[type].activity_save){
                    $(".activity-discount b","#discount-"+type).text(data.data.activity.activity[type].activity_save);
                    $(".price-id-4").text(data.data.activity.activity_save);
                }else{
                    $(".activity-discount b","#discount-"+type).text(0);
                    $(".price-id-4").text(0);
                }
            }

        },"json");
   },
   sortArray:function(){

   },
   addGoods:function(datas,obj){
       // console.log(JSON.stringify(datas));return;
       var that = this;
       $.post("http://m.kaluli.com/order/addCartNumber",datas,function(data){
             if(data.status*1 == 0){
                //obj.html(data.data.total_price);                    
                that.getGoodsIdPost();
             }
       },"json");
   },
   deleteConfirm:function(gid){ 
        var t = this;      
         alertbox().show({
            title: '确定将这个宝贝删除吗',
            cancel:function(){
              alertbox().hide();
            },
            confirm:function(){
              t.deleteGoods(gid);
            }
         })
   },
   deleteGoods:function(da){
       var that = this;
       $.post("http://m.kaluli.com/order/deleteCart",{data:da},function(data){  
            if(data.status*1 == 0){
                $(".price-id-1").html(data.data);                                
                for(var i=0;i<da.length; i++){
                    var setObj = $("#cartpro_list tbody");                           
                    $("#goods-"+da[i]).remove();
                    if($(".cart-list li").length == 0){
                         location.reload();
                    }
                }
                that.getGoodsIdPost();
                //$(".cart-box .cartnum").html(data.data);
             }
       },"json");
   },
   fromSubmit:function(){
       var str = '';
       if(this.submitUp){
           return false;
       }
       this.submitUp = true;
       $(".input-true").hide();
       $(".input-false").show();
       for(var i=0; i<this.goodList.length; i++){
            str += (i==0?"":",")+this.goodList[i];
       }
 
       $("#goods-form").html('<input type="hidden" value="'+str+'" name="data" />');
       $("#goods-form").submit();
   }
}

module.exports=cartUtil;