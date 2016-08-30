<div id="buyarea" class="buyarea fixed-bottom show">
    <ul class="fn-clearfix">
        <li class="kefu"><a target="_blank" href="http://www.kaluli.com/kefu">客服</a></li>
        {%if ($res.stock==0)%}          
            <li class="button disabled" style="display:block;">即将上架</li>
            <li class="button submit" style="display:none;">立即购买</li>          
            <li class="button disabled" style="display:block;">加入购物车</li> 
            <li class="button catBtn" style="display:none;">加入购物车</li>              
        {%else%}
            <li class="button disabled" style="display:none;">即将上架</li>
            <li class="button submit" style="display:block;">立即购买</li>          
            <li class="button disabled" style="display:none;">加入购物车</li> 
            <li class="button catBtn" style="display:block;">加入购物车</li>                                
        {%/if%}        
    </ul>
</div>

{%widget name="item:widget/buyarea/sku.tpl"%}
<script type="text/javascript">
    var sku = "object" == typeof {%$sku%} ? {%$sku%} : {%json_encode($sku)%};
</script>
{%script%}        
    var buyarea = require("item:widget/buyarea/buyarea.js");
    new buyarea().init(sku);
{%/script%}