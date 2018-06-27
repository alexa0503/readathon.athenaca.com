require('./bootstrap');
import Vue from 'vue'

import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);

import router from './router'
import store from './store'
import * as jssdk from './utils/wx'

let wxShare = async function (to) {
    //await store.dispatch('loading')
    let url = 'http://readathon.athenaca.com' + to.fullPath
    //console.log(window.location.href, url)
    //let url = window.location.href;
    await store.dispatch('getSelfInfo')
    if (store.state.self == undefined) {
        router.push({
            path: '/'
        })
    } else if (store.state.self.is_activated != 1 && (to.name == 'invite' || (to.name == 'account' && to.params.id == undefined) || to.name == 'profile')) {
        router.push({
            name: 'register'
        })
    }
    jssdk.initConfig(url)
    var share_desc, shareTimelineDesc
    if (store.state.self.has_joined == 1) {
        share_desc = store.state.self.name + "已经在阅读马拉松记录了" + store.state.self.activity_info.words_number + "个字数。Let's read together!"
        shareTimelineDesc = "书中也有万里路！ " + store.state.self.name + "已经在阅读马拉松记录了" + store.state.self.activity_info.words_number + "个字数。Let's read together!"

    } else {
        share_desc = store.state.self.nickname + "已经加入阅读马拉松。Let's read together!"
        shareTimelineDesc = "书中也有万里路！ " + store.state.self.nickname + "已经加入阅读马拉松。Let's read together!"
    }
    if (to.name == 'invite') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/invite/' + id
        jssdk.share({
            link: link,
            desc: share_desc,
            timelineDesc: shareTimelineDesc
        })
    } else if (to.name == 'board') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/page/board/' + id
        jssdk.share({
            link: link,
            desc: share_desc,
            timelineDesc: shareTimelineDesc
        })
    } else if (to.name == 'account') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/page/account/' + id
        jssdk.share({
            link: link,
            desc: share_desc,
            timelineDesc: shareTimelineDesc
        })
    } else {
        jssdk.share({
            desc: share_desc,
            timelineDesc: shareTimelineDesc
        })
    }
    var status = store.state.self.name != null ? 2 : 1;
    gtag('config', 'UA-117289831-2', {
        'page_title': to.name,
        'page_path': to.fullPath,
        'user_id': store.state.self.id,
        'custom_map': {
            'dimension2': 'register_status'
        }
    });
    gtag('event', 'register_status_dimension', {
        'event_label': '注册状态',
        'event_category': '用户',
        'value': status
    });
}
//根据路由切换背景
router.beforeEach((to, from, next) => {
    store.dispatch('loading')
    wxShare(to)
    if (to.name == 'account' || to.name == 'profile' || to.name == 'board' || to.name == 'register') {
        document.body.style.background = '#fff';
    } else if (to.name == 'invite') {
        document.body.style.background = '#a6dfee';
    } else {
        document.body.style.background = '#7fe2bf';
    }
    next()
})
router.afterEach((to, from) => {
    store.dispatch('finished')
})
Vue.filter('formatString', function (value) {
    if (!value) return ''
    if (value.length > 10) {
        return value.slice(0, 10) + '...'
    } else {
        return value
    }
})

Vue.filter('formatNumber', function (value) {
    if (!value) return '0';
    var intPartFormat = value.toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,'); //将整数部分逢三一断
    return intPartFormat;
})

// axios 拦截器
axios.interceptors.response.use(
    response => {
        return response;
    },
    error => {
        if (error.response) {
            switch (error.response.status) {
                case 401:
                    // 返回 401 清除token信息并跳转到登录页面
                    window.location.href = '/login?redirect=' + encodeURIComponent(router.currentRoute.fullPath)
            }
        }
        return Promise.reject(error) // 返回接口返回的错误信息
    }
);
const vm = new Vue({
    router,
    store,
    created: function () {
        store.dispatch('loading')
    },
    mounted: function () {
        $('.loading').hide();
        store.dispatch('finished')
    }
}).$mount('#app');