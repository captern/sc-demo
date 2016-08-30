/**
 * Created by jiangyanghe on 16/4/12.
 */
var imglazy = require("common:widget/ui/imglazy/imglazy.js");
$(function () {
    $(".js-tab").tab();
    $('#today').on('click', function(){
        ajax('1','/activity/getGoodsList');
    });
    $('#tomorrow').on('click', function(){
        ajax('1','/activity/getGoodsList');
    });




    function loadmore(ajaxLink){
        this.defaults={
            _ajaxG:true,
            ajaxLink:ajaxLink,
            //loadingBar:".loadding",
            tpl:"#tpl",
            wrap:".goods-list ul",
            data:{
                page:1,
                pagesize :10,
                type :""
            }
        }
    }

    function ajax(page,ajaxLink){
        $.post(ajaxLink,{page:page,pagesize:30},function(data){
            var datas = "string" == typeof data ? $.parseJSON(data) : data ;
            if(datas.status ==1){
                //console.log(JSON.stringify(datas));
                var data = datas.data;
                for(var i = 0; i < data.length; i++){
                    console.log(i);
                    var tpl = '<li><a href="/product/"'+data.id+'".html" class="fn-clearfix">' +
                        '<div class="img">' +
                        '<img class="lazy" data-original="{%$productitem.pic%}?imageView2/2/h/330"/>' +
                        '</div>' +
                        '<div class="info">' +
                        //'<p>{%if (isset($productitem.tag))%}<span class="activity-tag">{%$productitem.tag%}</span>{%/if%}{%$productitem.title%}</p>' +
                        '<p>{%$productitem.sell_point%}</p>' +
                        '</a>' +
                        '</li>';
                    $('#tpl').append(tpl);
                }
                $("img.lazy").lazyload();

            }else if(datas.status == 0){
                allLoaded = true;
            }
            //$(that.defaults.loadingBar).hide();
            //that.defaults._ajaxG = true;
        });
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
            $.post(that.defaults.ajaxLink,{page:page,pagesize:30},function(data){
                var datas = "string" == typeof data ? $.parseJSON(data) : data ;
                if(datas.status ==1){
                    alert(22);
                    var lists = datas.data,
                        tpl = _.template($("#tpl").html());
                    _.each(lists,function(l){
                        if(!l.tag)l.tag="";
                        $(that.defaults.wrap).append(tpl(l));
                    });
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
    loadprolist.ajaxScroll();

    $(".lazy").lazyload();
});