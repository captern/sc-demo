{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="order:static/cart/cart.scss"%}
{%/block%}

{%block name="content"%}
{%block name="header"%}
{%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<div data-type="edit" class="editBtn"><span class="edit">编辑</span><span class="complete">完成</span></div>
<div class="cart-tab">
    <ul class="tabs">
        <li class="item-common item-tabs active">一般商品</li>
        <li class="item-haitao item-tabs">南沙仓</li>
        <li class="item-benniao item-tabs">笨鸟仓</li>
    </ul>
    <section id="tabs_common" class="cart-wrap tabs-common">
    {%if (!empty($cartList))%}
        {%foreach from=$cartList key=cartkey item=cart%}
            {%if ($cartkey == 1)%}
                <div class="activity-info">
                    {%if ($totalData['activity']['activity']['1']['list'])%}
                    <div  class="activity-icon">满减</div>
                    <a id="discount-1" href="http://m.kaluli.com/product?aid=1">
                        {%assign var='mj_content' value=""%}
                            {%foreach from=$totalData['activity']['activity']['1']['list'] key=mj_key item=mj_value%}
                                {%assign var="mj_content" value=$mj_content|cat:'全场满¥'|cat:$mj_value['attr1']|cat:'减¥'|cat:$mj_value['attr2']|cat:','%}
                            {%/foreach%}
                            {%$mj_content|substr:0:-1%}
                        （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                    </a>
                    {%/if%}
                </div>
            {%elseif ($cartkey == 2)%}
                <div  class="activity-info">
                    {%if ($totalData['activity']['activity']['2']['list'])%}
                    <div class="activity-icon">折扣</div>
                    <a id="discount-2" href="http://m.kaluli.com/product?aid=2">
                            {%assign var='zk_content' value=""%}
                            {%foreach from=$totalData['activity']['activity']['2']['list'] item=zk_value%}
                                {%assign var='zk_content' value=$zk_content|cat:'满'|cat:$zk_value['attr1']|cat:'件'|cat:$zk_value['attr2']/10|cat:'折,'%}
                            {%/foreach%}
                            {%$zk_content|substr:0:-1%}

                        （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                    </a>
                    {%/if%}
                </div>
            {%else%}
                <div class="activity-info no-arrow"></div>
            {%/if%}
            <ul class="cart-list common-cart-list">
                {%foreach $cart as $item%}
                {%if ($item.status == 1)%}
                <li data-stock="false">
                    <div class="fn-fl">
                        <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                    </div>
                    <div class="fn-fr">
                        {%widget
                        name="order:widget/cartlist/cartlist.tpl"
                        data=$item
                        %}
                    </div>
                </li>
                {%else%}
                <li id="goods-{%$item.goods_id%}" data-stock="true" class="choosewrap" data-checked="false"
                    gid="{%$item.goods_id%}" gilist="{%$item.goods_id%}">
                    <div class="fn-fl">
                        <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                    </div>
                    <div class="fn-fr">
                        {%widget
                        name="order:widget/cartlist/cartlist.tpl"
                        data=$item
                        %}
                    </div>
                </li>
                {%/if%}
                {%/foreach%}
            </ul>
        {%/foreach%}
        {%if (isset($neworderitem)&&!empty($neworderitem))%}
            <ul class="cart-list freebies">
            <li>
                <div class="fn-fl">
                    <img src="{%$neworderitem.item.pic%}" alt="{%$neworderitem.item.title%}" />
                </div>
                <div class="fn-fr">
                    <div class="static">
                        <p class="title"><span class="freebies-tip">赠品</span>{%$neworderitem.item.title%}</p>
                        <p class="sku">
                            {%if (isset($neworderitem.attr.attr)&&!empty($neworderitem.attr.attr))%}
                            {%foreach from=$neworderitem.attr.attr item=skuitem key=skukey%}
                            <span>{%$skukey%}：{%$skuitem%}</span>
                            {%/foreach%}
                            {%/if%}
                        </p>
                        <div class="price fn-clearfix">
                            <div class="pro-price" class="fn-fl">¥{%$neworderitem.item.price%}</div>
                            <div class="pro-number" class="fn-fr">x1</div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        {%/if%}
    {%/if%}
        <p class="warinng" id="">2000元以上订单,暂不支持购买</p>

        <div class="fixedBtn fn-clearfix">
        <div class="fn-fl">
            <div data-checked="false" class="checkall">全选</div>
            <div class="price-area">
                <p>总计：¥<s class="price-id-1">0</s></p>
                <p>总额:¥<span class="price-id-3">0</span>-优惠:<span class="price-id-4">0</span></p>
            </div>

        </div>
        <div class="fn-fr">
            <div class="input-true">去结算(<span class="price-id-2">0</span>)</div>
            <div class="input-false">提交中...</div>
            <input id="submit-all" type="submit"/>
        </div>
    </div>
</section>

    <section id="tabs_haitao" class="cart-wrap hidden tabs-haitao">
        {%if (!empty($haitaoCartList))%}
            {%foreach from=$haitaoCartList key=cartkey item=cart%}
                {%if ($cartkey == 1)%}
                    <div class="activity-info">
                        {%if ($haitaoTotalData['activity']['activity']['1']['list'])%}
                            <div  class="activity-icon">满减</div>
                            <a id="discount-1" href="http://m.kaluli.com/product?aid=1">
                                {%assign var='mj_content' value=""%}
                                {%foreach from=$haitaoTotalData['activity']['activity']['1']['list'] key=mj_key item=mj_value%}
                                    {%assign var="mj_content" value=$mj_content|cat:'全场满¥'|cat:$mj_value['attr1']|cat:'减¥'|cat:$mj_value['attr2']|cat:','%}
                                {%/foreach%}
                                {%$mj_content|substr:0:-1%}
                                （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                            </a>
                        {%/if%}
                    </div>
                {%elseif ($cartkey == 2)%}
                    <div  class="activity-info">
                        {%if ($haitaoTotalData['activity']['activity']['2']['list'])%}
                            <div class="activity-icon">折扣</div>
                            <a id="discount-2" href="http://m.kaluli.com/product?aid=2">
                                {%assign var='zk_content' value=""%}
                                {%foreach from=$haitaoTotalData['activity']['activity']['2']['list'] item=zk_value%}
                                    {%assign var='zk_content' value=$zk_content|cat:'满'|cat:$zk_value['attr1']|cat:'件'|cat:$zk_value['attr2']/10|cat:'折,'%}
                                {%/foreach%}
                                {%$zk_content|substr:0:-1%}

                                （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                            </a>
                        {%/if%}
                    </div>
                {%else%}
                    <div class="activity-info no-arrow"></div>
                {%/if%}
                <ul class="cart-list haitao-cart-list">
                    {%foreach $cart as $item%}
                        {%if ($item.status == 1)%}
                            <li data-stock="false">
                                <div class="fn-fl">
                                    <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                                </div>
                                <div class="fn-fr">
                                    {%widget
                                    name="order:widget/cartlist/cartlist.tpl"
                                    data=$item
                                    %}
                                </div>
                            </li>
                        {%else%}
                            <li id="goods-{%$item.goods_id%}" data-stock="true" class="choosewrap" data-checked="false"
                                gid="{%$item.goods_id%}" gilist="{%$item.goods_id%}">
                                <div class="fn-fl">
                                    <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                                </div>
                                <div class="fn-fr">
                                    {%widget
                                    name="order:widget/cartlist/cartlist.tpl"
                                    data=$item
                                    %}
                                </div>
                            </li>
                        {%/if%}
                    {%/foreach%}
                </ul>
            {%/foreach%}
            {%if (isset($neworderitem)&&!empty($neworderitem))%}
                <ul class="cart-list  freebies">
                    <li>
                        <div class="fn-fl">
                            <img src="{%$neworderitem.item.pic%}" alt="{%$neworderitem.item.title%}" />
                        </div>
                        <div class="fn-fr">
                            <div class="static">
                                <p class="title"><span class="freebies-tip">赠品</span>{%$neworderitem.item.title%}</p>
                                <p class="sku">
                                    {%if (isset($neworderitem.attr.attr)&&!empty($neworderitem.attr.attr))%}
                                        {%foreach from=$neworderitem.attr.attr item=skuitem key=skukey%}
                                            <span>{%$skukey%}：{%$skuitem%}</span>
                                        {%/foreach%}
                                    {%/if%}
                                </p>
                                <div class="price fn-clearfix">
                                    <div class="pro-price" class="fn-fl">¥{%$neworderitem.item.price%}</div>
                                    <div class="pro-number" class="fn-fr">x1</div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            {%/if%}
        {%/if%}
        {%*<p class="warinng">2000元以上订单需支付税费,合计<b>0</b>元</p>*%}
        <div class="fixedBtn fn-clearfix">
            <div class="fn-fl">
                <div data-checked="false" class="checkall">全选</div>
                <div class="price-area">
                    <p>总计：¥<s class="price-id-1">0</s></p>
                    <p>总额:¥<span class="price-id-3">0</span>-优惠:<span class="price-id-4">0</span></p>
                </div>

            </div>
            <div class="fn-fr">
                <div class="input-true">去结算(<span class="price-id-2">0</span>)</div>
                <div class="input-false">提交中...</div>
                <input id="submit-all-haitao" type="submit"/>
            </div>
        </div>
    </section>

    <section id="tabs_benniao" class="cart-wrap hidden tabs-benniao">
        {%if (!empty($benniaoCartList))%}
            {%foreach from=$benniaoCartList key=cartkey item=cart%}
                {%if ($cartkey == 1)%}
                    <div class="activity-info">
                        {%if ($benniaoTotalData['activity']['activity']['1']['list'])%}
                            <div  class="activity-icon">满减</div>
                            <a id="discount-1" href="http://m.kaluli.com/product?aid=1">
                                {%assign var='mj_content' value=""%}
                                {%foreach from=$benniaoTotalData['activity']['activity']['1']['list'] key=mj_key item=mj_value%}
                                    {%assign var="mj_content" value=$mj_content|cat:'全场满¥'|cat:$mj_value['attr1']|cat:'减¥'|cat:$mj_value['attr2']|cat:','%}
                                {%/foreach%}
                                {%$mj_content|substr:0:-1%}
                                （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                            </a>
                        {%/if%}
                    </div>
                {%elseif ($cartkey == 2)%}
                    <div  class="activity-info">
                        {%if ($benniaoTotalData['activity']['activity']['2']['list'])%}
                            <div class="activity-icon">折扣</div>
                            <a id="discount-2" href="http://m.kaluli.com/product?aid=2">
                                {%assign var='zk_content' value=""%}
                                {%foreach from=$benniaoTotalData['activity']['activity']['2']['list'] item=zk_value%}
                                    {%assign var='zk_content' value=$zk_content|cat:'满'|cat:$zk_value['attr1']|cat:'件'|cat:$zk_value['attr2']/10|cat:'折,'%}
                                {%/foreach%}
                                {%$zk_content|substr:0:-1%}

                                （<span class='activity-discount'>已优惠¥<b>0</b></span>）
                            </a>
                        {%/if%}
                    </div>
                {%else%}
                    <div class="activity-info no-arrow"></div>
                {%/if%}
                <ul class="cart-list benniao-cart-list">
                    {%foreach $cart as $item%}
                        {%if ($item.status == 1)%}
                            <li data-stock="false">
                                <div class="fn-fl">
                                    <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                                </div>
                                <div class="fn-fr">
                                    {%widget
                                    name="order:widget/cartlist/cartlist.tpl"
                                    data=$item
                                    %}
                                </div>
                            </li>
                        {%else%}
                            <li id="goods-{%$item.goods_id%}" data-stock="true" class="choosewrap" data-checked="false"
                                gid="{%$item.goods_id%}" gilist="{%$item.goods_id%}">
                                <div class="fn-fl">
                                    <img src="{%$item.img_path%}" alt="{%$item.title%}"/>
                                </div>
                                <div class="fn-fr">
                                    {%widget
                                    name="order:widget/cartlist/cartlist.tpl"
                                    data=$item
                                    %}
                                </div>
                            </li>
                        {%/if%}
                    {%/foreach%}
                </ul>
            {%/foreach%}
            {%if (isset($neworderitem)&&!empty($neworderitem))%}
                <ul class="cart-list  freebies">
                    <li>
                        <div class="fn-fl">
                            <img src="{%$neworderitem.item.pic%}" alt="{%$neworderitem.item.title%}" />
                        </div>
                        <div class="fn-fr">
                            <div class="static">
                                <p class="title"><span class="freebies-tip">赠品</span>{%$neworderitem.item.title%}</p>
                                <p class="sku">
                                    {%if (isset($neworderitem.attr.attr)&&!empty($neworderitem.attr.attr))%}
                                        {%foreach from=$neworderitem.attr.attr item=skuitem key=skukey%}
                                            <span>{%$skukey%}：{%$skuitem%}</span>
                                        {%/foreach%}
                                    {%/if%}
                                </p>
                                <div class="price fn-clearfix">
                                    <div class="pro-price" class="fn-fl">¥{%$neworderitem.item.price%}</div>
                                    <div class="pro-number" class="fn-fr">x1</div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            {%/if%}
        {%/if%}
        {%*<p class="warinng">2000元以上订单需支付税费,合计<b>0</b>元</p>*%}
        <div class="fixedBtn fn-clearfix">
            <div class="fn-fl">
                <div data-checked="false" class="checkall">全选</div>
                <div class="price-area">
                    <p>总计：¥<s class="price-id-1">0</s></p>
                    <p>总额:¥<span class="price-id-3">0</span>-优惠:<span class="price-id-4">0</span></p>
                </div>

            </div>
            <div class="fn-fr">
                <div class="input-true">去结算(<span class="price-id-2">0</span>)</div>
                <div class="input-false">提交中...</div>
                <input id="submit-all-benniao" type="submit"/>
            </div>
        </div>
    </section>
</div>
<form id="goods-form" action="http://m.kaluli.com/order/cartConfirm/" method="get" style="display:none;"></form>
{%script%}
var cart = require("order:widget/cartlist/cartlist.js");
new cart().init();
{%/script%}
{%/block%}