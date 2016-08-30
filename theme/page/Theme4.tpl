{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="theme:static/activity.scss"%}
<style>
    .pagewrap .content .grid h3{
        border: none!important;
        background-image: url(/static/theme/m-title-bg.png)!important;
        position: relative;
    }
    body .pagewrap .content .grid h3 i{
        background-color: transparent!important;
        display: block;
        position: absolute;
        right: 51%;
        top: 0;
    }
</style>
{%/block%}

{%block name="content"%}
<section class="pagewrap discount" style="background-color: #d43030;">
    <div class="head"><img src="{%$data.info.top_image%}" /></div>
    <div class="content">
        {%foreach from=$data.info.floors item=prolist key=name%}
        <div class="grid">
            <h3 class="title"><i style="background-color: #d43030;">{%$name%}</i></h3>
            <ul class="fn-clearfix">
                {%foreach $prolist as $item %}
                <li>
                    <a href="{%if (isset($item.url)&&!empty($item.url))%}{%$item.url%}{%/if%}">
                        <div class="img">
                            <img alt="{%$item.title%}" class="lazy" data-original="{%$item.pic%}?imageView2/2/h/400" />
                        </div>
                        <div class="proname">{%$item.title%}</div>
                        <div class="prointro">{%$item.subtitle%}</div>
                        <div class="proprice"><i>¥</i>{%$item.price%}</div>
                        <div class="btn">立即购买</div>
                    </a>
                </li>
                {%/foreach%}
            </ul>
        </div>

        {%/foreach%}
    </div>
</section>


    <!--新会员福利 -->
<div href="http://m.kaluli.com/newUserCard" num="0" class="freebies-fixed" style="font-size: .7rem">
    <img class="icon-monery" src="/static/icon_monery.png" /><span>&nbsp;&nbsp;新会员注册送<b style="margin-left: 0;">50</b>元现金券 </span>
    <a href="http://m.kaluli.com/newUserCard">领取</a>
    <img class="icon-close"  src="/static/fixed_closed.png">
</div>
{%script%}
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
$(".lazy").lazyload();
{%/script%}
{%/block%}



{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}