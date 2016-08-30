var alertbox = require('common:widget/ui/alertbox/alertbox.js');
(function(){
    function getQueryString(name) { 
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
        var r = window.location.search.substr(1).match(reg); 
        if (r != null) return unescape(r[2]); return null; 
    } 
    var address={
        init:function(){
            this.bindFun()
        },
        bindFun:function(){
            $(document).on('tap','.checkbox',function(){
                var address_id = $(this).parents(".grid").attr("data-id"),
                    t = this;                
                if(!$(this).hasClass('default')){
                    $.post("http://m.kaluli.com/api/setDefaultAddress",{id:address_id},function(){
                        $(".checkbox").removeClass('default');
                        $(t).addClass('default');
                        var url = $(".ucenter-address").attr("data-url");                        
                    })
                }
            });
            $(document).on('tap','.delete',function(){
                var address_id = $(this).parents(".grid").attr("data-id"),
                    t = this;
                alertbox().show({
                    title:"您确定删除该收货地址吗？",
                    confirm:function(){
                        $.post("http://m.kaluli.com/api/delAddress",{id:address_id},function(){
                            $(t).parents(".grid").remove();
                        })
                    },
                    cancel:function(){
                        alertbox().hide();
                    }
                });

            });
            $(document).on('tap','.address',function(){                        
                if(window.location.href.indexOf("order") > 0){
                    var jumpurl = getQueryString("jumpUrl"),
                        addressindex = jumpurl.indexOf("address_id");
                    if(addressindex > 0){
                        jumpurl = jumpurl.substring(0,addressindex-1);
                    }
                    var id = $(this).parent().attr("data-id");
                    window.location.href = jumpurl+"&address_id="+id;
                }
                return false
                //$(this).siblings('.action').find('.checkbox').trigger('tap');
            });            
        }
    }
    address.init();
})();