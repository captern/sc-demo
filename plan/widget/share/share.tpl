<section class="share">
    <input type="hidden" name="appId" value="{%if isset($signPackage['appId'])%}{%$signPackage['appId']%}{%else%}''{%/if%}">
    <input type="hidden" name="timestamp" value="{%if isset($signPackage['timestamp'])%}{%$signPackage['timestamp']%}{%else%}''{%/if%}">
    <input type="hidden" name="nonceStr" value="{%if isset($signPackage['nonceStr'])%}{%$signPackage['nonceStr']%}{%else%}''{%/if%}">
    <input type="hidden" name="signature" value="{%if isset($signPackage['signature'])%}{%$signPackage['signature']%}{%else%}''{%/if%}">
    <input type="hidden" name="openid" value="{%if isset($openid)%}{%$openid%}{%else%}''{%/if%}">
    <input type="hidden" name="nickname" value="{%if isset($nickname)%}{%$nickname%}{%else%}''{%/if%}">
    <button class="share-btn" id="btnWeixinShare">分享到好友</button>
</section>
<section class="share-pop">
    <img id="pyqShareIcon" src="pyq.png">
</section>
