<?php 
/*
    根据订单status数值输出中文状态
 */
function smarty_modifier_orderstatus($status)
{

    switch($status){
        case "0": $string = "待付款";
        break;
        case "1": $string = "待发货";
        break;
        case "2": $string = "待收货";
        break;
        case "3": $string = "交易成功";
        break;
        case "4": $string = "订单取消";
        break;
        case "5": $string = "退款成功";
        break;
        case "6": $string = "交易成功";
        break;
        case "退货处理中": $string = "";
        break;
        case "退货中,待用户发货": $string = "";
        break;
        case "待卡路里收货": $string = "";
        break;
        case "已退货,退款中": $string = "";
        break;
        case "拒绝退货": $string = "";
        break;
        default: $string = "";
        break;
    }
    return $string; 
}     