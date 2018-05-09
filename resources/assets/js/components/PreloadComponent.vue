<template>
    <div class="loading" v-if="loading">
        <div class="main-content"><img src="/images/icon-logo.png"/><p>Loading...</p></div>
    </div>
</template>

<script>
    import {mapGetters, mapActions} from 'vuex'
    import * as jssdk from './../utils/wx' 
    export default {
        computed: mapGetters({
            loading: 'loading'
        }),
        created(){
            jssdk.initConfig()
            jssdk.share({
                title: '坚持阅读，人生处处有惊喜！',
                desc: '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
                imgUrl: 'http://readathon.athenaca.com/image/share.png',
                link: 'http://readathon.athenaca.com/'
            })
        }
    }
</script>