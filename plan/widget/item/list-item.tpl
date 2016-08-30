<ul class="each-item">
    {%foreach from=$data item=productitem key=productkey%}
    {%if $productkey == 0%}
    <li>
        <a class="item-banner" href="{%$productitem.url%}">
            <div><img class="lazy banner" data-original="{%$productitem.pic%}" alt="banner"/></div>
            <p class="fn-clearfix">
                <span class="banner-summary">{%$productitem.summary%}</span>
                <span class="banner-time">{%$productitem.time%}</span>
            </p>
        </a>
    </li>
    {%else%}
    <li>
        <a class="item-block fn-clearfix" href="{%$productitem.url%}">
            <div class="img"><img class="lazy" data-original="{%$productitem.pic%}"/></div>
            <div class="info">
                <p>{%$productitem.summary%}</p>
                <p>{%$productitem.time%}</p>
            </div>
        </a>
    </li>
    {%/if%}
    {%/foreach%}
</ul>