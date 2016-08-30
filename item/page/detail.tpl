{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
    {%require name="item:static/detail/detail.scss"%}
{%/block%}
{%block name="content"%}
    {%block name="header"%}
    {%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<div class="cart-box">
    <a href="/order/cart">{%$catr_number%}</a>
</div>
<div class="share-icon">
    <span>分享</span>
</div>
{%widget
name="item:widget/pdpCarousel/pdpCarousel.tpl"
data=$res.item
%}
{%if (isset($res.storehouseDefault) &&$res.storehouseDefault !="") %}
<div  id="storehouse_note" class="left-red">{%$res.storehouseDefault%}</div>
{%/if%}
<div class="product-title">
    <h3>{%$res.item.title%}</h3>
    {%if isset($res.item.review)&&$res.item.review!=""%}
    <p class="intro"><span class="yys"><img src="/static/detail/yys.png" alt="" >营养师点评：</span>{%$res.item.review%}</p> {%/if%}
    <div class="price">
        {%if isset($res.item.discount_price)%}
        <i>¥</i><span class="discount">{%$res.item.discount_price%}</span>
        <span class="original linethrough">¥<em>{%$res.item.price%}</em></span>
        {%else%}
        <i>¥</i><span class="discount">{%$res.item.price%}</span>
        {%/if%}
    </div>
</div>
{%if isset($activitys.modeName)||isset($activitys.data)%}
<div class="manjian"><a href="{%$marketing_url%}"><span class="red">{%$activitys.modeName%}</span>{%foreach $activitys.data as $item =>$val%}<span>{%$val%}</span> &nbsp;{%/foreach%}</a></div>
{%/if%}
<div class="sendadd"><div class="fl"><span></span>发货地：<s id="delivery_area">{%if isset($res.attr.detail)%}{%foreach $res.attr.detail as $item =>$val%}{%$val.storehouse_name%}&nbsp;{%/foreach%}{%/if%}</s></div> <div class="fr"><span></span>销量：{%$res.item.sales_count%} </div></div>
<div class="zhengpin"><img src="../static/detail/zp_new.png" alt="全球知名品牌100%正品" /></div>

<div class="mask" id="login-mask"></div>
<div class="loginAlert" id="loginAlert">
    <div class="inner">
        <p class="tit">请先注册，如老用户直接<a href="javascript:void(0);" class="lgn" data-href="<%= href %>" id="link-login">登录</a></p>
        <p><input type="tel" placeholder="请输入您的手机号码" maxlength="11" class="logintel"></p>
         <p class="clearfix">
            <input type="text" placeholder="验证码" class="imgyzm" id="imgyzm">
            <img src="http://www.kaluli.com/api/verify" alt="" class="pic" id="picYzm" onclick="this.src='http://www.kaluli.com/api/verify'">
         </p>
        <p class="clearfix"><input type="text" placeholder="请输入动态密码" class="loginyzm" id="loginyzm">
        <input type="button" class="sendyzm" id="sendYzm" value="发送动态密码"></p>
         <div style="clear:both;"></div>
        <p class="line"><a href="javascript:void(0)" class="btn_lkBuy" id="btn_lkBuy">立刻购买</a></p>
    </div>
</div>
{%widget name="item:widget/comment/comment.tpl" data=$res%}
{%widget
name="item:widget/switchInfo/switchInfo.tpl"
data=$res
%}
{%widget
name="item:widget/buyarea/buyarea.tpl"
%}
{%widget
name="item:widget/share/share.tpl"
%}
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}