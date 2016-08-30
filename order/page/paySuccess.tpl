{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="order:static/paySuccess/paySuccess.scss"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="pay-success">
        <img width="100%" src="../static/paySuccess/success.jpg" />
        {%widget
            name="order:widget/address/address.tpl"
            data=$orderData.mainOrder.address_attr
        %}
        <div class="grid fn-clearfix price">
            <div class="fn-fl">实付款</div>
            <div class="fn-fr">¥{%$orderData.mainOrder.total_price%}</div>
        </div>
        <div class="grid fn-clearfix">
            <a href="/order/detail?order_number={%$orderData.mainOrder.order_number%}" class="fn-fr">查看订单</a>
            <a href="/" class="fn-fr">返回首页</a>            
        </div>
    </section>
    <img src="//cdscn.ve-interactive.cn/DataReceiverService.asmx/Pixel?journeycode=00D23162-16B5-4F4C-9DF8-2BEEE3392242" width="1" height="1"/>
{%/block%}