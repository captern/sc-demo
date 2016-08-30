{%if ($res.item.comment_count>0)%}
<div class="comment">
    <div class="h2">宝贝评价({%$res.item.comment_count%})</div>
    <div class="tags">
       {%foreach $res.item.comment_tags_count as $item =>$val%} <span>{%$item%}({%$val%})</span>{%/foreach%}
    </div>
    <ul class="comment-list">
        <li>
            <div class="imgs">
                <img src="{%$comment.user_head%}" alt="{%$comment.user_name%}">
                <p>{%$comment.user_name%}</p>
            </div>
            <div class="details">
                <div class="tags">{%foreach $comment.tags_attr as $item =>$val%}<span>{%$val%}</span>{%/foreach%}</div>
                <div class="txt">{%$comment.content%}</div>
                <p class="time">
                <span>{%$comment.created_at%}</span>
                {%foreach $comment.attr as $item =>$val%}<span>{%$item%}:{%$val%}</span>{%/foreach%}
                </p>
            </div>
        </li>
    </ul>
    <p class="more">
        <a href="http://m.kaluli.com/item/comment?id={%$res.item.id%}">查看更多评价<img src="http://b1.hoopchina.com.cn/wl/nativeapp/shihuo/img/icon-arrow.png"> </a>
    </p>
</div>
{%/if%}