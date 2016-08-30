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
    <img src="/static/activity1016-image1.jpg" />
    <a href="http://m.kaluli.com/product/24.html#qk=detail&page=1&order=6"><img src="/static/activity1016-image2.jpg" /></a>
    <a href="http://m.kaluli.com/product/5.html#qk=detail&page=1&order=5" ><img src="/static/activity1016-image3.jpg" /></a>
    <a href="http://m.kaluli.com/product/79.html#qk=detail&page=1&order=3" ><img src="/static/activity1016-image4.jpg" /></a>
    <a href="http://m.kaluli.com/product/1.html#qk=detail&page=1&order=11" ><img src="/static/activity1016-image5.jpg" /></a>
    <a href="http://m.kaluli.com/product/13.html#qk=detail&page=1&order=5" ><img src="/static/activity1016-image6.jpg" /></a>
    <a href="http://m.kaluli.com/product/25.html#qk=detail&page=1&order=5" ><img src="/static/activity1016-image7.jpg" /></a>
</div>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}