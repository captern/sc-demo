<div class="brand-grid">
    <h3>热门品牌</h3>
    {%if isset($data) && $data|count%}
    <ul class="fn-clearfix">
        {%foreach $data as $item%}
            <li><a href="{%$item.url|replace:"http://www":"http://m"%}" title="{%$item.title%}"><img src="{%$item.pic%}" alt="{%$item.title%}"/></a></li>
        {%/foreach%}
    </ul>
    {%/if%}
</div>