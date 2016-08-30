$(function(){
    $(".submit-btn").on("tap",function(){
        var cart_data = $("#cart_data").val(),
            address_id=$("#address_id").val();
        $.post("http://m.kaluli.com/order/zeroSubmit",{address_id:address_id,cart_data:cart_data},function(data){
            var res = "string" == typeof data ? $.parseJSON(data) : data;
            if(res.status == 1){
                window.location.href = "http://m.kaluli.com/order/zeroSuccess";
            }else{
                $.tips(res.info);
            }
        });
    });
});