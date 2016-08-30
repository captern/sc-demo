{%extends file="common/page/layout.tpl"%}


{%block name="block_head_static"%}
{%require name="order:static/confirm/confirm.scss"%}
{%require name="order:static/lingyuangou/lingyuangou.js"%}
{%/block%}
{%block name="content"%}
{%block name="header"%}
{%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<section class="confirm-order">
    {%widget
    name="order:widget/address/address.tpl"
    data=$address
    %}
    {%if (!empty($item))%}
    <div id="sh" class="order-list">
        <h4>上海发货</h4>
        <a href="javascript:void(0);" class="fn-clearfix progrid" target="_blank">
            <div class="img"><img  src="{%$item.pic%}" /></div>
            <div class="info">
                <p>{%$item.title%}</p>
                {%if (isset($item.attr)&&!empty($item.attr))%}
                {%foreach from=$item.attr.attr item=attritem key=attrkey%}
                <p>{%$attritem%}</p>
                {%/foreach%}
                {%/if%}
            </div>
            <div class="price">
                <p>¥{%$express.price%}</p>
                <p>x{%$express.number%}</p>
            </div>
        </a>
        <div class="grid fn-clearfix grid-logistics ">
            <div class="logistics-info">全场圆通包邮</div>
            <ul>
                <li class="checked">圆通快递&nbsp;&nbsp;运费&nbsp;:&nbsp;免邮</li>
            </ul>
        </div>
    </div>
    {%/if%}

    <div class="fixd-grid fn-clearix">
        <div class="fn-fl">
            <p>实付款：¥<span id="totalprice">0</span></p>
            <p class="pay-detail">
                总额:¥<span class="price-id-1">0</span>-活动:¥<span class="price-id-2">0</span>-优惠券:¥<span class="price-id-3">0</span>
            </p>
        </div>
        <div class="fn-fr"><a class="submit-btn" href="javascript:void(0);">立即下单</a></div>
    </div>
    <input type="hidden" id="cart_data" value="{%$cart_data%}">
</section>
{%/block%}