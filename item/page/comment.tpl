{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
    {%require name="item:static/comment/comment.scss"%}  
    {%require name="item:static/comment/comment.js"%}  
{%/block%}
{%block name="content"%}
    {%block name="header"%}
    {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <div class="orderComment">
        <div class="product">
            <a class="link-block" href="http://m.kaluli.com/product/{%$product_id%}.html">
                <div class="imgs"><img src="{%$img%}" alt=""></div>
                <div class="details_box">
                    <h2>{%$title%}</h2>
                    {%foreach $attr as $item =>$val%}<p class="size">{%$item%}:{%$val%}</p>{%/foreach%}
                </div>
                <div class="price">
                    <p><i>¥</i>{%$price%} </p>
                    <p><span>x{%$num%}</span></p>
                </div>
            </a>
        </div>
        <div class="tags">
            <div class="tit">标签：</div>
            <div class="tag">
                {%foreach $tags as $item%} <a href="javascript:void(0);" data-id="{%$item.id%}">{%$item.name%}</a>{%/foreach%}
            </div>
            <div class="comment">
                <div class="tit">评价：</div>
                <textarea name="" id="content" maxlength="300" rows="6" placeholder="亲,给其他小伙伴提供一些参考吧,字数限制10-300字之间.."></textarea>
            </div>
        </div>
        <div class="submit"><a href="javascript:void(0);" id="postComment" data-ordername="{%$order_number%}" data-productid="{%$product_id%}" data-goodsid="{%$goods_id%}" >发表评论</a></div>
    </div>
{%/block%}