<section class="floors" id="{%$key%}">
    <h3><a href="/product/p-0-0-{%$data.name%}" >{%$data.name%}</a></h3>
    <ul>
        {%foreach from=$data.item_data item=productitem key=productkey%}
        {%if $productkey<=3%}
            <li>
                <a href="/product/{%$productitem.id%}.html" class="fn-clearfix">
                    <div class="img"><img class="lazy" data-original="{%$productitem.pic%}?imageView2/2/h/330"/></div>
                    <div class="info">
                        <p>{%$productitem.title%}</p>
                        <p>{%$productitem.sell_point%}</p>
                        <div class="price">
                            {%if isset($productitem.discount_price)%}
                                <span class="discount"><i>¥</i>{%$productitem.discount_price%}</span>
                            {%/if%}
                            <span class="original {%if isset($productitem.discount_price)%}linethrough{%/if%}">¥{%$productitem.price%}</span>
                        </div>
                    </div>                    
                </a>
            </li>
        {%/if%}        
        {%/foreach%}            
    </ul>
</section>    

