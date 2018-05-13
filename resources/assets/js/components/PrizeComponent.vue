<template>
    <div class="container-fluid prize-page" v-if="!loading">
        <div class="slick-content">
        <slick ref="slick" :options="slickOptions" @afterChange="handleAfterChange" @beforeChange="handleBeforeChange" @breakpoint="handleBreakpoint"
            @destroy="handleDestroy" @edge="handleEdge" @init="handleInit" @reInit="handleReInit" @setPosition="handleSetPosition"
            @swipe="handleSwipe" @lazyLoaded="handleLazyLoaded" @lazyLoadError="handleLazeLoadError" v-if="activities">
            <router-link :to="{ name: 'prize',params: { id: item.id } }" v-for="(item,index) in activities" v-if="activities"
                v-bind:key="index">
                <img :src="item.image" :alt="item.name" class="img-fluid">
            </router-link>
        </slick>
        </div>
        <div class="text-center activity-content" v-if="status">{{ activity.name }}</div>

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
                <button type="button" class="btn btn-warning btn-lg disabled" v-else-if="prize.received_status == 4">已过领不可领取奖期限</button>
                <!--已过领奖期限-->
                <button type="button" v-on:click="receivePrize(prize.id)" class="btn btn-warning btn-lg" v-else-if="prize.received_status == 0">领取奖品</button>
                <button type="button" class="btn btn-warning btn-lg disabled" v-else>不可领取</button>
                <!--未获得该奖品-->
            </div>
        </div>
        <div class="row board-more" v-if="status && morePrizes" v-on:click="fetchMore(true)">
            <img src="/images/icon-more-01.png">
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
                activities: 'activities',
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
                    return prizes.current_page != prizes.last_page
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
            this.$store.dispatch('initPrizePage', id)
        },
        watch: {
            activities(val) {
                console.log(val)
                this.reInit();
            },
            $route(to, from) {
                let id = to.params.id
                this.$store.dispatch('getPrizes', {
                    id: id
                })
            }
        },
        methods: {
            next() {
                this.$refs.slick.next();
            },
            prev() {
                this.$refs.slick.prev();
            },
            reInit() {
                // Helpful if you have to deal with v-for to update dynamic lists
                this.$refs.slick.destroy()
                this.$nextTick(() => {
                    this.$refs.slick.create();
                });
            },
            
            // Events listeners
            handleAfterChange(event, slick, currentSlide) {
                //console.log('handleAfterChange', event, slick, currentSlide);
            },
            handleBeforeChange(event, slick, currentSlide, nextSlide) {
                //console.log('handleBeforeChange', event, slick, currentSlide, nextSlide);
            },
            handleBreakpoint(event, slick, breakpoint) {
                //console.log('handleBreakpoint', event, slick, breakpoint);
            },
            handleDestroy(event, slick) {
                //console.log('handleDestroy', event, slick);
            },
            handleEdge(event, slick, direction) {
                //console.log('handleEdge', event, slick, direction);
            },
            handleInit(event, slick) {
                //console.log('handleInit', event, slick);
            },
            handleReInit(event, slick) {
                //console.log('handleReInit', event, slick);
            },
            handleSetPosition(event, slick) {
                //console.log('handleSetPosition', event, slick);
            },
            handleSwipe(event, slick, direction) {
                //console.log('handleSwipe', event, slick, direction);
            },
            handleLazyLoaded(event, slick, image, imageSource) {
                //console.log('handleLazyLoaded', event, slick, image, imageSource);
            },
            handleLazeLoadError(event, slick, image, imageSource) {
                //console.log('handleLazeLoadError', event, slick, image, imageSource);
            },
            fetchMore: function (more = false) {
                let page = this.current_page + 1
                let id = this.$route.params.id
                let has_requested = false
                let request = async function (vm) {
                    await
                    vm.$store.dispatch('getPrizes', {
                        id: id,
                        more: more,
                        page: page
                    })
                }
                if (!has_requested) {
                    has_requested = true
                    request(this)
                    has_requested = false
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
        }
    }
</script>