/* 
* @Author: shen
* @Date:   2015-12-24 10:30:41
*/

var _num = 0;
var _ajaxG = true;
$(function () {
    $(".tag>a").click(function () {
        if ($(this).hasClass("checked")) {
            _num -= 1;
            $(this).removeClass("checked");
        } else {
            _num += 1;
            $(this).addClass("checked");
        }
    });
    $("#postComment").click(function () {
        var _tagChecked =[];
        var content = $("#content").val();
        var _ordername = $(this).attr("data-ordername");
        var _productid = $(this).attr("data-productid");
        var _goodsid   = $(this).attr("data-goodsid");
        if(content.length >= 10 && content.length <= 300){
            
        }else{
             $.tips("输入字数限制在10-300之间哦");
             return  false;
        }
        if (_num >= 1 && _ajaxG && content) {
            $(".tag .checked").each(function(){
                _tagChecked.push($(this).html());
            });
           console.log(_tagChecked);
            var _dataStr = {
                "order_number":_ordername,
                "product_id": _productid,
                "goods_id": _goodsid,
                "content": content,
                "tags": _tagChecked
            };
            var ajaxLink = "http://m.kaluli.com/order/publishComment";
            $.post(ajaxLink, _dataStr, function (data) {
                if (!data.status) {
                    $.tips(data.msg);
                }else{
                      location.href = data.url;
                }
            }, 'json');
        } else {
            $.tips("至少选择1个标签哦");
        }
    });
});
