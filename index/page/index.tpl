{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="index:static/index/index.scss"%}
    {%require name="index:static/index/index.js"%}
{%/block%}

{%block name="content"%}
    <section class="index-wrap">
        {%block name="header"%}
            {%widget name="common:widget/header/logoheader.tpl"%}
        {%/block%}
        {%if !empty($slides)%}
            {%widget
                name="index:widget/carousel/carousel.tpl"
                block="page_index_top"
                data=$slides 
            %}
        {%/if%}
        {%widget
            name="index:widget/nav-grid/nav-grid.tpl"
        %}
        {%if (isset($coupons)&&!empty($coupons))%}
        <div class="freebies">
            <a href="http://m.kaluli.com/getCoupon">
                <span>卡路里优惠券:</span>千款营养品,领券享优惠
            </a>
        </div>
        {%/if%}
        {%widget
            name="index:widget/brand-grid/brand-grid.tpl"
            data=$brands
        %} 
        <div class="floors-wrap">
        {%if !empty($_floors)%}
            {%foreach from=$_floors item=_floorsItem key=_floorsKey %}          
            {%widget
                name="index:widget/section-category/section-category.tpl"
                data=$_floorsItem
                key=$_floorsKey
            %}
            {%/foreach%}
        {%/if%}    
        </div>                   
    </section>

    {%*{%if (!empty($newUserAct) && time() > $newUserAct['stime'] && time() < $newUserAct['etime'])%}*%}
    <!--新会员福利 -->
    <div href="http://m.kaluli.com/newUserCard" num="0" class="freebies-fixed" style="font-size: .7rem">
        <img class="icon-monery" src="/static/index/icon_monery.png" /><span>&nbsp;&nbsp;新会员注册送<b style="margin-left: 0;">50</b>元现金券 </span>
        <a href="http://m.kaluli.com/newUserCard">领取</a>
        <img class="icon-close"  src="/static/index/fixed_closed.png">
    </div>
    {%*{%/if%}*%}
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/nav-fixed/nav-fixed.tpl"%}
{%/block%}
