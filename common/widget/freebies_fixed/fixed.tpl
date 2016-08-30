{%if (!empty($newUserAct) && time() > $newUserAct['stime'] && time() < $newUserAct['etime'])%}
<!--新会员福利 -->
<a href="http://m.kaluli.com/newUserCard" class="freebies-fixed">
    <img src="./freebies-fix.png" />
</a>
{%/if%}