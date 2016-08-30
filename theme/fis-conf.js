fis.config.merge({
    namespace : 'theme',
    pack : {
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
    project:{
        exclude:['**/_*.scss']
    },
    deploy:{
        //使用fisp release -Dompd ***来使用这个配置
        //开发环境
        qa80: [{
            receiver: 'http://192.168.8.80/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli_new/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        },{
            receiver: 'http://192.168.8.80/receiver.php',
            from: "/plugin",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }],
        qa3: [{
            receiver: 'http://192.168.9.3/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli_new/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }],
        qa3test: [{
            receiver: 'http://192.168.9.3/receiver.php',
            from: '/static',
            to: '/opt/www/trunk/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/template",
            to: '/opt/www/trunk/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/config",
            to: '/opt/www/trunk/apps/kalulimobile/fis_view'
        }],
        qa181: [{
            receiver: 'http://192.168.8.181/receiver.php',
            from: '/static',
            to: '/data/www-data/shihuo_special/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/template",
            to: '/data/www-data/shihuo_special/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/config",
            to: '/data/www-data/shihuo_special/apps/kalulimobile/fis_view'
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