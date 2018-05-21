<template>
    <div class="container-fluid" v-if="!loading">
        <div class=" position-relative board-topper">
            <div class="board-title">
                <h3>排行榜</h3>
            </div>
            <div class="board-select">
                <div class=" d-flex justify-content-around">
                    <div class="form-group">
                        <select class="form-control" v-model="ageGroupId" v-on:change="fetchMore(false)">
                            <option value="">年龄/全部</option>
                            <option v-for="ageGroup in ageGroups" v-bind:key="ageGroup.id" v-bind:value="ageGroup.id">{{ ageGroup.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" v-model="cityId" v-on:change="fetchMore(false)">
                            <option value="">城市/全国</option>
                            <option v-for="city in cities" v-bind:key="city.id" v-bind:value="city.id">{{ city.name }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" v-model="activityId" v-on:change="fetchMore(false)">
                            <option value="" disabled="disabled">赛季/当前</option>
                            <option v-for="activity in activities" v-bind:key="activity.id" v-bind:value="activity.id">{{ activity.name }}</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="board-content">
            <div class="board-list board-list-home" v-if="currentPage == 1 && id != undefined && boardList.data && boardList.data.length > 0">
                <div class="board-no-activated">
                    <router-link :to="{ name: 'board' }">查看所有</router-link>
                </div>
            </div>
            <div v-for="(item,index) in boardList.data" v-bind:key="item.id" class="board-list " v-bind:class="getClass(item)">
                <div class="vote">
                    <span>{{ item.voted_number }}</span>
                    <a href="javascript:;" v-if="item.has_voted == 1" v-on:click="vote(item.user.id, index)">
                        <img src="/images/icon-voted.png" />
                    </a>
                    <a href="javascript:;" v-on:click="vote(item.user.id, index)" v-else>
                        <img src="/images/icon-vote.png" />
                    </a>
                </div>
                <div class="star">{{ item.words_number }}</div>
                <div class="name-text"><router-link :to="{ name: 'account', params: {id: item.user.id} }">{{ item.user.name | formatString }}</router-link></div>
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
        data() {
            return {
                ageGroupId: '',
                cityId: '',
                activityId: '',
                currentPage: 1,
                id: undefined,
                fetching: false
            }
        },
        computed: {
            ...mapState({
                loading: 'loading',
                cities: 'cities',
                activities: 'activities',
                boardList: 'boardList',
                ageGroups: 'ageGroups',
                showMore(state) {
                    return state.boardList.meta && (state.boardList.meta.current_page != state.boardList.meta.last_page)
                },
                isCurrentActivity(state) {
                    return state.boardList.meta.is_current_activity
                }
            })
        },
        created() {
            let vm = this
            vm.id = vm.$router.history.current.params.id
            vm.$store.dispatch('initBoardPage', vm.id)
        },
        watch: {
            '$route' (to, from) {
                this.id = to.params.id
                this.$store.dispatch('initBoardPage', this.id)
                // 对路由变化作出响应...
            }
        },
        methods: {
            getClass: function (item) {
                if (this.id == item.user.id && this.id != undefined) {
                    return 'board-list-home'
                } else {
                    return item.rank < 4 ? 'board-list-' + item.rank : 'board-list-others'
                }
            },
            fetchMore: function (more = false) {
                let vm = this
                let page = vm.currentPage;
                let id = vm.id
                vm.fetching = true
                if (more == true) {
                    page = vm.boardList.meta.current_page + 1
                }

                let data = {
                    page: page,
                    id: id,
                    ageGroup: vm.ageGroupId,
                    city: vm.cityId,
                    activity: vm.activityId
                }
                vm.$store.dispatch('getBoardList', data).then((response) => {
                    if( response.meta.current_page < response.meta.last_page){
                        vm.fetching = false
                    }
                })
            },
            vote: function (user_id, index) {
                if (this.isCurrentActivity == 1) {
                    this.$store.dispatch('vote', {
                        user_id,
                        index
                    })
                }
            },
            handleScroll: function () {
                let vm = this
                let scrollTop = $(window).scrollTop();
                let scrollHeight = $(document).height();
                let windowHeight = $(window).height();
                if (scrollTop > 0 && scrollHeight - (scrollTop + windowHeight) < 40 && !vm.fetching) {
                    //vm.fetching = true
                    vm.fetchMore(true)
                }
            }
        },
        mounted() {
            window.addEventListener('scroll', this.handleScroll); //监听页面滚动事件
        },
        destroyed() {
            console.log('destroyed')
            window.removeEventListener('scroll', this.handleScroll); //监听页面滚动事件
        },

    }
</script>