{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="item:static/commentlist/commentlist.scss"%}
    {%require name="item:static/commentlist/swipe.js"%}
    {%require name="item:static/commentlist/commentlist.js"%}
   
{%/block%}
{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
<div class="loadding" id="loadding"><span></span>正在加载....</div>
<div class="orderComment">
    <div class="product">
        <div class="tag">
         {%foreach $tags as $item =>$val%} <a href="javascript:void(0);">{%$item%}({%$val%})</a>{%/foreach%}
        </div>
    </div>
    <ul class="comment-list" id="commentList" data-page="1" data-pid="{%$product_id%}">
    </ul>
</div>
<div class="showImgs">
    <div id='mySwipe' style='max-width:100%;margin:0 auto' class='swipe'>
      <div class='swipe-wrap'></div>
    </div>
    <div class="slider-status" id="position"></div>
</div>
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}