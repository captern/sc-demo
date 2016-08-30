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
    <img src="/static/activity1026-images1.jpg" />
    <a href="http://m.kaluli.com/product/34.html"><img src="/static/activity1026-images2.jpg" /></a>
    <a href="http://m.kaluli.com/product/105.html" ><img src="/static/activity1026-images3.jpg" /></a>
    <a href="http://m.kaluli.com/product/42.html" ><img src="/static/activity1026-images4.jpg" /></a>
    <a href="http://m.kaluli.com/product/76.html" ><img src="/static/activity1026-images5.jpg" /></a>
    <a href="http://m.kaluli.com/product/100.html" ><img src="/static/activity1026-images6.jpg" /></a>
    <a href="http://m.kaluli.com/product/44.html" ><img src="/static/activity1026-images7.jpg" /></a>
</div>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}