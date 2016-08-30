<div id="swiper-container" class="swiper-container">
  <div class="swiper-wrapper fn-clearfix">  
      <div class="swiper-slide">
          <img src="{%$data.pic%}" alt="{%$data.title%}">                     
      </div>
      {%foreach $data.pic_detail as $item%} 
      <div class="swiper-slide">              
              <img data-src="{%$item%}" src="transparent.gif" alt="{%$data.title%}"/>                    
      </div>
      {%/foreach%}   
  </div>
  <div class="swiper-menu"></div>  
</div>
{%script%}
    var Swipe = require("common:widget/ui/swipe/swipe.js"),
        container = document.getElementById("swiper-container"),
        length = $("#swiper-container .swiper-slide").length,
        ele = "<span></span>";
    for(var i=0;i<length;i++){        
        $(".swiper-menu").append(ele);
    }    
    $(".swiper-menu").find("span").eq(0).addClass("on");
    var menu = $(".swiper-menu span");
    var slideInstance = new Swipe(container, {
        continuous: false,
        auto: 0,
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