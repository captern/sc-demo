"use strict";
var SKUResult = {},//保存最后的组合结果信息
    defaultstock,//保存默认库存
    defaultprice,//保存默认原价
    defaultkaluliprice,//保存默认卡路里价格
    defaultDelivery=[],//保存默认发货地
    defaultDeliverynote = [];//保存默认发货仓
//获取字节数
function len(s) { 
    var l = 0; 
    var a = s.split(""); 
    for (var i=0;i<a.length;i++) { 
    if (a[i].charCodeAt(0)<299) { 
    l++; 
    } else { 
    l+=2; 
    } 
    } 
    return l; 
}

/**
 * 从数组中生成指定长度的组合
 * 方法: 先生成[0,1...]形式的数组, 然后根据0,1从原数组取元素，得到组合数组
 */
function combInArray(aData) {
    if (!aData || !aData.length) {
        return [];
    }

    var len = aData.length;
    var aResult = [];

    for (var n = 1; n < len; n++) {
        var aaFlags = getCombFlags(len, n);
        while (aaFlags.length) {
            var aFlag = aaFlags.shift();
            var aComb = [];
            for (var i = 0; i < len; i++) {
                aFlag[i] && aComb.push(aData[i]);
            }
            aResult.push(aComb);
        }
    }

    return aResult;
}


/**
 * 得到从 m 元素中取 n 元素的所有组合
 * 结果为[0,1...]形式的数组, 1表示选中，0表示不选
 */
function getCombFlags(m, n) {
    if (!n || n < 1) {
        return [];
    }

    var aResult = [];
    var aFlag = [];
    var bNext = true;
    var i, j, iCnt1;

    for (i = 0; i < m; i++) {
        aFlag[i] = i < n ? 1 : 0;
    }

    aResult.push(aFlag.concat());

    while (bNext) {
        iCnt1 = 0;
        for (i = 0; i < m - 1; i++) {
            if (aFlag[i] == 1 && aFlag[i + 1] == 0) {
                for (j = 0; j < i; j++) {
                    aFlag[j] = j < iCnt1 ? 1 : 0;
                }
                aFlag[i] = 0;
                aFlag[i + 1] = 1;
                var aTmp = aFlag.concat();
                aResult.push(aTmp);
                if (aTmp.slice(-n).join("").indexOf('0') == -1) {
                    bNext = false;
                }
                break;
            }
            aFlag[i] == 1 && iCnt1++;
        }
    }
    return aResult;
}

