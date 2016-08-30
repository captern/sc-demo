fis.config.set('modules.postpackager','simple');
fis.config.merge({
    namespace : 'item',
    pack : {
        'pkg/list.css':[
            'static/list/**.scss',
            'widget/filter-nav/**.scss',
            'widget/prolist/**.scss'
        ],
        'pkg/detail.css':[
            'static/detail/**.scss',
            'widget/pdpCarousel/**.scss',
            'widget/switchInfo/**.scss',
            'widget/buyarea/**.scss',
            'widget/comment/**.scss',
            'widget/share/**.scss'
        ],
        'pkg/commentlist.css':[
            'static/commentlist/**.scss'
        ],
        'pkg/detail.js':[            
            'widget/pdpCarousel/**.js',
            'widget/switchInfo/**.js',
            'widget/share/**.js',
            'widget/buyarea/**.js'
        ],
        'pkg/list.js':[            
            'static/list/**.js',
            'widget/filter-nav/**.js'
        ]
    },
    modules:{
        parser:{
            sass:'sass',
            scss:'sass'
        }
    },
    roadmap:{
        ext:{
            scss:'css',
            sass:'css'
        },
        path:{
            reg:'**.css',
            useSprite:true
        },
        domain:'http://kaluli.hoopchina.com.cn/fis_static/kalulimobile'
    },
    settings:{
        spriter:{
            csssprites:{
                margin:'20',
                scale:1
            }
        }        
    },
    project:{
        exclude:['**/_*.scss']
    },
    deploy:{
        //使用fisp release -Dompd qa80来使用这个配置
        //开发环境
        qa80: [{
            receiver: 'http://192.168.8.80/receiver.php',
            from: '/static',
            to: '/wwwroot/www/hc_kaluli/web/fis_static/kalulimobile',
            exclude: [/\/sass\//i]
        },{
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/template",
            to: '/wwwroot/www/hc_kaluli/apps/kalulimobile/fis_view'
        },{
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/config",
            to: '/wwwroot/www/hc_kaluli/apps/kalulimobile/fis_view'
        }],    
        qa3: [{
            receiver: 'http://192.168.9.3/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli_dev/web/fis_static/kalulimobile/'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_dev/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_dev/apps/kalulimobile/fis_view'
        }], 
        qa169: [{
            receiver: 'http://www.t.com/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli_/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://www.t.com/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://www.t.com/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }], 
        qa181: [{
            receiver: 'http://192.168.8.181/receiver.php',
            from: '/static',
            to: '/data/www-data/kaluli_coupon/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/template",
            to: '/data/www-data/kaluli_coupon/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/config",
            to: '/data/www-data/kaluli_coupon/apps/kalulimobile/fis_view'
        }],
        qa22: [{
            receiver: 'http://192.168.11.22/receiver.php',
            from: '/static',
            to: '/data/www-data/hupu.com/kaluli/web/fis_static/kalulimobile/'
        }, {
            receiver: 'http://192.168.11.22/receiver.php',
            from: "/template",
            to: '/data/www-data/hupu.com/kaluli/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.11.22/receiver.php',
            from: "/config",
            to: '/data/www-data/hupu.com/kaluli/apps/kalulimobile/fis_view'
        }],
        //本地
        local:{
            to:'../output'
        }
    }
});