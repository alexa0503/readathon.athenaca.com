<template>
    <div class="container-fluid prize-page" v-if="!loading">
        <div class="prize-btns" v-if="status">
            <router-link :to="{name:'item'}" class="btn btn-warning disabled">字数兑换</router-link>
            <router-link :to="{name:'prize'}" class="btn btn-warning">奖品兑换</router-link>
        </div>
        <div class="text-center activity-title" v-if="status">{{ activity.name }}可兑换字数 {{ exchanged_words_number }}</div>
        <div class="prize-content" v-if="!status">
            <h3>敬请期待</h3>
            <div>目前还没有奖品可以领取</div>
        </div>
        <div class="prize-content" v-if="status" v-for="item in items" v-bind:key="item.id">
            <h3>{{ item.name }}</h3>
            <div>字数：{{ item.words_number }}</div>
            <div>适用城市：{{ item.city_names }}</div>
            <div class="mb-4">份数：{{ item.remaining_number }}/{{ item.total_number }}(共{{ item.remaining_number }}份剩余{{ item.total_number }}份)</div>
            <div v-html="item.body"></div>
            <div class="prize-button">
                <button type="button" class="btn btn-warning btn-lg disabled" v-if="item.received_status == 1">已兑换</button>
                <!--已过领奖期限-->
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="item.received_status == 4">已兑换完</button>
                <button type="button" v-on:click="receiveItem(item.id)" class="btn btn-warning btn-lg" v-else-if="item.received_status == 0">兑换字数</button>
                <button type="button" class="btn btn-warning btn-lg disabled" v-else>无法兑换</button>
                <!--未获得该奖品-->
            </div>
        </div>
        <div class="row board-more" v-if="status && moreItems && !fetching" v-on:click="fetchMore(true)">
            <img src="/images/icon-more-01.png" />
        </div>
        <div class="row board-more" v-if="status && moreItems && fetching">
            加载中...
        </div>
        <div class="board-space"></div>

        <div class="modal fade" id="prizeModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h3>Yeah！领取成功！</h3>
                        <p>请联系客服人员去兑换奖品！</p>
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
                items(state) {
                    if (state.items.data == undefined) {
                        return '';
                    }
                    return state.items.data.items.data
                },
                activity(state) {
                    if (state.items.data == undefined) {
                        return '';
                    }
                    return state.items.data.activity
                },
                status(state) {
                    return state.items && state.items.ret == 0 && state.items.data.items.total > 0 ?
                        true : false
                },
                moreItems(state) {
                    if (state.items.data == undefined) {
                        return false;
                    }
                    let items = state.items.data.items
                    return items.current_page < items.last_page
                },
                current_page(state) {
                    if (state.items.data == undefined) {
                        return 1;
                    }
                    return state.items.data.items.current_page
                },
                exchanged_words_number(state){
                    return state.self.activity_info.exchanged_words_number
                }
            })
        },
        created() {
            let id = this.$route.params.id
            this.$store.dispatch('getItems', {
                id: id
            })
        },
        watch: {
            $route(to, from) {
                let id = to.params.id
                this.$store.dispatch('getItems', {
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
               vm.$store.dispatch('getItems', {
                    id: id,
                    more: more,
                    page: page
                }).then((response)=>{
                    if(response.data.items.current_page < response.data.items.last_page){
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
            receiveItem: function (id) {
                let url = apiUrls.RECEIVE_ITEM_URL + '/' + id
                let vm = this
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    axios.post(url).then(function (response) {
                            let id = vm.$route.params.id
                            vm.$store.dispatch('getItems', {
                                id: id
                            })
                            $('#prizeModal').modal('show')
                            vm.hasPosted = false
                            vm.$store.dispatch('getSelfInfo', 'refresh')

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