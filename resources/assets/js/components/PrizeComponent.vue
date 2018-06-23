<template>
    <div class="container-fluid prize-page" v-if="!loading">
        <div class="prize-btns" v-if="status">
            <router-link :to="{name:'item'}" class="btn btn-warning">字数兑换</router-link>
            <router-link :to="{name:'prize'}" class="btn btn-warning disabled">奖品兑换</router-link>
        </div>
        <div class="text-center activity-title" v-if="status">{{ activity.name }}</div>
        <div class="prize-content" v-if="!status">
            <h3>敬请期待</h3>
            <div>目前还没有奖品可以领取</div>
        </div>
        <div class="prize-content" v-if="status" v-for="prize in prizes" v-bind:key="prize.id">
            <h3>{{ prize.name }}</h3>
            <div v-html="prize.body"></div>
            <div class="prize-button">
                <button type="button" class="btn btn-warning btn-lg disabled" v-if="prize.received_status == 1">已领取</button>
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 2">不可领取</button>
                <!--活动未结束-->
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 6">不可领取</button>
                <!--已领取其他奖品-->
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 7">不可领取</button>
                <!--未激活或未参加活动-->
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 3">不可领取</button>
                <!--未到领奖日期-->
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 4">已过领取奖期限</button>
                <!--已过领奖期限-->
                <button type="button" v-on:click="receivePrize(prize.id)" class="btn btn-warning btn-lg" v-else-if="prize.received_status == 0">领取奖品</button>
                <button type="button" class="btn btn-warning btn-lg disabled" v-else>不可领取</button>
                <!--未获得该奖品-->
            </div>
        </div>
        <div class="row board-more" v-if="status && morePrizes && !fetching" v-on:click="fetchMore(true)">
            <img src="/images/icon-more-01.png" />
        </div>
        <div class="row board-more" v-if="status && morePrizes && fetching">
            加载中...
        </div>
        <div class="board-space"></div>

        <div class="modal fade" id="prizeModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h3>Yeah！领取成功！</h3>
                        <p>请在五个工作日内至知慧学院领取奖品！</p>
                        <button type="button" class="btn btn-go btn-info" data-dismiss="modal" aria-label="Close">
                            确定
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Slick from 'vue-slick'
    import {
        mapGetters,
        mapState,
        mapActions
    } from 'vuex'
    import * as apiUrls from './../utils/api-urls'
    export default {
        components: {
            Slick
        },
        data() {
            return {
                hasError: false,
                hasPosted: false,
                fetching: false,
                slickOptions: {
                    slidesToShow: 1,
                    dots: true,
                    autoplay: true,
                    focusOnSelect: true,
                    autoplaySpeed: 5000
                },
            }
        },
        computed: {
            ...mapState({
                loading: 'loading',
                prizes(state) {
                    if (state.prizesData.data == undefined) {
                        return '';
                    }
                    return state.prizesData.data.prizes.data
                },
                activity(state) {
                    if (state.prizesData.data == undefined) {
                        return '';
                    }
                    return state.prizesData.data.activity
                },
                status(state) {
                    return state.prizesData && state.prizesData.ret == 0 && state.prizesData.data.prizes.total > 0 ?
                        true : false
                },
                morePrizes(state) {
                    if (state.prizesData.data == undefined) {
                        return false;
                    }
                    let prizes = state.prizesData.data.prizes
                    return prizes.current_page < prizes.last_page
                },
                current_page(state) {
                    if (state.prizesData.data == undefined) {
                        return 1;
                    }
                    return state.prizesData.data.prizes.current_page
                }
            })
        },
        created() {
            let id = this.$route.params.id
            this.$store.dispatch('getPrizes', {
                id: id
            })
            //this.$store.dispatch('initPrizePage', id)
        },
        watch: {
            $route(to, from) {
                let id = to.params.id
                this.$store.dispatch('getPrizes', {
                    id: id
                })
            }
        },
        methods: {
            fetchMore: function (more = false) {
                let vm = this
                vm.fetching = true
                let page = vm.current_page + 1
                let id = vm.$route.params.id
               vm.$store.dispatch('getPrizes', {
                    id: id,
                    more: more,
                    page: page
                }).then((response)=>{
                    if(response.data.prizes.current_page < response.data.prizes.last_page){
                        vm.fetching = false
                    }
                })
               
            },
            handleScroll: function () {
                let vm = this
                let scrollTop = $(window).scrollTop();
                let scrollHeight = $(document).height();
                let windowHeight = $(window).height();
                if (scrollTop > 0 && scrollHeight - (scrollTop + windowHeight) < 40 && !vm.fetching) {
                    vm.fetchMore(true)
                }
            },
            receivePrize: function (id) {
                let url = apiUrls.RECEIVE_URL + '/' + id
                let vm = this
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    axios.post(url).then(function (response) {
                            let id = vm.$route.params.id
                            vm.$store.dispatch('getPrizes', {
                                id: id
                            })
                            $('#prizeModal').modal('show')
                            vm.hasPosted = false
                        })
                        .catch(function (error) {
                            vm.hasPosted = false
                            if (error.response.status == 403) {
                                $('#prizeModal .modal-body h3').html('抱歉，' + error.response.data.errMsg)
                                $('#prizeModal .modal-body p').html('如有疑问，请联系客服人员')
                                $('#prizeModal').modal('show')
                            } else {
                                alert('服务器发生错误')
                            }
                        })
                }
            }
        },
        mounted() {
            window.addEventListener('scroll', this.handleScroll); //监听页面滚动事件
        },
        destroyed() {
            window.removeEventListener('scroll', this.handleScroll); //监听页面滚动事件
        },
    }
</script>