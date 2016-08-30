<div class="bottom-title-fixed">
    <ul class="clearfix">            
        <li><a href="/product"><span>全部商品</span></a></li>
        <li><a href="{%if (isset($_User )&&!empty($_User))%}/ucenter{%else%}/{%/if%}"><span>我的卡路里</span></a></li>
        <li><a href="{%if (isset($_User )&&!empty($_User))%}/order/cart{%else%}/{%/if%}"><span>购物车</span></a></li>
        <li><a href="/faq"><span>关于我们</span></a></li>
    </ul>
</div>