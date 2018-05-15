<template>
    <div class="container-fluid invite" v-if="!loading">
        <div class="invite-content" v-on:click="show">
                <!--坚持阅读，人生处处有惊喜！<br/>邀请好友一起参加阅读马拉松就能获得500字数奖励！-->
        </div>
        <div class="invite-share-bg" v-on:click="close" v-if="share"></div>
        <div class="invite-share-content" v-if="share"><div class="share-txt">点击右上角分享<div class="left-eye"><img src="/images/icon-eye.png" /></div><div class="right-eye"><img src="/images/icon-eye.png" /></div></div></div>
    </div>
</template>

<script>
    import {
        mapGetters,
        mapState,
        mapActions
    } from 'vuex'
    export default {
        data(){
            return {
                share: true
            }
        },
        computed: mapState({
            loading: 'loading',
            user: 'self'
        }),
        created() {
            this.$store.dispatch('initInvitePage')
        },
        methods:{
            previous: function(){
                this.$router.go(-1)
            },
            close: function(){
                this.share = false
            },
            show: function(){
                this.share = true
            }
        }
    }
</script>
