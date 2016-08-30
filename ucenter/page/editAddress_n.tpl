{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
{%require name="ucenter:static/backup_editAddress/editAddress_n.scss"%}
{%require name="ucenter:static/backup_editAddress/editAddress_n.js"%}
{%/block%}

{%block name="content"%}
{%block name="header"%}
{%widget name="common:widget/header/normalheader.tpl"%}
{%/block%}
<section data-url="{%$jumpUrl|safeEncoding:'UTF-8'%}" data-type="{%if (isset($address.name)&&!empty($address.name))%}edit{%else%}new{%/if%}" data-id="{%if (isset($address_id)&&!empty($address_id))%}{%$address_id%}{%/if%}" class="edit-address">
    <div class="fn-clearfix address-nav">
        <p>选择所在地区</p>

        <div class="select-btn fn-clearfix">
            <button id="btn-provinces">省份<img src="/static/backup_editAddress/arrowdown.png"></button>
            <button id="btn-city">城市<img src="/static/backup_editAddress/arrowdown.png"></button>
            <button id="btn-area">地区<img src="/static/backup_editAddress/arrowdown.png"></button>
        </div>

        <select class="sel-1 fn-fl" id="provinces">
            <option value="0">省份<i class="arrow bounce"></i></option>
            {%if (isset($provinces)&&!empty($provinces)) %}
            {%foreach $provinces as $item %}
            <option value="{%$item.region_id%}">{%$item.region_name%}</option>
            {%/foreach%}
            {%/if%}
        </select>
        <select class="sel-2 fn-fl" id="city">
            <option value="0">城市</option>
        </select>
        <select class="sel-3 fn-fl" id="area" /">
            <option value="0">地区</option>
        </select>
    </div>
    <div class="grid">
        <input class="input" id="q1" type="text" name="detailed" value="{%if (isset($address.street)&&!empty($address.street))%}{%$address.street%}{%/if%}" placeholder="输入详细地址">
        <input class="input" id="q2" type="text" name="name" placeholder="输入收货人姓名" value="{%if (isset($address.name)&&!empty($address.name))%}{%$address.name%}{%/if%}">
        <input class="input" id="q3" type="tel" name="phone" maxlength="11" placeholder="输入收货人联系电话" value="{%if (isset($address.mobile)&&!empty($address.mobile))%}{%$address.mobile%}{%/if%}">
        <input class="input" id="q4" type="text" name="card" maxlength="18" placeholder="输入收货人身份证号码" value="{%if (isset($address.identity_number)&&!empty($address.identity_number))%}{%$address.identity_number%}{%/if%}">
    </div>
    <div class="tips">
        <div>
        <p>*根据中国海关相关法律法规，消费者需提供收货人身份证信息，否则不予通关。</p>
        <p>*卡路里商城承诺保护用户的个人信息与数据安全。</p>
        </div>
    </div>
    <a href="javascript:void(0);" class="btn">保存</a>
</section>
{%/block%}
{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}