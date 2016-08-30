{%extends file="common/page/layout.tpl"%}
{%block name="block_head_static"%}
    {%require name="common:static/js/zepto.tab-min.js"%}
    {%require name="common:static/css/zepto.tab-min.css"%}
    {%require name="activity:static/panicbuy/goods-list.js"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}

    {%widget name="activity:widget/goods-list/goods-list.tpl"%}

{%/block%}


{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}

{%/block%}
