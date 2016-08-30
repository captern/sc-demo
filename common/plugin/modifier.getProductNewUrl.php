<?php

/**
 *商品列表页的连接
 * @param string $prefix 前缀
 * @param string $name
 * @param string $val
 * @param int $type 1表示增加 0 表示删除
 */
function smarty_modifier_getProductNewUrl($curr_params,$prefix,$name,$val,$type=1){
    if(isset($curr_params['root_id']))unset($curr_params['root_id']);
    if(isset($curr_params['children_id']))unset($curr_params['children_id']);

    if ($type == 1){
        $where = array();
        if($name) $curr_params[$name] = $val;
        if (isset($curr_params['brand'])) $where['brand'] = $curr_params['brand'];
        if (isset($curr_params['type'])) $where['type'] = $curr_params['type'];
        if (isset($curr_params['scheme'])) $where['scheme'] = $curr_params['scheme'];
        if (isset($curr_params['price'])) $where['price'] = $curr_params['price'];
        if (isset($curr_params['order'])) $where['order'] = $curr_params['order'];
        if (isset($curr_params['page']) &&  $curr_params['page'] > 1) $where['page'] = $curr_params['page'];
        if (isset($curr_params['keywords'])) $where['keywords'] = $curr_params['keywords'];
        $curr_params = $where;
    } else {
        unset($curr_params[$name]);
    }
    $return  = $prefix;
    $postfix = '';
    if (isset($curr_params['brand'])){
        $postfix .= '-'.urlencode(urlencode(strtr($curr_params['brand'],'-','*')));
        unset($curr_params['brand']);
    } else {
        if(isset($curr_params['type']) || isset($curr_params['scheme']))
             $postfix .= '-0';
    }
    if (isset($curr_params['type'])){
        $postfix .= '-'.$curr_params['type'];
        unset($curr_params['type']);
    } else {
        if(isset($curr_params['scheme']))
            $postfix .= '-0';
    }
    if (isset($curr_params['scheme'])){
        $postfix .= '-'.$curr_params['scheme'];
        unset($curr_params['scheme']);
    }

    if ($postfix){
        $return .= '/p'.$postfix;
    }
    $query = http_build_query($curr_params);
    if ($query){
        return $return.'?'.$query;
    } else {
        return $return;
    }
} 