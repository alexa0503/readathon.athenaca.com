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
import ItemComponent from './../components/ItemComponent.vue';//兑换礼品
import InviteComponent from './../components/InviteComponent.vue';//邀请好友
import ActivityComponent from './../components/ActivityComponent.vue';//邀请好友
import AboutComponent from './../components/AboutComponent.vue';//关于马拉松

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/page/home',
            name: 'home',
            components: {
                'topper': SlidesComponent,
                'mainContent': IndexComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/register',
            name: 'register',
            components: {
                'topper': SlidesComponent,
                'mainContent': RegisterComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/board/:id?',
            name: 'board',
            components: {
                'mainContent': BoardComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/invite',
            name: 'invite',
            components: {
                //'topper': SlidesComponent,
                'mainContent': InviteComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/activity',
            name: 'activity',
            components: {
                'topper': SlidesComponent,
                'mainContent': ActivityComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/account/:id?',
            name: 'account',
            components: {
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
                'mainContent': FlowComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/profile',
            name: 'profile',
            components: {
                'mainContent': ProfileComponent,
                'modal': SucceededModalComponent
                //'navigation': NavigationComponent
            }
        },
        {
            path: '/page/question',
            name: 'question',
            components: {
                'topper': SlidesComponent,
                'mainContent': QuestionComponent,
                'navigation': NavigationComponent
            }
            
        },
        {
            path: '/page/prize/:id?',
            name: 'prize',
            components: {
                'topper': SlidesComponent,
                'mainContent': PrizeComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/item/:id?',
            name: 'item',
            components: {
                'topper': SlidesComponent,
                'mainContent': ItemComponent,
                'navigation': NavigationComponent
            }
        },
        {
            path: '/page/about/:page?/:id?',
            name: 'about',
            components: {
                'topper': SlidesComponent,
                'mainContent': AboutComponent,
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


export default router