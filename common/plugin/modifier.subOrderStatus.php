<?php 
/*
    根据订单status数值输出中文状态
 */
function smarty_modifier_subOrderStatus($status,$mainString)
{
    switch($status){
        case 0: $string = "订单生成";
        break;
        case 1: $string = "订单发货";
        break;
        case 2: $string = "订单完成";
        break;
        case 3: $string = "退货处理中";
        break;
        case 4: $string = "退货中,待用户发货";
        break;
        case 5: $string = "待卡路里收货";
        break;
        case 6: $string = "已退货,退款中";
        break;
        case 7: $string = "订单关闭";
        break;
        case 8: $string = "用户取消";
        break;
        case 9: $string = "卡路里取消";
        break;
        case 10: $string = "拒绝退货";
        break;
        default: $string = "未知状态";   
        break;
    }
    if(count($status) > 1){
        foreach( $status as $val ){
            if($val == 3 || $val == 4 || $val == 5 || $val == 6 || $val == 10){
                $string = "";
                break;
            }else{
                $string = $mainString;
            }
        }
        return $string;
    }else if( $mainString != ""){ 
        if(($status == 3 || $status == 4 || $status == 5 || $status == 6 || $status == 10)){   
            return $string;
        }else{
            return $mainString;
        }        
    }else if($mainString == ""){   
        return $string;
    }    
}     