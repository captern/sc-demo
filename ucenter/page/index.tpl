{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="ucenter:static/index/index.scss"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="ucenter-index">
        <div class="top">
             <div class="img">
                {%if (!empty($_User.uid))%}
                    <img src="http://bbs.hupu.com/bbskcy/api_new_image.php?type=big&uid={%$_User.uid%}" />
                {%else%}
                    <img src="/static/index/default_portrait.png" />
                {%/if%}                
            </div>
            <div class="grid">
                {%if (!empty($_User.uid))%}
                    <h3>{%$_User.username%}</h3>
                {%else%}
                    <p><a class="unlogin" href="{%$_Config.login_url%}">登录</a>|<a class="register" href="{%$_Config.reg_url%}">注册</a></p>
                {%/if%}          
            </div>             
        </div>
        <section class="order">     
            <a href="/ucenter/order/" class="title">我的订单{%if (isset($orderCount)&&!empty($orderCount))%}<span>{%$orderCount.all%}</span>{%/if%}</a>
            <ul class="fn-clearfix">
                <li><a href="{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendpay!=0)%}/ucenter/order/#pendpay{%else%}javascript:void(0);{%/if%}">待付款{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendpay!=0)%}<span>{%$orderCount.pendpay%}</span>{%/if%}</a></li>
                <li><a href="{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendsend!=0)%}/ucenter/order/#pendsend{%else%}javascript:void(0);{%/if%}">待发货{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendsend!=0)%}<span>{%$orderCount.pendsend%}</span>{%/if%}</a></li>
                <li><a href="{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendreceipt!=0)%}/ucenter/order/#pendreceipt{%else%}javascript:void(0);{%/if%}">待收货{%if (isset($orderCount)&&!empty($orderCount)&&$orderCount.pendreceipt!=0)%}<span>{%$orderCount.pendreceipt%}</span>{%/if%}</a></li>
            </ul>
        </section>
        <section class="address">
            <a href="/ucenter/address" class="title">收货地址</a>
        </section>
        <section class="coupon">
            <a href="/ucenter/mylipinka" class="title">我的优惠券{%if (isset($couponCount))%}<span>{%$couponCount%}张可用</span>{%/if%}</a>
        </section>
        <section class="kefu">
            <a href="http://www.kaluli.com/kefu" target="_blank" class="title">客服</a>
        </section>
    </section>
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}
