<img src="/static/goToTop.png" class="goToTop">
{%script%}
var goToTop = require("plan:widget/backTop/backtop.js");
new goToTop().display();
$('.goToTop').click(function(){
goToTop().scroll('0px', 500);
});
{%/script%}