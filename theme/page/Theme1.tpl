{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="theme:static/activity.scss"%}
{%/block%}

{%block name="content"%}
<section class="pagewrap discount" style="background-color: #000000;">
    <div class="head"><img src="{%$data.info.top_image%}" /></div>
    <div class="content">
        {%foreach from=$data.info.floors item=prolist key=name%}
        <div class="grid">
            <h3 class="title"><i style="background-color: #000000;">{%$name%}</i></h3>
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