{%if isset($data)%}
  <div id="swiper-container" class="swiper-container">
      <div class="swiper-wrapper">
          {%foreach $data as $item%}
          <div class="swiper-slide">
              <a href="{%$item.url|replace:"http://www":"http://m"%}" title="{%$item.title%}">
                  {%if $item@index==0%}
                      <img src="{%$item.pic%}" alt="{%$item.title%}"> 
                  {%else%}
                      <img data-src="{%$item.pic%}" src="transparent.gif" alt="{%$item.title%}"/>
                  {%/if%}                
              </a>
          </div>
          {%/foreach%}
      </div>
      <div class="swiper-menu">
          {%foreach $data as $item%}
              <span class="{%if $item@index == 0%}on{%/if%}"></span>            
          {%/foreach%}
      </div>
  </div>

  {%script%}
    var Swipe = require("common:widget/ui/swipe/swipe.js");
    var container = document.getElementById("swiper-container");
    var menu = $(".swiper-menu span");
    var slideInstance = new Swipe(container, {
        continuous: true,
        auto: 3000,
        callback: function(pos) {
          var image= $(container).find(".swiper-slide").eq(pos).find("img"),
              url = image.data("src");
          if(url){
             image.attr("src",url).addClass("show");           
             image.removeAttr("data-src");
          }
          var i = menu.length;
          while (i--) {
            menu[i].className = ' ';
          }
          menu[pos].className = 'on';
        }
    });
  {%/script%}
{%/if%}