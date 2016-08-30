var share={ 
    defaults:{
        id:"#share",
        btn:".share-icon"
    },
    init:function(){
        this.bindFun();
    },  
    bindFun:function(){
        var t =this;
        $(t.defaults.btn).on("tap",function(){
            $.popupBg(function(){
                $(t.defaults.id).removeClass('show');
            });
            $(t.defaults.id).addClass('show');
        });
        var shareObj={
            fullURL:window.location.href,
            title:$(".product-title h3").text(),
            imageURL:$("#swiper-container .swiper-slide").eq(0).find("img").attr("src")
        }
        $(t.defaults.id).find("li").each(function(){
            $(this).click(function(){
                var shareMedium = $(this).attr("data-share");                    
                switch(shareMedium){
                    case "weibo":
                        t.shareWeibo(shareObj)
                        break;
                    case "qzone":
                        t.shareQzone(shareObj)
                        break;
                    case "renren":
                        t.shareRenren(shareObj)
                        break;
                }
                return false
            });
        });
    },
    shareWeibo:function(weiboObj){
        var t = this;
        var weiboURL = "http://service.weibo.com/share/share.php";
        weiboURL += "?status=1";
        weiboURL += "&url=" + encodeURIComponent(weiboObj.fullURL);        
        weiboURL += "&appkey=3445570739";
        weiboURL += "&title=" + encodeURIComponent(weiboObj.title);
        weiboURL += "&searchPic=false";
        weiboURL += "&pic=" + encodeURIComponent(weiboObj.imageURL);
        weiboURL += "&ralateUid=";
        weiboURL += "&language=zh_cn";
        t.openShareWindow(weiboURL, "weibo");
    },
    shareQzone:function(qzoneObj){
        var t = this;
        var qzoneURL = "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey";
        qzoneURL += "?url=" + encodeURIComponent(qzoneObj.fullURL);        
        qzoneURL += "&title=" + encodeURIComponent(qzoneObj.title);
        qzoneURL += "&pics=" + encodeURIComponent(qzoneObj.imageURL);
        t.openShareWindow(qzoneURL, "qzone");
    },
    shareRenren:function(renrenObj){
        var t = this;
        var renrenURL = "http://widget.renren.com/dialog/share";
        var locationUrl = window.location.href;
        renrenURL += "?resourceUrl=" + encodeURIComponent(renrenObj.fullURL);
        renrenURL += "&srcUrl=" + locationUrl;
        renrenURL += "&title=" + encodeURIComponent(renrenObj.title);
        renrenURL += "&pic=" + encodeURIComponent(renrenObj.imageURL);
        t.openShareWindow(renrenURL, "renren");
    },
    openShareWindow:function(shareLink,name){
        window.open(shareLink,"_blank");
    }
}
module.exports=function(){
    share.init();
}