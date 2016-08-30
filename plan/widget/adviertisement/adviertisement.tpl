{%if (!empty($adviertisement))%}
{%foreach $adviertisement as $item %}
    <a class="adviertisements" href="{%$item.url%}">
        <img src="{%$item.pic%}">
    </a>
{%/foreach%}
{%/if%}
