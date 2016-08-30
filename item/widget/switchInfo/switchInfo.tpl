<div class="product-content">
    <div class="swtich-top">
        <ul>
            <li class="on"><a href="#details">商品详情</a></li>
            <li><a href="#aboutus">关于我们</a></li>
            <li><a href="#qa">Q&A</a></li>
        </ul>
    </div>
    <div class="prodetail">
        <div class="pro-detail" id="details">
            <div class="attrs">
                {%foreach $data.item.attrs as $item =>$value%}
                    {%if ($item!="0")%}
                        <p><span>{%$item%}</span> {%$value%}</p>
                    {%/if%}
                {%/foreach%}
            </div>
            {%$data.item.content|escape:none%}
        </div>
        <div class="aboutus" id="aboutus">
            <img src="faq-2-head.jpg" />
            <img src="faq-3-head.jpg" />
            <img src="faq-3-image1.jpg" />
            <img src="faq-3-image2.jpg" />
            <img src="faq-3-image3.jpg" />
            <img src="faq-3-image4.jpg" />
            <img src="faq-3-image5.jpg" />
            <img src="faq-3-image6.jpg" />
            <img src="faq-4-head.jpg" />
        </div>
        <div class="qa" id="qa">
            <img src="faq-5-head.jpg" />
        </div>
    </div>
</div>
{%script%}
    var fixTop= require("item:widget/switchInfo/fixTop.js");
    fixTop.init();
{%/script%}
    