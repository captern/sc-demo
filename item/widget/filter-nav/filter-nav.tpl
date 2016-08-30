<div class="filter">    
    <ul class="fn-clearfix">
        <li>{%if isset($choosed_where.scheme)%}{%$choosed_where.scheme%}{%if isset($choosed_where.type)%}/{%$choosed_where.type%}{%/if%}{%else%}解决方案{%/if%}</li>    
        <li>{%if isset($choosed_where.brand)%}{%$choosed_where.brand%}{%else%}品牌{%/if%}</li>  
        <li>{%if isset($choosed_where.price)%}{%$choosed_where.price%}{%else%}价格{%/if%}</li>
    </ul>
    <div  class="discount">促销<button class="check-btn" data-url="{%$tabMarketingUrl%}" data-check="{%if (isset($isMarketing)&&!empty($isMarketing))%}true{%else%}false{%/if%}"></button></div>
    <div class="filter-content">    
    {%foreach from=$data item=filteritem key=filterkey %}
        <div class="filter-grid {%if (isset($filteritem.default_url)&&!empty($filteritem.default_url))%}choose-bg{%/if%}">
            <div class="grid-wrap fn-clearfix">    
                {%if (isset($filteritem.name))%} 
                    {%if (isset($filteritem.init)&&!empty($filteritem.init))%}
                        <div class="left">
                                <a href="{%$filteritem.default_url%}">全部</a>
                                {%foreach $filteritem.data as $item name="left"%}                                          
                                    <a href="javascript:void(0);">{%$item%}</a>
                                {%/foreach%}
                            </div>
                            <div class="right-box">                                   
                                    <div class="right">
                                    </div>
                            </div>        
                    {%else%}

                        {%foreach $filteritem.data as $itema name="foo"%}

                            <a class="{%if (isset($filteritem.current)&&!empty($filteritem.current))&&$itema==$filteritem.current%}on{%/if%}" href="{%$filteritem.url[$smarty.foreach.foo.index]%}">{%$itema%}</a>
                        {%/foreach%}  
                    {%/if%}                           
                {%/if%}
            </div>            
        </div>
    {%/foreach%} 
    </div>     
</div>
{%script%}
    var filter=require("item:widget/filter-nav/filter-nav.js");
    filter.init();
{%/script%}
{%if (!empty($banner))%}
<div class="pics-banner"><img src="{%$banner%}" /></div>
{%/if%}