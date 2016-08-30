<div class="address">        
    <a href="{%if (isset($jumpUrl)&&!empty($jumpUrl))%}/ucenter/address?jumpUrl={%$jumpUrl%}{%else%}/ucenter/order{%/if%}" >
        {%if (!empty($data))%}
        <div class="user fn-clearfix">
            <div class="username fn-fl">{%$data.name%}</div>
            <div class="usermobile fn-fl">{%$data.mobile%}</div>
        </div>
        <p>
            收货地址：{%$data.region%}{%$data.street%}
        </p> 
        {%if (isset($data.identity_number)&&!empty($data.identity_number))%}
        <p>
            身份证：{%$data.identity_number%}
        </p> 
        {%/if%}
        <input id="address_id" type="hidden" value="{%if (isset($data.id))%}{%$data.id%}{%/if%}"/> 
        {%else%}      
        <div class="addAddress">亲，请添加收货地址</div>  
        {%/if%}         
    </a>                              
</div>