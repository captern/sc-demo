/**
 * Created by jiangyanghe on 16/6/2.
 */
fis.config.set('modules.postpackager','simple');
fis.config.merge({
    namespace : 'plan',
    pack : {
        'pkg/plan.css':[
            'static/index/**.scss',
            'widget/nav-grid/**.scss',
            'widget/brand-grid/**.scss',
            'widget/carousel/**.scss',
            'widget/coupon-grid/**.scss',
            'widget/section-category/**.scss'
        ],
        'pkg/plan.js':[
            'static/plan/**.js'
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
    //图片合并,边距为20;
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
        //使用fisp release -Dompd qa22来使用这个配置
        //开发环境
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