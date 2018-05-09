require('./bootstrap');

import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);


import router from './router'
import store from './store'

const vm = new Vue({
    router,
    store,
    created: function(){
        store.dispatch('loading')
    },
    mounted: function(){
        store.dispatch('finished')
    }
}).$mount('#app');

