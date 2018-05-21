<template>
    <div class="container-fluid invite" v-if="!loading">
        <div class="invite-content" v-on:click="show">
                <!--坚持阅读，人生处处有惊喜！<br/>邀请好友一起参加阅读马拉松就能获得500字数奖励！-->
        </div>
        
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
