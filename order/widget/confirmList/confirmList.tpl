<a href="" class="fn-clearfix progrid" target="_blank">
    <div class="img"><img width="100%" src="{%$data.pic%}" /></div>
    <div class="info">
        <p>{%$data.title%}</p>
        {%foreach from=$data.attr item=attritem key=attrkey%}
            <p>{%$attrkey%}:{%$attritem%}</p>
        {%/foreach%}
    </div>
    <div class="price">
        <p>¥{%$data.price%}</p>
        <p>x{%$data.number%}</p>                                
    </div>
</a>
