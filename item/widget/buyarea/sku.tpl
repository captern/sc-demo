<div class="skucontent">
    <article>
        <div class="img">
            <img src="{%$res.item.pic%}"/>
        </div>
        <div class="pro-info">
            <h3>{%$res.item.title%}</h3>
            <p>
                {%if isset($res.item.discount_price)%}
                    <i>¥</i><span class="discount">{%$res.item.discount_price%}</span>
                    <span class="original linethrough">¥<em>{%$res.item.price%}</em></span>
                {%else%}
                    <i>¥</i><span class="discount">{%$res.item.price%}</span>
                {%/if%}      
            </p>            
        </div>        
    </article>
    <div id="scrollview" class="scrollview">
        <div class="scollwrapper">
            <div class="sku-list">
            </div>
            <div class="grid">
                <div class="title">数量</div>
                <div class="numbox fn-clearfix">
                    <i class="icon-subtract-nosprite">-</i>
                    <input id="numbox-text" type="text" class="numbox-text" maxlength="8" value="1" title="请输入购买量"/>                 
                    <i class="icon-add--nosprite">+</i>
                </div>            
                <p class="stock">库存 <em style="display: none;"  id="stock">{%$res.stock%}</em> </p>
            </div>  
            <div class="error-msg clearfix">
                <p class="busnum">请填写正确的购买数量！</p>
            </div> 
        </div>
        <div class="myScrollbar">
            <div></div>
        </div>
    </div>    
    <div class="confirmBtn">确定</div>
</div>