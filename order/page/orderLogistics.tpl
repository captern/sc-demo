{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="order:static/orderLogistics/orderLogistics.scss"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="pagewrap">
        {%foreach $order.order as $item%}
        <div class="grid">
            <div class="title">商品信息</div>            
            {%widget 
                name="ucenter:widget/myorderList/myorderList.tpl"
                data=$item
            %}            
        </div>
        <div class="grid">
            <div class="title">物流信息</div>
            <ul domestic-order-number="{%$item.domestic_order_number%}" order-number="{%$item.order_number%}" class="logistics">                
            </ul>
        </div>
        {%/foreach%}
    </section>
    {%script%}        
        $(".logistics").each(function(){
            var order_number = $(this).attr('order-number');
            var express_number = $(this).attr('domestic-order-number');
            var $this = $(this);
            $.getJSON("/api/getOrderLogistics",{order_number:order_number,express_number:express_number},function(json){
                var str="";
                json.data.reverse();
                $.each(json.data,function(i){
                    str += '<li><p>'+json.data[i].event+'</p><p>'+json.data[i].time+'</p></li>';
                });
                $this.html(str);
            });        
        });        
    {%/script%}
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}