<div class="panictab js-tab">
    <ul class="tab-nav js-tab-header">
        <li id="today" class="cur">
            <h5>今日10:00</h5>
            <small>抢购中</small>
        </li>
        <li id="tomorrow">
            <h5>明日10:00</h5>
            <small>未开始</small>
        </li>
    </ul>
    <div><img class="banner" src="/static/20151011.jpg"></div>
    <ul class="tab-body js-tab-body">
        <li>
            <section class="timeTip">
                <span>抢购中每日10:00开始</span>
                <span>距结束<time class="hour">02</time><b>&nbsp;:&nbsp;</b><time class="min">12</time><b>&nbsp;:&nbsp;</b><time class="sec">56</time></span>
            </section>
            <section class="goods-list">
                <ul id="#tpl">
                    <li>
                        <a href="/product/{%$panicitem.id%}.html">
                            <div class="img">
                                <img class="lazy" data-original="{%$panicitem.pic%}?imageView2/2/h/330">
                            </div>
                            <div class="info">
                                <p>{%if (isset($panicitem.tag))%}<span class="activity-tag">{%$panicitem.tag%}</span>{%/if%}{%$panicitem.title%}</p>
                                <p>{%$panicitem.sell_point%}</p>
                                <div class="price">
                                    <p><span class="discount"><i>¥</i>88.00</span><span class="discount-num">4.2折</span></p>
                                    <p><span class="original linethrough">¥98.00</span></p>
                                </div>
                                <button class="gopanic">去抢购</button>
                            </div>

                        </a>
                    </li>
                </ul>
            </section>
        </li>
        <li>
            <section class="timeTip">
                <span>抢购中每日10:00开始</span>
                <span>距结束<time class="hour">02</time><b>&nbsp;:&nbsp;</b><time class="min">12</time><b>&nbsp;:&nbsp;</b><time class="sec">56</time></span>
            </section>
            <p>　　222据每日邮报2月24日报道，一栋公寓楼。</p>
        </li>
    </ul>
</div>
