require('./bootstrap');
import Vue from 'vue'

import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);

import router from './router'
import store from './store'
import * as jssdk from './utils/wx'

let wxShare = async function (to) {
    //await store.dispatch('loading')
    await store.dispatch('getSelfInfo')
    jssdk.initConfig()
    if (to.name == 'invite') {
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/invite/' + id
        jssdk.share({
            link: link
        })
    }
    else if(to.name == 'account'){
        let id = store.state.self.id
        let link = 'http://readathon.athenaca.com/page/account/' + id
        jssdk.share({
            link: link
        })
    } else {
        jssdk.share()
    }
}
//根据路由切换背景
router.beforeEach((to, from, next) => {
    wxShare(to)
    if (to.name == 'account' || to.name == 'profile' || to.name == 'board') {
        document.body.style.background = '#fff';
    }
    else if(to.name == 'invite'){
        document.body.style.background = '#a6dfee';
    }
    else {
        document.body.style.background = '#7fe2bf';        
        //document.body.style.background = "#7fe2bf url('/images/bkg-01.png') 0 0 no-repeat";
    }
    next()
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