function initsku(jsonobj, opt) {  
    this.option = opt === void 0 ? "" : opt;
    this.sku = jsonobj;
    //console.log(this.sku)
    this.s_detail = this.sku.detail;
    this.s_attr = this.sku.attr;        
}
initsku.prototype = {
    defaults: {
        sort: ".sku-list",
        sortelem: ".sku",
        kaluliprice: ".discount",
        originalPrice: ".original em",
        stock: "#stock",
        storehouse_name:"#delivery_area",
        select: "cur",
        unbindselect:'unclick'
    },
    init: function() {
        var t = this;                
        defaultkaluliprice = $(t.defaults.kaluliprice).text();
        defaultprice = $(t.defaults.originalPrice).text();
        defaultstock = $(t.defaults.stock).text() == 0 ? 0 : ($(t.defaults.stock).text() > 5 ? "有货" : "紧张");

        
        $.extend(t.defaults, t.option);
        t.doResult();
        t.creatsort();            
        $(t.defaults.sortelem).each(function() {
            var self = $(this);
            var attr_id = self.attr('data-value');
            if (!SKUResult[attr_id]) {
                self.addClass(t.defaults.unbindselect);
            }
        }).live("click",function(){
            var self = $(this),
                userselectnum = parseInt($("#numbox-text").attr("value"));
            if(self.hasClass(t.defaults.unbindselect)){
                return false
            }
            //$(".error-msg .busnum").removeClass("show");
            $(".error-msg-sku").removeClass("show");                
            //选中自己，兄弟节点取消选中
            self.toggleClass(t.defaults.select).siblings().removeClass(t.defaults.select);

            //已经选择的节点
            var selectedObjs = $('.'+t.defaults.select);
            if (selectedObjs.length) {
                //获得组合key价格
                var selectedIds = [];
                selectedObjs.each(function() {
                    selectedIds.push($(this).attr('data-value'));
                });
                selectedIds.sort(function(value1, value2) {
                    return parseInt(value1) - parseInt(value2);
                });

                var len = selectedIds.length;                    
                var prices = SKUResult[selectedIds.join(';')].prices;
                var maxPrice = Math.max.apply(Math, prices);
                var minPrice = Math.min.apply(Math, prices);
                var discountPrice = SKUResult[selectedIds.join(';')].discountPrices;
                var discountmaxPrice = Math.max.apply(Math, discountPrice);
                var discountminPrice = Math.min.apply(Math, discountPrice);
                var stocks = SKUResult[selectedIds.join(';')].stock;
                var itemId = SKUResult[selectedIds.join(';')].itemId;
                var skuId = SKUResult[selectedIds.join(';')].skuId;
                var status = SKUResult[selectedIds.join(';')].status;
                var storehouse_name = SKUResult[selectedIds.join(';')].storehouse_name;
                var storehouse_note = SKUResult[selectedIds.join(';')].storehouse_note;

                userselectnum > stocks && stocks != 0? $(".error-msg .busnum").addClass("show") : $(".error-msg .busnum").removeClass("show");

                stocks == 0 ? stocks = 0 : (stocks > 5 ? stocks = "有货" : stocks = "紧张");
                $(t.defaults.stock).text(stocks);
                $(t.defaults.originalPrice).text(maxPrice > minPrice ? minPrice + "-" + maxPrice : maxPrice);
                $(t.defaults.kaluliprice).text(discountmaxPrice > discountminPrice ? discountminPrice + "-" + discountmaxPrice : discountmaxPrice);
                $(t.defaults.sort).attr("data-itemid",itemId);
                $(t.defaults.sort).attr("data-skuid",skuId);
                $(t.defaults.sort).attr("data-status",status);

                var newstorehouse = [];
                for(var i=0;i<storehouse_name.length;i++){
                    if(newstorehouse.indexOf(storehouse_name[0]) < 0){
                        newstorehouse.push(storehouse_name[i]);
                    }
                }
                $(t.defaults.storehouse_name).html(newstorehouse.join("/"));

                storehouse_note.length > 0 && storehouse_note[0] != "" ?  $("#storehouse_note").text(storehouse_note[0]).show() : $("#storehouse_note").hide();

                //用已选中的节点验证待测试节点 underTestObjs
                $(t.defaults.sortelem).not(selectedObjs).not(self).each(function() {
                    var siblingsSelectedObj = $(this).siblings('.'+t.defaults.select);
                    var testAttrIds = []; //从选中节点中去掉选中的兄弟节点
                    if (siblingsSelectedObj.length) {
                        var siblingsSelectedObjId = siblingsSelectedObj.attr('data-value');
                        for (var i = 0; i < len; i++) {
                            (selectedIds[i] != siblingsSelectedObjId) && testAttrIds.push(selectedIds[i]);
                        }
                    } else {
                        testAttrIds = selectedIds.concat();
                    }
                    testAttrIds = testAttrIds.concat($(this).attr('data-value'));
                    testAttrIds.sort(function(value1, value2) {
                        return parseInt(value1) - parseInt(value2);
                    });
                    if (!SKUResult[testAttrIds.join(';')]) {
                        $(this).addClass(t.defaults.unbindselect).removeClass(t.defaults.select);
                    } else {
                        $(this).removeClass(t.defaults.unbindselect);
                    }
                });
            } else {
                //设置默认属性                
                $(t.defaults.originalPrice).text(defaultprice);
                $(t.defaults.kaluliprice).text(defaultkaluliprice);
                $(t.defaults.stock).text(defaultstock);                    
                $(t.defaults.sort).attr("data-itemid","");
                $(t.defaults.sort).attr("data-skuid","");
                $(t.defaults.sort).attr("data-status","");
                $(t.defaults.storehouse_name).html(defaultDelivery.join("/"));

                defaultDeliverynote.length > 0 ? $("#storehouse_note").text(defaultDeliverynote[0]).show() : $("#storehouse_note").hide();

                //设置属性状态
                $(t.defaults.sortelem).each(function() {
                    SKUResult[$(this).attr('data-value')] ? $(this).removeClass(t.defaults.unbindselect) : $(this).addClass(t.defaults.unbindselect).removeClass(t.defaults.select);
                });
            }

            if( $(t.defaults.stock).text() == 0 ||  $(t.defaults.sort).attr("data-status") == 1){
                $(".cart-btn,.buy-btn").hide();
                $(".none-btn").css("display","block");
            }else{
                $(".none-btn").hide();
                $(".buy-btn,.cart-btn").css("display","block");
            }
            if($(t.defaults.sort).attr("data-status") == 1){
                $("#stock").text(0)
            }
        })
    },
    creatsort: function() {
        var t = this,
            dom = "";                       
        $.each(t.s_attr, function(i, item) {               
            var thisitem = t.s_attr[i],
                itemhead = len(thisitem.name) > 9 ?  thisitem.name.substring(0,9) : thisitem.name,
                l = 0;      
                
            //console.log(i,item);                
            dom += '<div class="grid sort">';
            dom += '<div class="title">' + itemhead + '</div>';
            dom += '<ul class="fn-clearfix">';
            for (var key in thisitem.data) {                   
                dom += '<li class="sku" data-value=' + thisitem.data[key].alias + '>' + thisitem.data[key].name + '</li>';
                l++;
            }
            dom += '</ul>';
            dom += '</div>';
        });
        var count = 0,defaultstatus;
        $.each(t.s_detail,function(i,item){
            count++;
            defaultstatus = t.s_detail[i].status;
            defaultDelivery.indexOf(item.storehouse_name) < 0 && defaultDelivery.push(item.storehouse_name);
            defaultDeliverynote.indexOf(item.storehouse_note) < 0 && item.storehouse_note !=""  && defaultDeliverynote.push(item.storehouse_note);
        });
        
        if(count == 1 && defaultstatus == 1){
            $("#stock").text(0);
            $(".buy-btn,.cart-btn").hide();
            $(".none-btn").css("display","block");
        }else{
            $("#delivery_area").html(defaultDelivery.join("/"));
            if(defaultDelivery.join("/").indexOf("香港") >=0 ){
                $("#storehouse_note").text("香港直邮").show();
            }
            if(defaultDelivery.join("/").indexOf("郑州") >=0 ){
                $("#storehouse_note").text("郑州保税").show();
            }
        }
        
        $(t.defaults.sort).append(dom);
        $(t.defaults.stock).text(defaultstock).show();
    },
    doResult: function() { //初始化得到结果集
        var t = this;
        var i, j, skuKeys = t.getObjKeys(t.s_detail);        
        for (i = 0; i < skuKeys.length; i++) {
            var skuKey = skuKeys[i]; //一条SKU信息key
            var sku = t.s_detail[skuKey]; //一条SKU信息value
            var skuKeyAttrs = skuKey.split(";"); //SKU信息key属性值数组

            skuKeyAttrs.sort(function(value1, value2) {
                return parseInt(value1) - parseInt(value2);
            });

            //对每个SKU信息key属性值进行拆分组合
            var combArr = combInArray(skuKeyAttrs);

            for (j = 0; j < combArr.length; j++) {
                t.add2SKUResult(combArr[j], sku);
            }

            //结果集接放入SKUResult
            SKUResult[skuKeyAttrs.join(";")] = {
                stock: sku.stock,
                prices: [sku.price],
                discountPrices: [sku.discountPrice],
                status: sku.status,
                itemId: sku.itemId,
                skuId: sku.skuId,
                storehouse_name:[sku.storehouse_name],
                storehouse_note:[sku.storehouse_note]
            }                
        }
    },
    getObjKeys: function(obj) { //获得对象的key
        if (obj !== Object(obj)) throw new TypeError('Invalid object');
        var keys = [];
        for (var key in obj)
            if (Object.prototype.hasOwnProperty.call(obj, key))
                keys[keys.length] = key;
        return keys;
    },
    add2SKUResult: function(combArrItem, sku) { //把组合的key放入结果集SKUResult
        var key = combArrItem.join(";");
        if (SKUResult[key]) { //SKU信息key属性                
            SKUResult[key].stock = parseInt(SKUResult[key].stock) + parseInt(sku.stock);
            SKUResult[key].prices.push(sku.price);
            SKUResult[key].discountPrices.push(sku.discountPrice);
            SKUResult[key].storehouse_name.push(sku.storehouse_name);
            SKUResult[key].storehouse_note.push(sku.storehouse_note);
        } else {
            SKUResult[key] = {
                stock: sku.stock,
                prices: [sku.price],
                discountPrices: [sku.discountPrice],
                storehouse_name:[sku.storehouse_name],
                storehouse_note:[sku.storehouse_note],
                status: sku.status,
                itemId: sku.itemId,
                skuId: sku.skuId
            };
        }
    }
};

module.exports=function(jsonobj, opt){
    return new initsku(jsonobj, opt)
}