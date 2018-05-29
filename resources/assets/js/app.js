require('./bootstrap');
import Vue from 'vue'

import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);

import router from './router'
import store from './store'
import * as jssdk from './utils/wx'

let wxShare = async function (to) {
    //await store.dispatch('loading')
    let url = 'http://readathon.athenaca.com'+to.fullPath
    //console.log(window.location.href, url)
    //let url = window.location.href;
    await store.dispatch('getSelfInfo')
    if (store.state.self == undefined) {
        router.push({
            path: '/'
        })
    } else if (store.state.self.is_activated != 1 && (to.name == 'invite' || ( to.name == 'account' && to.params.id == undefined ) || to.name == 'profile')) {
        router.push({
            name: 'register'
        })
    }
    jssdk.initConfig(url)
    //书中也有万里路！ xx已经在阅读马拉松记录了xxx字数。Let's read together!
    //书中也有万里路！ xx已经加入阅读马拉松。Let's read together!
    var share_desc
    if( store.state.self.has_joined == 1 ){
        share_desc = "书中也有万里路！ "+store.state.self.name+"已经在阅读马拉松记录了"+store.state.self.activity_info.words_number+"字数。Let's read together!"
    }
    else{
        share_desc = "书中也有万里路！ "+store.state.self.nickname+"已经加入阅读马拉松。Let's read together!"
    }
    if (to.name == 'invite') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/invite/' + id
        jssdk.share({
            link: link,
            desc: share_desc
        })
    } else if (to.name == 'board') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/page/board/' + id
        jssdk.share({
            link: link,
            desc: share_desc
        })
    } else if (to.name == 'account') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/page/account/' + id
        jssdk.share({
            link: link,
            desc: share_desc
        })
    } else {
        jssdk.share({
            desc: share_desc
        })
    }
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
        //document.body.style.background = "#7fe2bf url('/images/bkg-01.png') 0 0 no-repeat";
    }
    gtag('config', 'UA-117289831-2', {
        'page_title' : to.name,
        'page_path': to.fullPath
    });
    next()
})
router.afterEach((to, from)=>{
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