<template>
    <div class="container-fluid" v-if="!loading">
        <div class="board-content">
            <div class="board-list board-list-home" v-if="user.is_activated == 1  && user.has_joined == 1">
                <div class="vote">
                    <span>{{ user.activity_info.voted_number }}</span>
                    <a href="javascript:;" v-on:click="vote(user.id)">
                        <img src="/images/icon-voted.png" v-if="user.activity_info.has_voted == 1" />
                        <img src="/images/icon-vote.png" v-else />
                    </a>
                </div>
                <div class="star">{{ user.activity_info.words_number }}</div>
                <div class="name-text"><router-link :to="{ name: 'account', params: {id: user.id} }">{{user.nickname | formatString }}</router-link></div>
                <div class="number">
                    <span>{{ user.activity_info.rank }}</span>
                </div>
                <div class="avatar">
                    <router-link :to="{ name: 'account', params: {id: user.id} }"><img :src="user.avatar" class="rounded-circle" /></router-link>
                </div>
            </div>
            <div class="board-list board-list-home" v-else-if="!hasCurrent">
                <div class="board-no-activated-02">
                    <router-link :to="{ name: 'account' }">{{ nextActivity.name }}开赛时间为{{ nextActivity.start_date }}-{{ nextActivity.end_date }}，敬请期待！</router-link>
                </div>
            </div>
            <div class="board-list board-list-home" v-else-if="user.is_activated == 1 && user.has_joined == 0">
                <div class="board-no-activated-02">
                    <router-link :to="{ name: 'account' }">当前是{{ currentActivityName }}，您还没有加入比赛。请添加阅读记录，正式成为参赛者！</router-link>
                </div>
            </div>
            <div class="board-list board-list-home" v-else>
                <div class="board-no-activated">
                    <router-link :to="{ name: 'register' }">我也参加阅读马拉松</router-link>
                </div>
            </div>
            <div class="board-list board-list-home-others" v-for="(item,index) in boardList.data" v-bind:key="index">
                <div class="vote">
                    <span>{{ item.voted_number }}</span>
                    <a href="javascript:;" v-if="item.has_voted == 1"  v-on:click="vote(item.user.id, index)">
                        <img src="/images/icon-voted.png" />
                    </a>
                    <a href="javascript:;" v-on:click="vote(item.user.id, index)" v-else>
                        <img src="/images/icon-vote.png" />
                    </a>
                </div>
                <div class="star">{{ item.words_number }}</div>
                <div class="name-text"><router-link :to="{ name: 'account', params: {id: item.user.id} }">{{ item.user.nickname | formatString }}</router-link></div>
                <div class="number">
                    <span>{{ item.rank }}</span>
                </div>
                <div class="avatar">
                    <router-link :to="{ name: 'account', params: {id: item.user.id} }"><img :src="item.user.avatar" class="rounded-circle" /></router-link>
                </div>
            </div>
        </div>
        <div class="row board-more" v-if="showMore && !fetching" v-on:click="fetchMore(true)">
            <img src="/images/icon-more-01.png" />
        </div>
        <div class="row board-more" v-if="showMore && fetching">
            加载中...
        </div>
        <div class="board-space"></div>
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
                currentPage: 1,
                fetching: false,
            }
        },
        computed: mapState({
            loading: 'loading',
            user: 'self',
            boardList: 'homeBoardList',
            showMore(state) {
                return state.homeBoardList.meta && (state.homeBoardList.meta.current_page != state.homeBoardList.meta.last_page)
            },
            hasCurrent(state){
                if( state.homeBoardList && state.homeBoardList.ret == 1001 ){
                    return false
                }
                else{
                    return true
                }
            },
            nextActivity(state){
                if( state.homeBoardList && state.homeBoardList.ret == 1001 ){
                    return state.homeBoardList.latest
                }
            },
            currentActivityName(state){
                if( state.homeBoardList.meta && state.homeBoardList.meta.current_activity ){
                    return state.homeBoardList.meta.current_activity.name
                }
            }
        }),
        created() {
            this.$store.dispatch('initIndexPage')
            this.$store.dispatch('sendUtm');
        },
        methods: {
            fetchMore: function (more = false) {
                let vm = this
                let page = vm.currentPage;
                vm.fetching = true
                if (more == true) {
                    page = vm.boardList.meta.current_page + 1
                }
                vm.$store.dispatch('getBoardList', {
                    page: page,
                    name: 'home',
                    type: 'withoutme'
                }).then((response) => {
                    if( response.meta.current_page < response.meta.last_page){
                        vm.fetching = false
                    }
                })
            },
            vote: function (user_id, index) {
                let name = 'home'
                this.$store.dispatch('vote', {
                    user_id,
                    index,
                    name
                })
            },
            handleScroll: function(){
                let vm = this
                let scrollTop = $(window).scrollTop();
                let scrollHeight = $(document).height();
                let windowHeight = $(window).height();
                if (scrollTop > 0 && scrollHeight - (scrollTop + windowHeight) < 40 && !vm.fetching) {
                    vm.fetchMore(true)
                }
            }
        },
        mounted () {
            window.addEventListener('scroll', this.handleScroll);//监听页面滚动事件
        },
        destroyed(){
            window.removeEventListener('scroll', this.handleScroll);//监听页面滚动事件
        },
    }
</script>