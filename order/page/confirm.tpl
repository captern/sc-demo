{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="order:static/confirm/confirm.scss"%}
    {%require name="order:static/confirm/confirm.js"%}
{%/block%}

{%block name="content"%}
    <div>
        <style>
            .normalheader{
                height: 2.25rem;
                width: 100%;
                border-bottom:1px solid #e5e5e5;
                background-color: #FFFFFF;
                position: relative;
            }
            .normalheader h3{
                font-size: 0.9rem;
                line-height: 1rem;
                padding-top: 0.625rem;
                text-align: center;
            }
        </style>
        <div class="normalheader">
            <h3>{%$_Seo.pageTitle%}</h3>
        </div>
    </div>
    <section class="confirm-order">
        {%widget
            name="order:widget/address/address.tpl"
            data=$address
        %}
        {%if (!empty($item))%}
        <div id="{%$express['ware']['area_name']%}" class="order-list">
            <h4>{%$express['ware']['name']%}</h4>
            <a href="/product/{%$item.id%}.html" class="fn-clearfix progrid" target="_blank">
                <div class="img"><img  src="{%$item.pic%}" /></div>
                <div class="info">
                    <p>{%$item.title%}</p>
                    {%if (isset($item.attr)&&!empty($item.attr))%}
                    {%foreach from=$item.attr item=attritem key=attrkey%}
                        <p>{%$attritem%}</p>
                    {%/foreach%}
                    {%/if%}
                    {%if (isset($express['activity']['goods_info'][$skuId]) && $express['activity']['goods_info'][$skuId]['activity']|count > 0)%}
                    <p class="activity-name">
                        {%foreach from=$express['activity']['goods_info'][$skuId]['activity'] key=act_k item=act_v%}
                        {%if ($act_v['mode'] == 1 && $act_v['flag'])%}
                        <span>满{%$act_v['attr1']%}减{%$act_v['attr2']%}</span>
                        {%elseif ($act_v['mode'] == 2 && $act_v['flag'])%}
                        <span>满{%$act_v['attr1']%}件打{%$act_v['attr2']/10%}折</span>
                        {%/if%}
                        {%/foreach%}
                    </p>
                    {%/if%}
                </div>
                <div class="price">
                    <p>¥{%$express.price%}</p>
                    <p>x{%$express.number%}</p>
                </div>
            </a>
            {%if (!empty($neworderitem))%}
            <a href="/product/{%$neworderitem.item.id%}.html" class="fn-clearfix progrid" target="_blank">
                <div class="img"><img src="{%$neworderitem.item.pic%}" /></div>
                <div class="info">
                    <p>{%$neworderitem.item.title%}</p>
                    {%if (isset($neworderitem.sku.attr)&&!empty($neworderitem.sku.attr))%}
                    {%assign var="_attr" value=unserialize($neworderitem.sku.attr) %}
                    {%foreach from=$_attr item=attritem key=attrkey%}
                    <p>{%$attrkey%}:{%$attritem%}</p>
                    {%/foreach%}
                    {%/if%}
                    <p class="activity-name">
                        <span>赠品</span>
                    </p>
                </div>
                <div class="price">
                    <p>¥0</p>
                    <p>x1</p>
                </div>
            </a>
            {%/if%}
            <div class="grid fn-clearfix grid-logistics {%if ($express['ware']['freight_type']==1)%}logistics{%/if%}">
                {%if ($express['ware']['freight_type']==1)%}
                <div class="logistics-info">全场圆通包邮/加<span id="shunfeng_tips">{%$express.shunfeng_freight%}</span>元享顺丰快递</div>
                {%/if%}
                <ul>
                    {%if ($express['ware']['freight_type']==1)%}
                    <li data-type="4" class="checked">圆通快递&nbsp;&nbsp;运费&nbsp;:&nbsp;免邮</li>
                    <li data-type="2">顺丰快递&nbsp;&nbsp;运费&nbsp;:&nbsp;<span id="shunfeng">{%if ($express.shunfeng_freight==0)%}免邮{%else%}{%$express.shunfeng_freight%}元{%/if%}</span></li>
                    {%else%}
                    <li class="checked">圆通快递&nbsp;&nbsp;运费&nbsp;:&nbsp;免邮</li>
                    {%/if%}
                </ul>
            </div>
        </div>
        {%/if%}
        {%if (!empty($lipinka))%}
        <div class="grid fn-clearfix cupon">
            {%if (isset($lipinkaOne)&&!empty($lipinkaOne))%}
                <div class="title">优惠券</div>
                <!--<input id ="cupon-txt" name="cupon" type="text" placeholder="请输入优惠口令"/>-->
                <!--<div class="cupon-confirm">确认</div>-->
                <div class="coupon-box">
                        {%if (!empty($lipinkaOne.card_limit_parse))%}
                            满{%$lipinkaOne.card_limit_parse.order_money%}元减{%$lipinkaOne.amount%}元
                        {%else%}
                            {%$lipinkaOne.amount%}元
                        {%/if%}
                </div>
                <div class="coupon-mask">
                    <div class="coupon-collapse">
                        <h4>共{%$lipinka|count%}张优惠券</h4>
                        <ul>
                            {%foreach from=$lipinka item=card name=lipinlist%}
                            {%if ($card.flag)%}
                                <li data-cardid="{%$card.id%}">
                                <p class="p1">
                                    {%if (isset($card.card_limit)&&!empty($card.card_limit))%}
                                    满{%$card.card_limit_parse.order_money%}元减{%$card.amount%}元
                                    {%else%}
                                    {%$card.amount%}元
                                    {%/if%}
                                </p>
                                <p>有效期至:{%$card.etime|date_format:'%Y-%m-%d'%}</p>
                                <div class="coupon-tips"></div>
                                </li>
                            {%/if%}
                            {%/foreach%}
                            <li>
                                <p class="p1">不使用优惠</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="cupon-intro error-info"><span id="cupon-error-txt">此优惠券不存在</span></div>
                <div class="cupon-intro confirm-info">优惠券可用</div>
            {%/if%}
        </div>
        {%/if%}
        <div class="grid fn-clearfix paytype">
            <div>支付方式</div>
            <ul>
                {%if ($payType == "微信")%}
                    <li class="checked" data-type="weixin"><span class="icon-weixin"></span>微信支付</li>
                {%else%}
                     <li class="checked" data-type="zhifubao"><span class="icon-zhifubao"></span>支付宝支付</li>
                {%/if%}
            </ul>
        </div>
        <div class="txt">
            <p>如有特殊要求，请备注说明，没有不需填写</p>
            <textarea id="textatea-shuoming"></textarea>
        </div>
        <div class="fixd-grid fn-clearix">
            <div class="fn-fl">
                <p>实付款：¥<span id="totalprice">{%$express.total_price%}</span></p>
                <p class="pay-detail">
                    总额:¥<span class="price-id-1">{%$express.original_price%}</span>-活动:¥<span class="price-id-2">{%$express.activity.activity_save%}</span>-优惠券:¥<span class="price-id-3">{%if (isset($lipinkaOne)&&!empty($lipinkaOne.amount))%}{%$lipinkaOne.amount%}{%else%}0{%/if%}</span>
                </p>
            </div>
            <div class="fn-fr"><a class="submit-btn" href="javascript:void(0);">立即支付</a></div>
        </div>
        <input type="hidden" id="sku_id" value="{%$skuId%}">
        <input type="hidden" id="item_id" value="{%$item.id%}">
        <input type="hidden" id="order_number" value="{%$express.number%}">
        <input type="hidden" id="wx_code" value="{%$wx_code%}">
        <input type="hidden" id="wx_openid" value="{%$wx_openid%}">
    </section>
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}