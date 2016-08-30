
$(function(){
    $("#confirmBtn").on("click",function(){
        $(".response").hide();
        var tel = $("input[name='cellphone']").val();
        var captcha = $("input[name='identify']").val();
        if(captcha == ""){
            $.tips("请填写验证码");
            return false
        }
        if(tel == ""){
            $.tips("请填写手机号");
            return false
        }
        $.ajax({
            type: 'POST',
            url: "http://www.kaluli.com/api/getPassportUserInfo",
            data: {
                mobile:tel,
                authcode:captcha
            },
            dataType: 'json',
            success: function(data) {
                if(data.status == 0){
                    window.location.href = "http://m.kaluli.com/order/zeroConfirm";
                }else{
                    $.tips(data.msg);
                    $(".response").text(data.msg).show();
                }
            },
            error: function() {
                $.tips("发送失败，请稍候重试");
            },
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            }
        });
    });

    $("#getBtn").on('click', function(){
        if( "0" == $(this).text()){
            return false
        }
        var tel = $("input[name='cellphone']").val();
        var reg = /^1[1-9]\d{9}$/;
        if(reg.test(tel)){
            // 发送验证码
            $.ajax({
                type: 'POST',
                url: "http://www.kaluli.com/api/getPassportIdentifyingCode",
                data: {mobile:tel,activity:1},
                dataType: 'json',
                success: function(data) {
                    if(data.status == 0){
                        var _t2 = new Date();
                        _t2 = Math.ceil(Date.parse(_t2)/1000);
                        countDownReg(_t2);
                    }else{
                        $.tips(data.msg);
                    }
                },
                error: function() {
                    $.tips("发送失败");
                },
                crossDomain: true,
                xhrFields: {
                    withCredentials: true
                }
            });
        }else{
            $.tips("请输入正确的手机号码");
        }
    });
    function countDownReg(t2) {
        var _t = new Date();
        _t = Math.ceil(Date.parse(_t) / 1000);
        _t = 60 - (_t-t2);

        if (_t > 0) {
            $('#getBtn').text("发送中" + _t +"..").attr("ableclick","0");
            setTimeout(function() {
                countDownReg(t2);
            }, 1000);
        } else {
            $('#getBtn').text("重新发送").attr("ableclick","1");
        }
    }
});
