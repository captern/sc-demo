{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="activity:static/maiyisongyi/index.scss"%}
    {%require name="common:static/js/underscore/underscore.js"%}
    {%require name="activity:static/maiyisongyi/data.js"%}
    {%require name="activity:static/maiyisongyi/index.js"%}
{%/block%}

{%block name="content"%}
    <section class="pagewrap">
        <div class="head"><img src="/static/maiyisongyi/head.jpg" /></div>
        <div class="content">
            <script id="tpl" type="text/template">
                <div class="grid">
                    <h3 class="title"><@= title @></h3>
                    <ul class="fn-clearfix">
                        <@ for (var s=0;s<prolist.length;s++){@>
                        <li>
                            <a href="<@= prolist[s].link @>">
                                <div class="img">
                                    <img alt="<@= prolist[s].proname @>" class="lazy" data-original="<@= prolist[s].imgsrc @>" />
                                </div>
                                <div class="proname"><@= prolist[s].proname @></div>
                                <div class="proprice"><i>¥</i><@= prolist[s].proprice @></div>
                                <div class="btn">立即购买</div>
                            </a>
                        </li>
                        <@ } @>
                    </ul>
                </div>
            </script>
        </div>
    </section>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}