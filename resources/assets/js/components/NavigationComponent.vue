<template>
    <div class="fixed-bottom" id="navigation">
        <ul class="nav nav-pills nav-fill">
            <li class="nav-item">
                <router-link class="nav-link no-dropdown" active-class="active" :to="{ name: 'home',query: {'_':'1'} }">
                    <i class="nav-icon nav-icon-index"></i>首页
                </router-link>
            </li>
            <li class="nav-item">
                <router-link class="nav-link no-dropdown" active-class="active" :to="{ name: 'board' }">
                    <i class="nav-icon nav-icon-board"></i>排名榜</router-link>
            </li>
            <li class="nav-item">
                <router-link class="nav-link no-dropdown" active-class="active" :to="{ name: 'invite' }">
                    <i class="nav-icon nav-icon-invite"></i>邀请好友</router-link>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" v-bind:class="active == true ? 'active' : ''" v-on:click="clearActive" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    href="javascript:;">
                    <i class="nav-icon nav-icon-activity"></i>比赛动态</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <router-link class="dropdown-item" active-class="active" :to="{ name: 'activity' }">阅读动态</router-link>
                    <router-link class="dropdown-item" active-class="active" :to="{ name: 'item' }">兑换奖品</router-link>
                    <router-link class="dropdown-item" active-class="active" :to="{ name: 'question' }">有奖问答</router-link>
                    <div class="dropdown-divider"></div>
                    <router-link class="dropdown-item" active-class="active" :to="{ name: 'about' }">关于阅读马拉松</router-link>
                </div>
            </li>
            <li class="nav-item">
                <router-link class="nav-link no-dropdown" active-class="active" :to="{ name: 'account' }">
                    <i class="nav-icon nav-icon-account"></i>我的账户</router-link>
            </li>
        </ul>
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
                active: false
            }
        },
        created(){
            let name = this.$router.history.current.name
            if( name == 'question' || name == 'prize' || name == 'about' || name == 'activity' || name == 'item'){
                this.active = true
            }
            else{
                this.active = false
            }
        },
        computed: {
            ...mapState({
                loading: 'loading'
            })
        },
        methods: {
            clearActive: function () {
                $('.no-dropdown').removeClass('active')
                //$('.dropdown-toggle').addClass('active')
            }
        },
        watch: {
            $route (to, from) {
                let name = to.name
                if( name == 'question' || name == 'prize' || name == 'about' || name == 'activity'|| name == 'item'){
                    this.active = true
                }
                else{
                    this.active = false
                }
            }
        }
    }
</script>