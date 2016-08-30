{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="activity:static/activity1103.scss"%}
{%/block%}

{%block name="content"%}
<section class="pagewrap">
    <div class="pagehead">
        <img src="/static/activity20151103/activity11030-images3.jpg" />
        <img src="/static/activity20151103/activity11030-images2.jpg" />
    </div>
    <div class="pagecontent">
        <div class="grid">
            <ul class="prolist fn-clearfix">
                <li>
                    <a  href="http://m.kaluli.com/product/1.html#qk=detail&page=1&order=13">
                        <div class="intro">完美身材者的挚爱</div>
                        <div class="proname">肌肉科技 白金乳清蛋白粉 5磅</div>
                        <div class="img">
                            <img alt="肌肉科技 白金乳清蛋白粉 5磅" class="lazy" data-original="http://shihuo.hupucdn.com/uploads/kaluli/item/201509/2114/1b3d8057aaedcf315d92aae9cad5b4cb.jpg?imageView2/2/h/400" />
                        </div>
                        <div class="bottom clearfix">
                            <div class="discount-price"><i>¥</i>588</div>
                            <div class="price">市场价<s>¥858</s></div>
                        </div>
                        <div class="buyBtn">立即购买</div>
                    </a>
                    <div class="border"></div>
                </li>
                <li>
                    <a  href="http://m.kaluli.com/product/28.html#qk=detail&page=1&order=3">
                        <div class="intro">快速恢复体力的功能</div>
                        <div class="proname">Now Foods 秘鲁玛卡胶囊</div>
                        <div class="img">
                            <img alt="Now Foods 秘鲁玛卡胶囊" class="lazy" data-original="http://shihuo.hupucdn.com/uploads/kaluli/item/201509/1009/ad3c239a5a4d83c8b94b75efddf3d201.jpg?imageView2/2/h/400" />
                        </div>
                        <div class="bottom clearfix">
                            <div class="discount-price"><i>¥</i>109</div>
                            <div class="price">市场价<s>¥298</s></div>
                        </div>
                        <div class="buyBtn">立即购买</div>
                    </a>
                    <div class="border"></div>
                </li>
                <li>
                    <a  href="http://m.kaluli.com/product/38.html#qk=detail&page=1&order=13">
                        <div class="intro">公认品，全能增肌补剂</div>
                        <div class="proname">美瑞克斯 乳清蛋白粉 5磅</div>
                        <div class="img">
                            <img alt="美瑞克斯 乳清蛋白粉 5磅" class="lazy" data-original="http://shihuo.hupucdn.com/uploads/kaluli/item/201510/2018/a3a414fbb0e05d871b651027af5c9b72.png?imageView2/2/h/400" />
                        </div>
                        <div class="bottom clearfix">
                            <div class="discount-price"><i>¥</i>568</div>
                            <div class="price">市场价<s>¥829</s></div>
                        </div>
                        <div class="buyBtn">立即购买</div>
                    </a>
                    <div class="border"></div>
                </li>
            </ul>
        </div>
        {%foreach from=$sectionname item=prolist key=name%}
        <div class="grid">
            <h3 class="title">{%$name%}</h3>
            <ul class="prolist fn-clearfix">
                {%foreach $prolist as $item %}
                <li>
                    <a href="http://m.kaluli.com/product/{%$item.id%}.html">
                        <div class="intro">{%$item.sell_point%}</div>
                        <div class="proname">{%$item.title%}</div>
                        <div class="img">
                            <img alt="{%$item.title%}" class="lazy" data-original="{%$item.pic%}?imageView2/2/h/400" />
                        </div>
                        <div class="bottom clearfix">
                            <div class="discount-price"><i>¥</i>{%$item.discount_price|substr:"0":"-3"%}</div>
                            <div class="price">市场价<s>¥{%$item.price|substr:"0":"-3"%}</s></div>
                        </div>
                        <div class="buyBtn">立即购买</div>
                    </a>
                    <div class="border"></div>
                </li>
                {%/foreach%}
            </ul>
        </div>

        {%/foreach%}
    </div>
</section>
{%script%}
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
$(".lazy").lazyload();
{%/script%}
{%/block%}

{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}