var imglazy = require("common:widget/ui/imglazy/imglazy.js");

(function(win,$){
    var tpl = _.template($("#tpl").html());
    _.each(groupData,function(obj){
        $(".content").append(tpl(obj));
    });

    $(".lazy").lazyload();
})(window,Zepto);

