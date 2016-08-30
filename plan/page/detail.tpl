{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
{%require name="plan:static/detail/detail.scss"%}
{%require name="plan:static/detail/detail.js"%}
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
{%/block%}
{%block name="content"%}
<section class="index-wrap">
    {%widget
    name="plan:widget/nav-grid/plan-nav.tpl"
    data=$detail.data.tree
    %}
    <article>
        <section class="cover">
            <img id="shareImage" src="{%$detail.data.cover%}">
            <p id="shareTitle">{%$detail.data.title%}</p>
        </section>
        <div class="info">
            <span>{%$detail.data.author%}</span>
            <span>{%$detail.data.public_time%}</span>
        </div>
        <section id="shareAbstract" class="abstract">{%$detail.data.abstract%}</section>
        <section class="articleContent">{%$detail.data.content|escape:none%}</section>
        {%foreach from=$detail.data.article item=articleitem key=articlekey%}
            <section class="item-article">
                {%if (!empty($articleitem.title))%}
                <div class="header">
                    {%$articleitem.title|truncate:15|escape:none%}
                </div>
                {%/if%}
                {%foreach from=$articleitem.content item=contentitem%}
                <div class="fn-clearfix articleHeader">
                    <div class="fn-fl icon">
                        <img src="{%$contentitem.icon%}">
                    </div>
                    <div class="fn-fl title">
                        {%$contentitem.title|escape:none%}
                    </div>
                </div>
                {%if (!empty($contentitem.content))%}
                    <div class="articleContent">{%$contentitem.content|escape:none%}</div>
                {%/if%}
                {%if (!empty($contentitem.image))%}
                <div class="imgList">
                    <div id="contentWith" style="width:{%$contentitem.image|@count *5.3%}rem">
                    {%foreach from=$contentitem.image item=imageitem key=imagekey%}
                        <img class="fn-fl lazy" src="{%$imageitem%}">
                    {%/foreach%}
                    </div>
                </div>
                {%/if%}
                {%/foreach%}
            </section>
        {%/foreach%}
        {%widget
        name="plan:widget/share/share.tpl"
        %}
    </article>
    {%widget
    name = "plan:widget/backTop/backtop.tpl"
    %}
</section>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/nav-fixed/nav-fixed.tpl"%}
{%/block%}