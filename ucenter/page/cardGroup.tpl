{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="ucenter:static/cardGroup/newUserCoupon.scss"%}
    {%require name="ucenter:static/cardGroup/newUserCoupon.js"%}
{%/block%}

{%block name="content"%}
    <div class="content">
    <div class="page2">
        <section>
            <div class="top">领取组合优惠券</div>
            <div class="grid">
                <input name="couponid" type="text" placeholder="请输入礼品卡号" />
            </div>
            <div class="grid">
                <p>
                    <input name="identify" type="text" placeholder="请输入验证码">
                    <img class="identify-img" src="http://www.kaluli.com/api/verify" >
                    <span class="refresh">刷新</span>
                </p>
                <p class="errorinfo">输入验证码有误,请重新输入</p>
            </div>
            <div class="btn fn-clearfix">
                <button class="confirm">领取</button>
                <button class="cancel">取消</button>
            </div>
            <article>
                <h3>兑换方式</h3>
                <ul>
                    <li>输入卡号前先登录或注册，输入兑换码卡号 + 验证码，领取优惠券；</li>
                    <li>领取成功后可至 <a href="http://m.kaluli.com/ucenter/mylipinka">个人中心 - 我的优惠券</a> 查看</li>
                    <li>使用方式至<a href="http://m.kaluli.com/">卡路里首页</a></li>
                    <li>有效期为派发之日起15日内有效；一个订单仅可使用一张优惠券，且不与其他优惠同享</li>
                </ul>

            </article>
        </section>
        <div class="bottom-img">
            <img width="100%" src="../static/cardGroup/bottom.jpg" />
        </div>
    </div>
    </div>
{%/block%}





