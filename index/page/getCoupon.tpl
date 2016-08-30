{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="index:static/getCoupon/getCoupon.scss" %}
{%require name="index:static/getCoupon/getCoupon.js" %}
{%/block%}

{%block name="content"%}
{%block name="header"%}
{%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<div class="mycoupon">
    <ul>
        {%foreach from=$coupons item=coupon%}
        <li>
            <div class="coupon-info">
                <p>卡路里优惠券</p>
                <p>{%if (isset($coupon.desc))%}满{%$coupon.desc%}元可用{%else%}无限制{%/if%}</p>
                {%* <p>有效期至：{%$coupon.etime|date_format:'%Y-%m-%d'%}</p> *%}
            </div>
            {%if (isset($coupon.received) && $coupon.received == 1)%}
                <div class="icon-got"></div>
                <div class="coupon-price use">
                    <i><s>¥</s>{%$coupon.amount%}</i>
                    <a href="http://m.kaluli.com/ucenter/mylipinka" data-couponid="{%$coupon.id%}" class="btn">立即使用</a>
                    <div class="icon-bg"></div>
                </div>
            {%else%}
                <div class="icon-got" style="display: none"></div>
                <div class="coupon-price">
                    <i><s>¥</s>{%$coupon.amount%}</i>
                    <div data-couponid="{%$coupon.id%}" class="btn">立即领取</div>
                    <div class="icon-bg"></div>
                </div>
            {%/if%}
        </li>

        {%/foreach%}
    </ul>
</div>
{%/block%}
{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}