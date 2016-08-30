fis.config.set('modules.postpackager','simple');
fis.config.merge({
    namespace : 'activity',
    pack : {
        'pkg/maiyisongyi.css':[
            'static/maiyisongyi/**.scss'
        ],
        'pkg/guoqing.css':[
            'static/guoqing/**.scss'
        ],
        'pkg/maiyisongyi.js':[
            'static/maiyisongyi/**.js'
        ],
        'pkg/discount.js':[
            'static/discount/**.js'
        ],
        'pkg/guoqing.js':[
            'static/guoqing/**.js'
        ],
        'pkg/panicbuy.css':[]
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
        //ʹ��fisp release -Dompd qa80��ʹ���������
        //��������
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
            to: '/data/www-data/hup.com/kaluli//web/fis_static/kalulimobile/',
        }, {
            receiver: 'http://192.168.11.22/receiver.php',
            from: "/template",
            to: '/data/www-data/hupu.com/kaluli/apps/kalulimobile/fis_view'
        }, {
            receiver: 'http://192.168.11.22/receiver.php',
            from: "/config",
            to: '/data/www-data/hupu.com/kaluli/apps/kalulimobile/fis_view'
        }],
        //����
        local:{
            to:'../output'
        }
    }
});