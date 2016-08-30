{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="ucenter:static/address/address.scss"%}
    {%require name="ucenter:static/address/address.js"%}
{%/block%}

{%block name="content"%}
    <div class="normalheader">
        <div class="back-link"><img src="../static/address/back-icon.png" /></div>
        <h3>{%$_Seo.pageTitle%}</h3>
    </div>
{%script%}
(function($){
$(".back-link").on("tap",function(){
    if($('.ucenter-address').attr('data-url') == ''){
        window.location.href = "http://m.kaluli.com/ucenter"
    }else{
        window.location.href = $('.ucenter-address').attr('data-url');
    }
});
})(Zepto)
{%/script%}

    <section data-url="{%if (isset($jumpUrl)&&!empty($jumpUrl))%}{%$jumpUrl%}{%/if%}" class="ucenter-address">
        {%if (isset($address)&&!empty($address))%}
        {%foreach $address as $item%}
            <div data-id="{%$item.id%}" class="grid">
                <div class="address">
                    <div class="user fn-clearfix">
                        <div class="username fn-fl">{%$item.name%}</div>
                        <div class="usermobile fn-fl">{%$item.mobile%}</div>
                    </div>
                    <p>
                        收货地址：{%$item.region%}{%$item.street%}
                    </p>
                    <p>身份证：{%$item.identity_number|strReplace:"*":3%}</p>
                </div>
                <div class="action fn-clearfix">
                    <div class="{%if ($item.defaultflag == 1)%}default{%/if%} checkbox">默认地址</div>
                    <div class="fn-fr">
                        <a href="/ucenter/editAddress?address_id={%$item.id%}&jumpUrl={%$jumpUrl%}">编辑</a>&#124;<a class="delete" href="javascript:void(0);">删除</a>
                    </div>
                </div>
            </div>
        {%/foreach%}   
        {%/if%}     
        <a href="/ucenter/editAddress?jumpUrl={%$jumpUrl%}" class="addBtn">新增地址</a>
    </section>
{%/block%}