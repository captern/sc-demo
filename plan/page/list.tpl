{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
{%require name="plan:static/list/list.scss"%}
{%require name="common:static/js/underscore/underscore.js"%}
{%require name="plan:static/list/list.js"%}
{%/block%}
{%block name="content"%}
<section class="index-wrap">
    {%widget
    name="plan:widget/nav-grid/plan-nav.tpl"
    data=$tree
    %}
    <section class="list-page">
    <div class="loadding" id="loadding"><span></span>正在加载....</div>
    <ul class="each-item" id="listTpl">
    </ul>
    </section>
    {%widget
    name = "plan:widget/backTop/backtop.tpl"
    %}
</section>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/nav-fixed/nav-fixed.tpl"%}
{%/block%}