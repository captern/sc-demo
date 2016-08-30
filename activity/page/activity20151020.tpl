{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="activity:static/activity.scss"%}
{%/block%}

{%block name="content"%}
<section class="pagewrap discount" style="background-color:rgb(17,127,240);">
    <div class="head"><img src="/static/20151020.jpg" /></div>
    <div class="content">
        {%foreach from=$sectionname item=prolist key=name%}
        <div class="grid">
            <h3 class="title"><i style="background-color: rgb(17,127,240);">{%$name%}</i></h3>
            <ul class="fn-clearfix">
                {%foreach $prolist as $item %}
                <li>
                    <a href="http://m.kaluli.com/product/{%$item.id%}.html">
                        <div class="img">
                            <img alt="{%$item.title%}" class="lazy" data-original="{%$item.pic%}?imageView2/2/h/400" />
                        </div>
                        <div class="proname">{%$item.title%}</div>
                        <div class="prointro">{%$item.intro%}</div>
                        <div class="proprice"><i>?</i>{%$item.discount_price%}</div>
                        <div class="btn">Á¢¼´¹ºÂò</div>
                    </a>
                </li>
                {%/foreach%}
            </ul>
        </div>

        {%/foreach%}
    </div>
</section>
{%script%}
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
$(".lazy").lazyload();
{%/script%}
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}