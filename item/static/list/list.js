var imglazy = require("common:widget/ui/imglazy/imglazy.js");
(function(){
    var price = list_price,
        scheme = list_scheme,
        type = list_type,
        brand = list_brand,
        aids = list_aIDs,
        page=1,
        allLoaded = false;

    function loadmore(opt){
        this.defaults={
            _ajaxG:true,
            //ajaxLink:"http://m.kaluli.com/item/ajaxGetProduct",
            ajaxLink:"/api/ajaxGetProduct",
            item:"",
            loadingBar:".loadding",
            tpl:"#tpl",
            wrap:".prolist ul",
            data:{
                page:1,
                pagesize :10,
                type :""
            }
        }
    }

    loadmore.prototype={
        ajaxScroll:function(){
            var that = this;//页面滚动
            $(window).scroll(function(){
                if ($(window).scrollTop() >= $(document).height() - $(window).height()-50 && that.defaults._ajaxG && !allLoaded) {
                    page++; 
                    that.htmlData();
                }
            });
        },
        htmlData:function(){
            var that = this;
            $(that.defaults.loadingBar).show();
            that.defaults._ajaxG = false;
            /************************原来是注释掉的 开始**********************************/
            //$.post(that.defaults.ajaxLink,{page:page,pagesize:30,price:price,scheme:scheme,type:type,brand:brand,aIds:aids},function(data){
            //    var datas = "string" == typeof data ? $.parseJSON(data) : data ;
            //    if(datas.status ==1){
            //        var lists = datas.data,
            //            tpl = _.template($("#tpl").html());
            //        _.each(lists,function(l){
            //            if(!l.tag)l.tag="";
            //            $(that.defaults.wrap).append(tpl(l));
            //        });
            //        $("img.lazy").lazyload();
            //    }else if(datas.status == 0){
            //        allLoaded = true;
            //    }
            //    $(that.defaults.loadingBar).hide();
            //    that.defaults._ajaxG = true;
            //});
            /************************原来是注释掉的 结束**********************************/
        }
    } 
    var loadprolist = new loadmore();
    loadprolist.ajaxScroll();

    $(".lazy").lazyload();
})();