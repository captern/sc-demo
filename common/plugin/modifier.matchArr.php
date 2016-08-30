<?php 
function smarty_modifier_matchArr($name,$arr){
    switch($name){
        case '运动方案' : $keyname = "scheme";
        break;
        case '品牌' : $keyname = "brand";
        break;
        case '类型' : $keyname = "type";
        break;
        case '价格' : $keyname = "price";
        break;
    }
    if(!empty($arr)){        
        foreach( $arr as $key => $value){         
            if ($key==$keyname){
                $filtername =  $value;
            }        
        }
        if(!empty($filtername)){
            return $filtername; 
        }else{
            return $name;
        } 
        
    }else{
        return $name;
    }
}