{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%style%}
        .pagewrap{
            width: 100%;
            margin: 0 auto;
        }
        .pagewrap img{
            width: 100%;
            display: block;
            margin: 0px;
        }
    {%/style%}
{%/block%}

{%block name="content"%}
    <div class="pagewrap">
        <img src="/static/activity20160115/img-0.jpg" />
        <img src="/static/activity20160115/img-1.jpg" />
        <img src="/static/activity20160115/img-2.jpg" />
        <img src="/static/activity20160115/img-3.jpg" />
        <a href="http://m.kaluli.com/product/209.html" ><img src="/static/activity20160115/img-4.jpg" /></a>
        <a href="http://m.kaluli.com/product/218.html" ><img src="/static/activity20160115/img-5.jpg" /></a>
        <a href="http://m.kaluli.com/product/213.html" ><img src="/static/activity20160115/img-6.jpg" /></a>
        <a href="http://m.kaluli.com/product/40.html" ><img src="/static/activity20160115/img-7.jpg" /></a>

    </div>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}