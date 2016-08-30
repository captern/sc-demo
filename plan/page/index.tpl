{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
{%require name="plan:static/plan/index.scss"%}
{%require name="plan:static/plan/index.js"%}
{%/block%}
{%block name="content"%}
    <section class="index-wrap">
        {%widget
        name="plan:widget/nav-grid/plan-nav.tpl"
        data=$tree
        %}
        <nav class="index-nav">
            <ul>
                {%foreach from=$navs item=indexnav key=indexnavKey%}
                {%if ({%$indexnavKey%} == 0)%}
                <li><a class="active" href="{%$indexnav.url%}">{%$indexnav.name%}</a></li>
                {%else%}
                <li><a href="{%$indexnav.url%}">{%$indexnav.name%}</a></li>
                {%/if%}
                {%/foreach%}
            </ul>
        </nav>
        <div class="floors-wrap">
            {%if !empty($_floors)%}
                {%foreach from=$_floors item=_floorsItem key=_floorsKey %}
                    {%widget
                        name="plan:widget/plans-list/plans-list.tpl"
                        data=$_floorsItem
                        key=$_floorsKey
                    %}
                {%/foreach%}
            {%/if%}
        </div>
        <div class="adviertisement">
            {%widget
            name="plan:widget/adviertisement/adviertisement.tpl"
            adviertisement=$adviertisement
            %}
        </div>
        {%widget
        name = "plan:widget/backTop/backtop.tpl"
        %}
    </section>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/nav-fixed/nav-fixed.tpl"%}
{%/block%}