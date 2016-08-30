{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="index:static/faq/faq.scss"%}
    {%require name="index:static/faq/faq.js"%}  
{%/block%}


{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section class="about-us">
        <div class="kv-images">
            <img width="100%" src="../static/faq/images/faq-kv.jpg" />                          
        </div>
        <div class="menuwrap">
            <ul class="menu fn-clearfix">
                <li data-href="aboutkaluli"><img alt="关于卡路里" src="../static/faq/images/faq-nav2.jpg" /></li>
                <li data-href="merchants"><img alt="商家合作" src="../static/faq/images/faq-nav3.jpg" /></li>
                <li data-href="contact"><img alt="联系我们" src="../static/faq/images/faq-nav4.jpg" /></li>
                <li data-href="commonProblem"><img alt="帮助中心" src="../static/faq/images/faq-nav5.jpg" /></li>
            </ul>
        </div>        
        <div class="pagecontent">
            <div id="aboutkaluli" class="grid grid-1">
                <div class="grid-head">
                    <img src="../static/faq/images/faq-2-head.jpg" />
                </div>
                <div class="grid-content clearfix">
                    <img src="../static/faq/images/faq-2-image1.jpg" />
                </div>
            </div>
            <div id="merchants" class="grid grid-2">
                <div class="grid-head">
                    <img src="../static/faq/images/faq-3-head.jpg" />
                </div>
                <div class="grid-content clearfix">
                    <img src="../static/faq/images/faq-3-image1.jpg" />                    
                    <img src="../static/faq/images/faq-3-image2.jpg" />   
                    <img src="../static/faq/images/faq-3-image3.jpg" /> 
                    <img src="../static/faq/images/faq-3-image4.jpg" /> 
                    <img src="../static/faq/images/faq-3-image5.jpg" /> 
                    <img src="../static/faq/images/faq-3-image6.jpg" />                  
                </div>
            </div>
            <div id="contact" class="grid grid-3">
                <div class="grid-head">
                    <img src="../static/faq/images/faq-4-head.jpg" />
                </div>
                <div class="grid-content clearfix">                  
                </div>
            </div>
            <div id="commonProblem" class="grid grid-4">
                <div class="grid-head">
                    <img src="../static/faq/images/faq-5-head.jpg" />
                </div>
                <div class="grid-content clearfix">                 
                </div>
            </div>
                     
        </div>
    </section>
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}