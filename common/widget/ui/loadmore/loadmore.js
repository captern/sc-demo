function loadmore(opt){
    this.defaults={
        _ajaxG:true,
        ajaxLink:"http://m.kaluli.com/ucenter/ajaxMyOrder",
        item:"",
        loadingBar:"",
        tpl:"#tpl",
        wrap:".myorder section",
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
        $(window).scroll(function () {               
            if ($(window).scrollTop() >= $(document).height() - $(window).height() && that.defaults._ajaxG) {   
                that.htmlData();
            }
        });
    },
    htmlData:function(){
        var that = this;
        $(that.defaults.loadingBar).show();
        that.defaults._ajaxG = false;            
        $.post(that.defaults.ajaxLink,that.defaults.data,function(data){
            $(that.defaults.wrap).append(data);
        });
    }
}

module.exports = loadmore; 