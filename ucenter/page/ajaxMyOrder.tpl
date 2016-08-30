{%if (!empty($orders))%}
    {%foreach $orders as $item%}
        <div class="order-grid">
            <div class="ordertop">
                <div class="p">订单号:{%$item.main_order.order_number%}</div>
                <div class="p">{%$item.main_order.order_time|cut:10%}</div>                   
                {%if ($item.order.status|count == 1)%}                     
                {%foreach $item.order.status as $statuskey=>$suborder %}                           
                    {%if ($suborder[0]|subOrderStatus:$item.main_order.status|orderstatus != "")%}
                        {%assign var=orderStatus value=current($item.order.item[$statuskey])%}
                        <div data-status="{%$suborder[0]|subOrderStatus:$item.main_order.status%}" class="status">{%$orderStatus.format_status%}</div>   
                        {%assign var="showsubOrderStatus" value="0"%}
                    {%else%}
                        {%assign var="showsubOrderStatus" value="1"%}
                    {%/if%}                     
                {%/foreach%}     
                {%/if%}                
            </div>              
            {%foreach from=$item.order.item item=orderitem key=orderkey name=foo%}  
                {%if ($smarty.foreach.foo.total > 1)%} 
                    {%assign var="suborders" value=current($orderitem) %}   
                    <div class="borderline" {%if ($smarty.foreach.foo.index != 0)%}style="border-top:1px solid #e5e5e5;"{%/if%}>运单{%$smarty.foreach.foo.iteration%}<div class="status">{%$suborders.format_status%}</div></div>  
                {%/if%}                        
                <div class="orderdetail"> 
                    {%foreach $orderitem as $orderlist name="orderfoo"%}
                        {%widget 
                            name="ucenter:widget/myorderList/myorderList.tpl"
                            data=$orderlist
                        %}    
                        {%if ($smarty.foreach.orderfoo.total == $smarty.foreach.orderfoo.iteration)%}
                        <div class="clear">
                            {%if ($item.order.status[$orderkey]|checkArrSame:0 == 1 && $item.order.pay_status[$orderkey]|checkArrSame:0 == 1 ) %}
                                <a data-orderNumber="{%$item.main_order.order_number%}" href="javascript:void(0);" class="btn paylink redcolor">立即付款</a>
                                <a href="javascript:void(0);" order-number="{%$item.main_order.order_number%}" class="btn cancel">取消订单</a>                             
                            {%elseif ($item.order.status[$orderkey]|checkArrSame:1 == 1 && $item.order.pay_status[$orderkey]|checkArrSame:1 == 1 )%}
                                <a order-number="{%$item.main_order.order_number%}" domestic-order-number="{%$orderlist.domestic_order_number%}" href="javascript:void(0);" class="btn redcolor confirm">确认收货</a>
                                <a href="http://m.kaluli.com/order/orderLogistics/order_number/{%$item.main_order.order_number%}" class="btn">查看物流</a>      
                            {%/if%}  
                            
                        </div>   
                        {%/if%}         
                    {%/foreach%}                                                    
                </div>                    
            {%/foreach%}
            <div class="orderinfo fn-clearfix">
                <div class="fn-fl">共<em>{%$item.main_order.number%}</em>件商品</div>
                <div class="fn-fr">运费:<em>¥{%$item.main_order.express_fee%}</em>&nbsp;&nbsp;合计:<em>¥{%$item.main_order.total_price%}</em></div>
            </div>
        </div>    
    {%/foreach%}
    <div class="loadding" id="loadding"><span></span>正在加载....</div>
{%else%}

{%/if%}