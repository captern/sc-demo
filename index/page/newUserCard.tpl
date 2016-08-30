{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="index:static/newUserCard/newUserCard.scss"%}
{%require name="index:static/newUserCard/newUserCard.js"%}
{%/block%}


{%block name="content"%}
<div class="content">
    <div class="page1">
        <div class="bg">
            <img width="100%" src="../static/newUserCard/freeies-bg0624.png" >
            <div data-loginUrl="{%$_Config.login_url%}" data-cardnumber="{%$card_group_number%}" data-received="{%$newcard_is_receive%}" class="coupon">
                <img class="receive" width="100%"  src="../static/newUserCard/get-btn.png" >
                <img width="100%" style="display: none;" class="hasreceived" src="../static/newUserCard/hasget-btn.png" >
            </div>
        </div>
        <article>
            <h3>活动规则</h3>
            <ul>
                <li>本活动仅限新注册用户在本活动页面参与，要求绑定的手机号和实名认证信息均没有在本网站使用过；</li>
                <li>每个自然人仅限参与一次活动。对于使用各种软件或其他方式作弊的用户，将不予赠送；对已赠送的，有权要求用户返还；</li>
                <li>价值50元优惠券内容：2张满188元减20元现金券 + 2张5元现金券；有效期为派发之日起15日内有效；</li>
                <li>领取成功后至<a style="color: #ecd82d;text-decoration: underline;" href="http://m.kaluli.com/ucenter/mylipinka">个人中心 - 我的优惠券</a>查看；</li>
                <li>一个订单仅可使用一张优惠券，且不与其他优惠同享</li>
                <li>本活动仅限参与一次。</li>
            </ul>
        </article>
    </div>
</div>
{%script%}
    var jumpUrl = window.location.href,
    loginUrl =  escape("{%$_Config.login_url%}")+'&jumpurl=' + jumpUrl;
{%/script%}
{%/block%}
