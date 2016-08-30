fis.config.set('modules.postpackager','simple');
fis.config.merge({
    namespace : 'article',
    pack : {
        'pkg/detail.css':[
            'static/detail/**.scss'
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
        domain:'http://sh1.hoopchina.com.cn/fis_static/kalulimobile'
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
            to: '/opt/www/kaluli/web/fis_static/kalulimobile',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli/apps/kalulimobile/fis_view'
        }],  
        qa3: [{
            receiver: 'http://192.168.9.3/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli/web/fis_static/kalulimobile/',
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli/apps/kalulimobile/fis_view'
        }],     
        //本地
        local:{
            to:'../output'
        }
    }
});