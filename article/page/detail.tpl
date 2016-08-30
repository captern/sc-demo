{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="article:static/detail/detail.scss"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}

    <section class="article-wrap">
        <h3>{%$articleData.title%}</h3>
        <article>
            {%$articleData.content|escape:none%}
        </article>
        <div class="grid">
            <h3>相关推荐</h3>
            <ul class="newslist">
                {%foreach $articleRecommend as $newlist%}
                    <li><a href="/news/{%$newlist.id%}.html">{%$newlist.title%}</a></li> 
                {%/foreach%}               
            </ul>
            <ul class="prolist fn-clearfix">
                {%foreach $itemRecommend as $prolist name="foo"%}
                    {%if ($smarty.foreach.foo.index <= 3)%}                
                        <li>
                            <a href="/product/{%$prolist.id%}.html">
                                <div class="img"><img src="{%$prolist.pic%}" /></div>
                                <p class="title">{%$prolist.title%}</p>
                                <div class="price fn-clearfix">
                                    <div class="fn-fl"><i>¥</i>{%$prolist.price%}</div>
                                    <!-- <div class="fn-fr">¥350.00</div> -->
                                </div>
                            </a>
                        </li>   
                    {%/if%} 
                {%/foreach%}            
            </ul>
        </div>
    </section>

{%/block%}

{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}