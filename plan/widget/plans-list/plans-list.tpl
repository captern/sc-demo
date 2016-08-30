<section class="floors" id="{%$key%}">
    <h3>{%$data.name%}</h3>
    {%widget
        name="plan:widget/item/list-item.tpl"
        data=$data.item_data
    %}
    <p class="more"><a href="/plan/list?category={%$data.urlid%}">查看更多 &nbsp;></a></p>
</section>