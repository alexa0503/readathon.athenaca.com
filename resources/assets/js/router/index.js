import VueRouter from 'vue-router'
import Vue from 'vue'
//import store from './../store'
Vue.use(VueRouter)

import SlidesComponent from './../components/SlidesComponent.vue';//幻灯片
import RegisterComponent from './../components/RegisterComponent.vue';//注册
import NavigationComponent from './../components/NavigationComponent.vue';//导航模块
import IndexComponent from './../components/IndexComponent.vue';//首页
import BoardComponent from './../components/BoardComponent.vue';//榜单
import PreloadComponent from './../components/PreloadComponent.vue';//预加载
import FlowComponent from './../components/FlowComponent.vue';//流程图
import AccountComponent from './../components/AccountComponent.vue';//我的账户
import ProfileComponent from './../components/ProfileComponent.vue';//编辑信息
import ModalComponent from './../components/ModalComponent.vue';//Modal提示
import SucceededModalComponent from './../components/SucceededModalComponent.vue';//Modal提示
import QuestionComponent from './../components/QuestionComponent.vue';//Modal提示
import PrizeComponent from './../components/PrizeComponent.vue';//奖品
import InviteComponent from './../components/InviteComponent.vue';//邀请好友
import ActivityComponent from './../components/ActivityComponent.vue';//邀请好友

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/page',
            name: 'home',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': IndexComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/register',
            name: 'register',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': RegisterComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/board',
            name: 'board',
            components: {
                'loading':PreloadComponent,
                'mainContent': BoardComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/invite',
            name: 'invite',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': InviteComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/activity',
            name: 'activity',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': ActivityComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/account/:id?',
            name: 'account',
            components: {
                'loading':PreloadComponent,
                //'topper': SlidesComponent,
                'mainContent': AccountComponent,
                'navigation': NavigationComponent,
                'modal': ModalComponent
            }
        },
        {
            path: '/page/flow',
            name: 'flow',
            components: {
                'loading':PreloadComponent,
                'mainContent': FlowComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/profile',
            name: 'profile',
            components: {
                'loading':PreloadComponent,
                'mainContent': ProfileComponent,
                'modal': SucceededModalComponent
                //'navigation': NavigationComponent
            }
        },
        {
            path: '/page/question',
            name: 'question',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': QuestionComponent,
                'navigation': NavigationComponent
            }
            
        },
        {
            path: '/page/prize/:id?',
            name: 'prize',
            components: {
                'loading':PreloadComponent,
                //'topper': SlidesComponent,
                'mainContent': PrizeComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/about',
            name: 'about',
            components: {
                'loading':PreloadComponent,
                'topper': SlidesComponent,
                'mainContent': QuestionComponent,
                'navigation': NavigationComponent
            }
        },
    ]
});

/*
router.afterEach((to, from) => {
    //store.dispatch('finished')
})
*/
//根据路由切换背景
router.beforeEach((to, from, next) => {
    if( to.name == 'account' || to.name == 'profile' ){
        document.body.style.background = '#ebf0f2';
    }
    else{
        document.body.style.background = "#7fe2bf url('/images/bkg-01.png') 0 0 no-repeat";        
    }
    next()
})

export default router