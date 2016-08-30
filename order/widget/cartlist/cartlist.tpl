<div class="static">
    <p class="title">{%$data.title%}</p>
    <p class="sku">
        {%if (isset($data.attr.attr)&&!empty($data.attr.attr))%}
        {%foreach from=$data.attr.attr item=skuitem key=skukey%}
            <span>{%$skukey%}：{%$skuitem%}</span>
        {%/foreach%}
        {%/if%}
    </p>
    <div class="price fn-clearfix">
        <div class="pro-price" class="fn-fl">¥{%$data.price%}</div>
        <div class="pro-number" class="fn-fr">x{%$data.number%}{%if (isset($data.stock_status)&&$data.stock_status == 1)%}<span class="overstock">最多只能购买 {%$data.total_num%}件</span>{%/if%}</div>
    </div>
</div>   
<div class="editwrap">
    <div class="fn-fl">
        <div gid="{%$data.goods_id%}" class="numbox fn-clearfix">
            <i class="icon-subtract-nosprite">-</i>
            <input id="numbox-text" type="text" class="numbox-text" maxlength="8" maxstock="{%$data.total_num%}"  readonly="readOnly" value="{%$data.number%}" title="请输入购买量"/>                 
            <i class="icon-add-nosprite">+</i>
        </div>   
        {%if (isset($data.attr.attr)&&!empty($data.attr.attr))%}
        {%foreach from=$data.attr.attr item=skuitem key=skukey%}
            <p>{%$skukey%}：{%$skuitem%}</p>
        {%/foreach%}
        {%/if%}
    </div>  
    <div class="fn-fr">
        <div class="del-btn" gid="{%$data.goods_id%}">删除</div>
    </div>                     
</div>     