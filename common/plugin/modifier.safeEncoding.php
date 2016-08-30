<?php

function smarty_modifier_safeEncoding($str,$outEncoding = 'UTF-8'){
    $encoding = "UTF-8";
    for($i=0;$i<strlen($str);$i++){
        if(ord($str{$i})<128)
        continue;
        if((ord($str{$i})&224)==224){
            //第一个字节判断通过  
            $char = $str{++$i}; 
            if((ord($char)&128)==128){ 
                //第二个字节判断通过 
                $char = $str{++$i};  
                if((ord($char)&128)==128)  
                {
                    $encoding = "UTF-8";  
                    break;  
                }
            }
        }
        if((ord($str{$i})&192)==192){
            //第一个字节判断通过 
            $char = $str{++$i};
            if((ord($char)&128)==128){
                // 第二个字节判断通过 
                $encoding = "GB2312";
                break;   
            }
        }
    }

    if(strtoupper($encoding) == strtoupper($outEncoding))  
    return $str; 
    else  
    return iconv($encoding,$outEncoding,$str);
}