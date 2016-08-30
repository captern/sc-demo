fis.config.set('modules.postpackager','simple');
fis.config.merge({
    namespace : 'order',
    pack : {
        'pkg/detail.css':[            
            'static/detail/**.scss',
            'ucenter:widget/myorderList/**.scss',            
        ],
        'pkg/orderLogistics.css':[
            'static/orderLogistics/**.scss'
        ],
        'pkg/cart.css':[
            'static/cart/**.scss',
            'widget/cartlist/**.scss'
        ],
        'pkg/confirm.css':[
            'static/confirm/**.scss',
            'widget/address/**.scss'
        ],
        'pkh/cart.js':[
            'widget/cartlist/**.js'
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
            to: '/opt/www/kaluli_new/web/fis_static/kalulimobile',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }],
        qa181: [{
            receiver: 'http://192.168.8.181/receiver.php',
            from: '/static',
            to: '/data/www-data/kaluli_coupon/web/fis_static/kalulimobile/'
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/template",
            to: '/data/www-data/kaluli_coupon/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/config",
            to: '/data/www-data/kaluli_coupon/apps/kalulimobile/fis_view'
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