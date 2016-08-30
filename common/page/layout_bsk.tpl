<!DOCTYPE html>
{%html framework="common:static/js/mod-amd.js" %}
{%head%}
<meta charset="utf-8" />
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="keywords" content="{%$_Seo.keywords%}">
<meta name="description" content="{%$_Seo.description%}">
<title>{%$_Seo.title%}</title>
{%require name="common:static/sass/common.scss"%}
{%require name="common:widget/freebies_fixed/fixed.scss"%}

{%require name="common:static/js/zepto/zepto.min.js"%}
{%require name="common:static/js/flexible/flexible.js"%}
{%require name="common:static/js/common/common.js"%}
<script type="text/javascript">
    var login_flag = {%if (isset($_User.uid)&&!empty($_User.uid))%}1{%else%}0{%/if%};

    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?6233fef6a393855fb8e21489c43538aa";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
{%block name="block_head_static"%}
{%/block%}
{%/head%}
{%body%}
{%block name="content"%}{%/block%}
{%block name="footer"%}{%/block%}
<script type="text/javascript" src="http://b3.hoopchina.com.cn/web/module/dace/m/m_dace.js"></script>
{%*<script type="text/javascript">*%}
{%*!function(){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src="//configcn.ve-interactive.cn/tags/00D23162/16B5/4F4C/9DF8/2BEEE3392242/tag.js";var b=document.getElementsByTagName("head")[0];if(b)b.appendChild(a,b);else{var b=document.getElementsByTagName("script")[0];b.parentNode.insertBefore(a,b)}}();*%}
{%*</script>*%}


{%/body%}
{%/html%}