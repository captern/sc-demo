
<div class="bottom-title">
    <ul class="clearfix">
        {%if (isset($_User.uid)&& !empty($_User.uid))%}
            <li><a href="javascript:void(0)">{%$_User.username%}</a></li>
            <li><a class="loginout" href="{%$_Config.logout_url%}">退出</a></li>
        {%else%}
            <li><a class="unlogin" href="{%$_Config.login_url%}">登录</a></li>
            <li><a class="register" href="{%$_Config.reg_url%}">注册</a></li>
        {%/if%}                
        <li><a href="http://m.kaluli.com">触屏版</a></li>
        <li style="border:0px;"><a id="go_www" href="http://www.kaluli.com">电脑版</a></li>
    </ul>
</div>
{%script%}
    var jumpUrl = window.location.href,
        logoutUrl = escape("{%$_Config.logout_url%}")+'&jumpurl=' + jumpUrl,
        loginUrl =  escape("{%$_Config.login_url%}")+'&jumpurl=' + jumpUrl;
        registerUrl =  escape("{%$_Config.reg_url%}")+'&jumpurl='+ jumpUrl;
{%/script%}