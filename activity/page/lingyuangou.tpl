{%extends file="common/page/layout.tpl"%}

{%block name="block_head_static"%}
    {%require name="activity:static/lingyuangou/lingyuangou.scss" %}
    {%require name="activity:static/lingyuangou/lingyuangou.js" %}
{%/block%}

{%block name="content"%}
    <section class="content-holder">
        <header>
            <img src="/static/lingyuangou/images/lingyuangou-image1.png" />
            {%if (isset($is_activity)&&!empty($is_activity))%}
            <div class="form">
                <ul>
                    <li class="fn-clearfix">
                        <input type="text" title="请输入正确的手机号" name="cellphone" pattern="/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/" placeholder="请输入手机号码"/>
                        <button type="button" id="getBtn" class="getBtn">获取验证码</button>
                    </li>
                    <li class="fn-clearfix">
                        <input type="text" name="identify" placeholder="请输入验证码">
                    </li>
                    <li>
                        <button type="button" id="confirmBtn" class="confirmBtn">确&nbsp;&nbsp;&nbsp;认</button>
                    </li>
                </ul>
                <p class="response">
                    抱歉，0元购摇摇杯活动，仅限卡路里新注册用户参加哦!
                </p>
            </div>
            {%else%}
                <div class="text">
                    <img src="/static/lingyuangou/images/text.png" />
                </div>
            {%/if%}
        </header>
        <img src="/static/lingyuangou/images/lingyuangou-image2.png" />
        <img src="/static/lingyuangou/images/lingyuangou-image3.png" />
        <img src="/static/lingyuangou/images/lingyuangou-image4.png" />
        <img src="/static/lingyuangou/images/lingyuangou-image5.png" />
        <img src="/static/lingyuangou/images/lingyuangou-image6.png" />
    </section>
{%/block%}