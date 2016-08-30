<div class="normalheader">
    <div class="back-link"><img src="back-icon.png" /></div>
    <h3>{%$_Seo.pageTitle%}</h3>
</div>
{%script%}
(function($){
    $(".back-link").on("tap",function(){
        history.go(-1);
    });
})(Zepto)
{%/script%}