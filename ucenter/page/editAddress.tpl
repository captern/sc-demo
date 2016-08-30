{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="ucenter:static/editAddress/editAddress.scss"%}
    {%require name="ucenter:static/editAddress/editAddress.js"%}
{%/block%}

{%block name="content"%}
    {%block name="header"%}
        {%widget name="common:widget/header/normalheader.tpl"%}
    {%/block%}
    <section data-url="{%$jumpUrl|safeEncoding:'UTF-8'%}" data-type="{%if (isset($address.name)&&!empty($address.name))%}edit{%else%}new{%/if%}" data-id="{%if (isset($address_id)&&!empty($address_id))%}{%$address_id%}{%/if%}" class="edit-address">
        <div class="grid">
            <label class="fn-clearfix"><span>收件人：</span><input type="text" name="name" value="{%if (isset($address.name)&&!empty($address.name))%}{%$address.name%}{%/if%}"/></label>
            <label class="fn-clearfix"><span>手机号码：</span><input type="text" name="phone" value="{%if (isset($address.mobile)&&!empty($address.mobile))%}{%$address.mobile%}{%/if%}"/></label>
            <label class="fn-clearfix"><span>身份证：</span><input type="text" name="card" value="{%if (isset($address.identity_number)&&!empty($address.identity_number))%}{%$address.identity_number%}{%/if%}"/></label>
            <label class="fn-clearfix"><span>省份：</span>
                <select class="sel-1">
                    <option value="0">请选择</option>
                    {%if (isset($provinces)&&!empty($provinces)) %}
                        {%foreach $provinces as $item %}
                            <option value="{%$item.region_id%}">{%$item.region_name%}</option>
                        {%/foreach%} 
                    {%/if%}                 
                </select>
            </label>
            <label class="fn-clearfix"><span>城市：</span>
                <select class="sel-2">
                    <option value="0">请选择</option>
                </select>
            </label>
            <label class="fn-clearfix"><span>地区：</span>
                <select class="sel-3">
                    <option value="0">请选择</option>
                </select>
            </label>
            <label class="fn-clearfix">
                <span>详细地址：</span>
                <textarea name="detailed">{%if (isset($address.street)&&!empty($address.street))%}{%$address.street%}{%/if%}</textarea>
            </label>            
            <div class="checkbox">
                <input name="defaultflag" {%if (isset($address.defaultflag)&&!empty($address.defaultflag))%}checked="checked"{%/if%} type="checkbox" />设为默认地址
            </div>
        </div>
        <a href="javascript:void(0);" class="btn">保存</a>
    </section>
{%/block%}
{%block name="footer"%}
    {%widget name="common:widget/footer/footer.tpl"%}
{%/block%}