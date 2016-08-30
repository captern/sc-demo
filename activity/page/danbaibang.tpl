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
    <img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img1.jpg?20150930" />
    <img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img2.jpg?20150930" />
    <a href="http://m.kaluli.com/product/24.html"><img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img3.jpg?20151023" /></a>
    <img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img4.jpg?20150930" />
    <a href="http://m.kaluli.com/product/15.html"><img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img5.jpg?20151023" /></a>
    <img src="http://sh1.hoopchina.com.cn/images/kaluli/activity/danbaibang/img6.jpg?20150930" />
</div>
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}