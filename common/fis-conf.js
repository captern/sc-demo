fis.config.merge({
    namespace : 'common',
    pack : {
        'pkg/common.css':[
            'static/sass/common.scss',
            'widget/footer/**.scss',
            'widget/nav-fixed/**.scss',
            'widget/header/**.css'
        ],
        'pkg/lib.js':[
            'static/js/mod-amd.js',
            'static/js/zepto/zepto.min.js',
            'static/js/flexible/flexible.js',
            'static/js/common.js'
        ]
    },
    modules:{
        parser:{
            sass:'sass',
            scss:'sass'
        },
        scss:'sass'
    },
    roadmap:{
        ext:{
            scss:'css',
            sass:'css'
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
            receiver: 'http://192.168.8.80/receiver.php',//如果配置了receiver，fis会把文件逐个post到接收端上
            from: '/static',
            to: '/opt/www/kaluli_new/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]//某些后缀的文件不进行上传
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
            to: '/opt/www/kaluli_dev/web/fis_static/kalulimobile/'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/template",
            to: '/opt/www/kaluli_dev/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/config",
            to: '/opt/www/kaluli_dev/apps/kalulimobile/fis_view'
        },{
            receiver: 'http://192.168.9.3/receiver.php',
            from: "/plugin",
            to: '/opt/www/kaluli_dev/apps/kalulimobile/fis_view'
        }],
        qa169: [{
           receiver: 'http://www.t.com/receiver.php',
            from: "/plugin",
            to: '/opt/www/kaluli_new/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://www.t.com/receiver.php',
            from: '/static',
            to: '/opt/www/kaluli_new/web/fis_static/kalulimobile/',
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
            to: '/data/www-data/hc/web/fis_static/kalulimobile/',
            exclude: [/\/sass\//i]
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/template",
            to: '/data/www-data/hc/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.8.181/receiver.php',
            from: "/config",
            to: '/data/www-data/hc/apps/kalulimobile/fis_view'
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