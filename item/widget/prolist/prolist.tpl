<section class="prolist">
    <ul>
        {%foreach from=$data item=productitem key=productkey%}
            <li>
                <a href="/product/{%$productitem.id%}.html" class="fn-clearfix">
                    <div class="img"><img class="lazy" data-original="{%$productitem.pic%}?imageView2/2/h/330"/></div>
                    <div class="info">
                        <p>{%if (isset($productitem.tag))%}<span class="activity-tag">{%$productitem.tag%}</span>{%/if%}{%$productitem.title%}</p>
                        <p>{%$productitem.sell_point%}</p>
                        <div class="price">
                            {%if isset($productitem.discount_price)%}
                                <span class="discount"><i>¥</i>{%$productitem.discount_price%}</span>
                                <span class="original linethrough">¥{%$productitem.price%}</span>
                            {%else%}
                                <span class="discount"><i>¥</i>{%$productitem.price%}</span>
                            {%/if%}                            
                        </div>
                    </div>                    
                </a>
            </li>       
        {%/foreach%}            
    </ul>
</section> 