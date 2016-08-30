<?php 

function smarty_modifier_trim($str)
{
    if(!is_string($str)) return "";

    $qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
    return str_replace($qian,$hou,$str); 
}    