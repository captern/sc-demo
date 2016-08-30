<ul class="nav-grid fn-clearfix">
    <li><a class="logo" href="http://m.kaluli.com"><img src="logo.png"></a></li>
    <li><a href="http://m.kaluli.com/plan">训练计划</a><img class="anger" src="anger.png"></li>
    {%if (!empty($data.fa.id))%}
    <li><a href="/plan/list?category={%$data.fa.id%}">{%$data.fa.name%}</a><img class="anger" src="anger.png"></li>
    {%/if%}
    {%if (!empty($data.child.id))%}
    <li><a href="/plan/list?category={%$data.child.id%}">{%$data.child.name%}</a></li>
    {%/if%}
    <li><a href="http://m.kaluli.com"><img class="shoppingmal" src="shoppingmal.png">商城</a></li>
</ul>