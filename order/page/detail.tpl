{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="order:static/detail/detail.scss"%}
    {%require name="order:static/detail/detail.js"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="ordertail">
        <div class="grid top">
            <div class="border-line">
                {%assign var="mainorders" value=current($order.order)%}
                <p>订单状态：<span class="redcolor status">{%$mainorders[0].format_status%}</span></p>
                <p>订单编号：{%$order.mainOrder.order_number%}</p>
                <p class="ordertime">订单时间：{%$order.mainOrder.order_time%}</p>
            </div>
            <a href="/ucenter/address" class="address">
                <div class="user fn-clearfix">
                    <div class="username fn-fl">{%$order.mainOrder.address_attr.name%}</div>
                    <div class="usermobile fn-fl">{%$order.mainOrder.address_attr.mobile%}</div>
                </div>
                <p>
                    收货地址：{%$order.mainOrder.address_attr.region%}{%$order.mainOrder.address_attr.street%}
                </p>
                <p>身份证：{%$order.mainOrder.address_attr.identity_number|strReplace:"*":3%}</p>
            </a>
        </div>
        <div class="grid content">
            {%foreach from=$order.order key=orderkey item=orderitem name="list"%}                                               
                {%foreach $orderitem as $orderlist name="foo"%}
                    {%if ($smarty.foreach.foo.index == 0)%}
                        <a class="shipping-info" order-number="{%$orderlist.order_number%}" domestic-order-number="{%$orderlist.domestic_order_number%}" href="http://m.kaluli.com/order/orderLogistics/order_number/{%$order.mainOrder.order_number%}">
                            <i>运单{%$smarty.foreach.list.iteration%}</i>
                        </a>
                    {%/if%} 
                    {%widget 
                        name="ucenter:widget/myorderList/myorderList.tpl"
                        data=$orderlist
                    %} 
                    {%if $smarty.foreach.foo.total == $smarty.foreach.foo.iteration%}
                    <div class="grid btn">
                        {%if ($order.status[$orderkey]|checkArrSame:0 == 1 && $order.pay_status[$orderkey]|checkArrSame:0 == 1 ) %}    
                            <a data-orderNumber="{%$orderlist.order_number%}" href="javascript:void(0);" class="btn paylink redcolor">立即付款</a>
                            <a href="javascript:void(0);" order-number="{%$orderlist.order_number%}" class="btn cancel">取消订单</a>                             
                        {%elseif ($order.status[$orderkey]|checkArrSame:1 == 1 && $order.pay_status[$orderkey]|checkArrSame:1 == 1 )%}
                            <a order-number="{%$orderlist.order_number%}" domestic-order-number="{%$orderlist.domestic_order_number%}" href="javascript:void(0);" class="btn redcolor confirm">确认收货</a>
                            <a href="http://m.kaluli.com/order/orderLogistics/order_number/{%$orderlist.order_number%}" class="btn">查看物流</a>      
                        {%/if%} 
                    </div>
                    {%/if%}
                {%/foreach%}                                
            {%/foreach%}      
        </div>      
        <div class="grid bottom">
            <div class="border-line fn-clearfix">
                <div class="fn-fl">运费</div>
                <div class="fn-fr">¥{%$order.mainOrder.express_fee%}</div>
            </div>
            <div class="border-line fn-clearfix">
                <div class="fn-fl">实付款(含运费)</div>
                <div class="fn-fr redcolor">¥{%$order.mainOrder.total_price%}</div>
            </div>
        </div>                
    </section>
    <input type="hidden" id="wx_code" value="{%$wx_code%}">
    <input type="hidden" id="wx_openid" value="{%$wx_openid%}">
    {%script%}
        $('.shipping-info').each(function(){
            var order_number = $(this).attr('order-number');
            var express_number = $(this).attr('domestic-order-number');
            var _this = $(this);
            $.getJSON("/api/getOrderLogistics",{order_number:order_number,express_number:express_number},function(json){
                var lastindex = json.data.length - 1;
                var str = '<p><span>'+json.data[lastindex].event+'</span><span>'+json.data[lastindex].time+'</span></p>';
                _this.append(str);
            });        
        });
    {%/script%}
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}