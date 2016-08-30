{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="ucenter:static/coupon/coupon.scss" %}
{%require name="ucenter:static/coupon/coupon.js" %}
{%/block%}

{%block name="content"%}
{%block name="header"%}
{%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<div id="getCoupon" class="getCoupon">兑换码</div>
<div class="mycoupon">
    <ul>
        {%foreach from=$lipinka item=coupon%}
        <li>
            <div class="coupon-info">
                <p>卡路里优惠券</p>
                {%if (isset($coupon.card_limit_parse)&&!empty($coupon.card_limit_parse))%}
                    <p>满{%$coupon.card_limit_parse.order_money%}减{%$coupon.amount%}</p>
                {%else%}
                    <p>{%$coupon.amount%}</p>
                {%/if%}
                <p>有效期至：{%$coupon.etime|date_format:'%Y-%m-%d'%}</p>
            </div>
            <div class="coupon-price"><i>{%$coupon.amount%}</i>元</div>
        </li>

        {%/foreach%}
    </ul>
</div>
<div class="form-coupon">
    <div class="row">
        兑换码：
        <input type="text" name="coupon_text" placeholder="请输入您的兑换码"/>
        <div class="clear-btn"></div>
    </div>
    <div class="row">
        兑换码：
        <input type="text" name="validate_num" placeholder="验证码"/>
        <img class="validate_img" data-href="http://www.kaluli.com/api/captcha" src="http://www.kaluli.com/api/captcha">
        <div class="refresh-btn"></div>
    </div>
    <div class="submit-btn">马上兑换</div>
</div>
{%/block%}
{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}