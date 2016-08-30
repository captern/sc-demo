<?php 

function smarty_modifier_checkArrSame($arr,$val)
{  
    
    foreach($arr as $k=>$v) {
        if($v != $val) return false;
    }
    return true;
}    