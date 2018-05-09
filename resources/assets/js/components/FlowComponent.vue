<template>
    <div class="container-fluid flow-chart" v-if="!loading">
            <div class="flow-chart-return"><img src="/images/icon-return-01.png" v-on:click="previous" /></div>
            <div class="flow-chart-topper">阅读马拉松流程</div>
            <div class="flow-chart-content">
                <div class="flow-chart-number">01</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">注册参赛资格</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">02</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">测试阅读水平<br/>获得阅读书单推荐</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">03</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">激活参赛资格</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">04</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">进入30天阅读赛</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">05</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">坚持阅读<br/>每日记录阅读字数</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">06</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">参加各种活动，邀请好友<br/>获得更多字数累计</div></div>
            </div>
             <div class="flow-chart-content">
                <div class="flow-chart-number">07</div>
                <div class="flow-chart-title"><div class="flow-chart-title-center">比赛结束<br/>领取奖品和证书，收获满满</div></div>
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
        computed: mapState({
            loading: 'loading',
        }),
        created() {
            //this.$store.dispatch('initFlowPage')
        },
        methods:{
            previous: function(){
                this.$router.go(-1)
            }
        }
    }
</script>
