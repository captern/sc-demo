{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="item:static/list/list.scss"%}
    {%require name="common:static/js/underscore/underscore.js"%}
    {%require name="item:static/list/list.js"%}
{%/block%}

{%block name="content"%}
    <section class="list-wrap">
        {%block name="header"%}
            {%widget name="common:widget/header/logoheader.tpl"%}
        {%/block%}
        {%widget
            name="item:widget/filter-nav/filter-nav.tpl"
            data=$filter
        %}
        {%if (isset($activity_title)&&!empty($activity_title))%}
        <p class="discount-list">
            以下商品参加：{%$activity_title%}
        </p>
        {%/if%}
        {%widget
            name="item:widget/prolist/prolist.tpl"
            data=$products
        %} 
    </section>
     
    <div class="loadding" id="loadding"><span></span>正在加载....</div>
    <script id="tpl" type="text/template">   
        <li>
            {%*<a href="/product/<@=id@>.html" class="fn-clearfix">*%}
                {%*<div class="img"><img class="lazy" data-original="<@=pic@>?imageView2/2/h/330"/></div>*%}
                {%*<div class="info">*%}
                    {%*<p>*%}
                        {%*<@if (undefined != typeof tag){@>*%}
                            {%*<span class="activity-tag"><@=tag@></span>*%}
                        {%*<@}@>*%}
                        {%*<@=title@>*%}
                    {%*</p>*%}
                    {%*<p><@=sell_point@></p>*%}
                    {%*<div class="price">*%}
                        {%*<@if (discount_price != ""){@>*%}
                            {%*<span class="discount"><i>¥</i><@=discount_price@></span>*%}
                            {%*<span class="original linethrough">¥<@=price@></span>*%}
                        {%*<@}else{@>*%}
                            {%*<span class="discount"><i>¥</i><@=price@></span>*%}
                        {%*<@}@>                          *%}
                    {%*</div>*%}
                {%*</div>                    *%}
            {%*</a>*%}
        </li>                
    </script>
    <script type="text/javascript">
      var list_brand = '{%if isset($choosed_where.brand)%}{%$choosed_where.brand%}{%else%}{%/if%}',
          list_price = '{%if isset($choosed_where.price)%}{%$choosed_where.price%}{%else%}{%/if%}',
          list_scheme = '{%if isset($choosed_where.scheme)%}{%$choosed_where.scheme%}{%else%}{%/if%}',
          list_type = '{%if isset($choosed_where.type)%}{%$choosed_where.type%}{%else%}{%/if%}',
          list_aIDs = '{%if isset($choosed_where.aIds)%}{%$choosed_where.aIds%}{%else%}{%/if%}'
    </script>

    <!--新会员福利 -->
    {*<div href="http://m.kaluli.com/newUserCard" num="0" class="freebies-fixed"  style="font-size: .7rem">*}
        {*<img class="icon-monery" src="/static/list/icon_monery.png" /><span>&nbsp;&nbsp;新会员注册送<b style="margin-left: 0;">50</b>元现金券 </span>*}
        {*<a href="http://m.kaluli.com/newUserCard">领取</a>*}
        {*<img class="icon-close" src="/static/list/fixed_closed.png">*}
    {*</div>*}
<div href="http://m.kaluli.com/newUserCard" num="0" class="freebies-fixed" style="font-size: .7rem">
    <img class="icon-monery" src="/static/list/icon_monery.png" /><span>&nbsp;&nbsp;新会员注册送<b style="margin-left: 0;">50</b>元现金券 </span>
    <a href="http://m.kaluli.com/newUserCard">领取</a>
    <img class="icon-close"  src="/static/list/fixed_closed.png">
</div>

{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}