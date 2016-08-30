<a href="{%if (isset($orders)&&!empty($orders))%}/order/detail/?order_number={%$data.order_number%}{%else%}/product/{%$data.product_id%}.html{%/if%}" class="fn-clearfix progrid" target="{%if (isset($orders))%}_self{%else%}_blank{%/if%}">
    <div class="img"><img width="100%" src="{%$data.img%}" /></div>
    <div class="info">
        <p>{%if (isset($data.is_gift)&&!empty($data.is_gift))%}<span class="freebies">赠品</span>{%/if%}{%$data.title%}</p>
        {%foreach from=$data.attr item=attritem key=attrkey%}
            <p>{%$attrkey%}:{%$attritem%}</p>
        {%/foreach%}
    </div>
    <div class="price">
        <p>¥{%$data.price%}</p>
        <p>x{%$data.number%}</p>                                
    </div>
    {%if (isset($orders)&&isset($showsubOrderStatus)&&$showsubOrderStatus==1)%}
        <div class="status">{%$data.status|subOrderStatus:""%}</div>
    {%/if%}
</a>
{%if (isset($data.comment_url)&&$data.comment_url !="") %}     
<p style=" text-align:right;padding:0 0.75rem;padding-bottom:0.3rem;border-bottom:1px solid #e5e5e5"><a href="{%$data.comment_url%}" class="btn">评价订单</a></p>    
{%/if%}