{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="ucenter:static/order/order.scss"%}
    {%require name="ucenter:widget/myorderList/myorderList.scss"%}
    {%require name="ucenter:static/order/order.js"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="myorder">
        <ul class="top-filter">
            <li data-type="all" data-page="1" class="cur">全部</li>
            <li data-type="pendpay" data-page="1">待付款{%if (!empty($counts))%}<span>{%$counts.pendpay%}</span>{%/if%}</li>
            <li data-type="pendsend" data-page="1">待发货{%if (!empty($counts))%}<span>{%$counts.pendsend%}</span>{%/if%}</li>
            <li data-type="pendreceipt" data-page="1">待收货{%if (!empty($counts))%}<span>{%$counts.pendreceipt%}</span>{%/if%}</li>
        </ul>
        <section id="orderlist" {%if (!empty($orders))%}data-page="1" data-type="all"{%/if%}>
            
        </section>
    </section>
<input type="hidden" id="wx_code" value="{%$wx_code%}">
<input type="hidden" id="wx_openid" value="{%$wx_openid%}">
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}