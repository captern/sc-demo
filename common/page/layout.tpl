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
        {%block name="block_head_static"%}            
        {%/block%}       
    {%/head%}
    {%body%}
        {%block name="content"%}{%/block%}       
        {%block name="footer"%}{%/block%}
    {%/body%}
{%/html%}