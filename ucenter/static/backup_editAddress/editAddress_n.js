(function(){
function editAddress(){
    this.defaults={
        wrap:".edit-address .grid",
        saveBtn:".btn",
        inputname:["name","phone","card","detailed"],
        errorstr:["请填写姓名","请填写正确的手机号码","身份证不合法","请填写详细地址"],
        ajaxloaded:true
    };
    this.Verification={
       name:false,
       phone:false,
       card:false,
       //address:false,
       detailed:false,
       postal:false
    };
}
editAddress.prototype={
    init:function(){
        var t = this;
        this.bindFun();
        this.cityAdd();
        if($(".edit-address").attr("data-type")=="edit"){
          var id = $(".edit-address").attr("data-id");
          $.post("http://m.kaluli.com/api/getAddress",{id:id},function(data){
              var thisdata = $.parseJSON(data).data,
                  addressdata = {
                    'province' : thisdata.province,
                    'city' : thisdata.city,
                    'area' :thisdata.area
                  };
              var provinceindex = $("option[value='"+addressdata.province+"']",".sel-1").index();
              $(".sel-1")[0].selectedIndex = provinceindex;
              $.get("/api/getNextRegionById?id="+addressdata.province,function(data){
                  t.cityAddstr(data,$(".sel-2"));
                  var cityindex = $("option[value='"+addressdata.city+"']",".sel-2").index();      
                  $(".sel-2")[0].selectedIndex = cityindex;                                
                  $.get("http://m.kaluli.com/api/getNextRegionById?id="+addressdata.city,function(data){                                  
                         t.cityAddstr(data,$(".sel-3"));
                         var areaindex = $("option[value='"+addressdata.area+"']",".sel-3").index();
                         $(".sel-3")[0].selectedIndex = areaindex;
                      $('#btn-area').html(document.getElementById("area").options[window.document.getElementById("area").selectedIndex].text);

                  },"json");
                  var city = document.getElementById("city").options[window.document.getElementById("city").selectedIndex].text;
                  $('#btn-city').html(city);
              },"json");
              var provinces = document.getElementById("provinces").options[window.document.getElementById("provinces").selectedIndex].text;
              $('#btn-provinces').html(provinces);


          });


        }   
    },
    bindFun:function(){
        var phone = /^1[34578][0-9]{9}$/,
            reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
            that = this,
            inputname=that.defaults.inputname,
            errorstr=that.defaults.errorstr,
            iserror = false;
        for(var i=0;i<inputname.length;i++){                         
            $("input[name='"+inputname[i]+"']").bind('blur',function(){                              
                var val = $(this).val(),
                    thisname = $(this).attr("name"),
                    i = that.defaults.inputname.indexOf(thisname);
                if(thisname=="card"){ 
                    if(!reg.test(val)){
                        $.tips(errorstr[i]);          
                        iserror = true;
                        that.Verification[thisname] = false;
                    }else{
                       that.Verification[thisname] = true;
                       iserror = false;
                    }
                    return false
                }else if(thisname=="phone"){
                    console.log(!phone.test(val) +'@@'+val);
                    if(!phone.test(val)){
                        $.tips(errorstr[i]);   
                        iserror = true;
                        that.Verification[thisname] = false;
                    }else{
                        that.Verification[thisname] = true;
                        iserror = false;
                    }
                    return false
                }     
                if($.trim(val) == ""){                                                 
                    $.tips(errorstr[i]);
                    that.Verification[thisname] = false;
                    iserror = true; 
                }else{
                    that.Verification[thisname] = true;
                    iserror = false;
                }
            });            
        };

        $("input[name='detailed']").bind('blur',function(){
            var val = $(this).val();
            if($.trim(val) == ""){                                                 
                  $.tips(errorstr[3]);
                  that.Verification['detailed'] = false;
                  iserror = true; 
            }else{
                  that.Verification['detailed'] = true;
                  iserror = false;
            }
        });


        $(that.defaults.saveBtn).on("tap",function(){                                       
            $("input[type='text'],textarea").triggerHandler('blur');
            var $this = $(this),
                id = $(".edit-address").attr("data-id"),
                nameVal = $("input[name='name']").val(),
                identity_number = $("input[name=card]").val(),
                mobileVal = $("input[name='phone']").val(),
                provinceVal = $(".sel-1").val(),
                cityVal = $(".sel-2").val(),
                areaVal = $(".sel-3").val(),
                streetVal = $("input[name='detailed']").val(),
                //postcodeVal = $("input[name='postal']").val();
                postcodeVal = 222222;
            console.log(mobileVal);
                if($("input[name='defaultflag']").attr("checked") == true || $("input[name='defaultflag']").attr("checked") == "checked"){
                  var defaultflagVal = 1
                }else{
                  var defaultflagVal = 0
                }  

            //for(var i=0;i<inputname.length;i++){
            //    if(!that.Verification[inputname[i]]){
            //       $.tips(that.defaults.errorstr[i]);
            //       return false;
            //   }
            //}
            var address={
              id: id,
              identity_number:identity_number,
              name:nameVal,
              mobile:mobileVal,
              province:provinceVal,
              city:cityVal,
              area:areaVal,
              street:streetVal,
              postcode:postcodeVal,
              defaultflag:defaultflagVal
            } 
            var jumpUrl=encodeURIComponent($(".edit-address").attr("data-url"));
            if(provinceVal == "0" || cityVal == "0" || areaVal == "0"){
                $.tips("请选择地区");
                return false
            }             
            if(!that.defaults.ajaxloaded) return false;
             that.defaults.ajaxloaded = false;      
         
            $.post("/api/editAddress",{jumpUrl:jumpUrl,address:address},function(datas){                
                var data = $.parseJSON(datas);
                if(data.data.status==200){     
                //console.log(decodeURIComponent(data.jumpUrl))         
                   window.location.href = "http://m.kaluli.com/ucenter/address?jumpUrl="+decodeURIComponent(data.jumpUrl);
                }else{
                   alert(data.data.msg)
                }
                that.defaults.ajaxloaded = true;
            });
        })

    },
    cityAdd:function(){
        var that = this;
        $(".sel-1").change(function(event) {                 
             var val = $(this).val();
            var provinces = document.getElementById("provinces").options[window.document.getElementById("provinces").selectedIndex].text;
            $('#btn-provinces').html(provinces);
            $(".sel-2").html('<option value="0">请选择</option>');
             $(".sel-3").html('<option value="0">请选择</option>');  
             if(val == "0"){
                return false
             }               
             $.get("/api/getNextRegionById?id="+val,function(data){                                        
                  that.cityAddstr(data,$(".sel-2"));
             },"json");                
        });

        $(".sel-2").change(function(event) {
             var val = $(this).val();
            var city = document.getElementById("city").options[window.document.getElementById("city").selectedIndex].text;
            $('#btn-city').html(city);
             if(val == "0"){
                return false
             }    
             $.get("/api/getNextRegionById?id="+val,function(data){
                   that.cityAddstr(data,$(".sel-3"));
             },"json");       
        });

        $(".sel-3").change(function(event){
            var area = document.getElementById("area").options[window.document.getElementById("area").selectedIndex].text;
            $('#btn-area').html(area);
        })
    },
    cityAddstr:function(o,d){
        var str = '<option value="0">请选择</option>';             
        for(var i=0,len=o.data.list.length;i<len;i++){                   
            str += '<option value="'+o.data.list[i].region_id+'">'+o.data.list[i].region_name+'</option>';                  
        }        
        $(d).html(str);
    }
}

function decodeUTF8(str){
  return str.replace(/(\\u)(\w{4}|\w{2})/gi, function($0,$1,$2){
    return String.fromCharCode(parseInt($2,16));
  }); 
} 

var EditAddress = new editAddress();
EditAddress.init();
})();


