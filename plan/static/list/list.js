/**
 * Created by jiangyanghe on 16/6/12.
 */
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
(function(){
    //alert(login_flag);
    var page = 1,
        category = getUrlParam('category'),
        allLoaded = false,
        bannerLoaded = false,
        pageSize = 10;
    $(".lazy").lazyload();
    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

    function loadmore(opt){
        this.defaults={
            _ajaxG:true,
            ajaxLink:"/api/getArticleList",
            item:"",
            loadingBar:".loadding",
            data:{
                page:page,
                pagesize :pageSize,
                type :""
            }
        }
    }

    function getListBanner(){
        $.get('/api/getListBanner', {category:category},function(data){
            var datas = "string" == typeof data ? $.parseJSON(data) : data ;
            if(datas.status ==1){
                var line = '<li><a href="'+datas.data.url+'" class="item-banner"><div><img class="lazy banner" data-original="'+ datas.data.pic+'" /></div><p class="fn-clearfix"><span class="banner-summary">'+datas.data.summary+'</span><span class="banner-time">'+datas.data.time+'</span></p></a></li>';
                $('#listTpl').append(line);
                bannerLoaded = true;
            }
        });
    }
    //getListBanner()

    loadmore.prototype={
        init:function(){
            var that = this;
            that.htmlData();
            that.ajaxScroll();
        },
        ajaxScroll:function(){
            var that = this;//页面滚动
            $(window).scroll(function(){
                if ($(window).scrollTop() >= $(document).height() - $(window).height()-50 && that.defaults._ajaxG && !allLoaded ) {
                    page++;
                    that.htmlData();
                }
            });
        },
        htmlData:function(){
            var that = this;
            $(that.defaults.loadingBar).show();
            that.defaults._ajaxG = false;
            $.post(that.defaults.ajaxLink,{page:page,pagesize:pageSize,category:category},function(data){
                var datas = "string" == typeof data ? $.parseJSON(data) : data ;
                if(datas.status ==1){
                    var line = '';
                    var lists = datas.data;
                    console.log(lists);
                    for(var i=0;i<lists.length;i++){
                        if(lists[i].isbanner == 1){
                            line = '<li><a href="'+lists[i].url+'" class="item-banner"><div><img class="lazy banner" data-original="'+ lists[i].pic+'" /></div><p class="fn-clearfix"><span class="banner-summary">'+lists[i].summary+'</span><span class="banner-time">'+lists[i].time+'</span></p></a></li>';
                        }else{
                        line = '<li><a href="'+lists[i].url+'" class="item-block fn-clearfix"><div class="img"><img class="lazy" data-original="'+ lists[i].pic+'" /></div><div class="info"><p>'+lists[i].summary+'</p><p>'+lists[i].time+'</p></div></a></li>';
                        }
                        $('#listTpl').append(line);
                    }
                    $("img.lazy").lazyload();
                }else if(datas.status == 0){
                    allLoaded = true;
                }
                $(that.defaults.loadingBar).hide();
                that.defaults._ajaxG = true;
            });
        }
    }
    var loadprolist = new loadmore();
    loadprolist.init();
})();