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
                <div class="name-text">{{ user.name }}</div>
                <div class="number">
                    <span>{{ user.activity_info.rank }}</span>
                </div>
                <div class="avatar">
                    <img :src="user.avatar" class="rounded-circle" />
                </div>
            </div>
            <div class="board-list board-list-home" v-else-if="user.is_activated == 1 && user.has_joined == 0">
                <div class="board-no-activated">
                    <router-link :to="{ name: 'account' }">我也参加阅读马拉松</router-link>
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
                    <a href="javascript:;" v-if="item.has_voted == 1">
                        <img src="/images/icon-voted.png" />
                    </a>
                    <a href="javascript:;" v-on:click="vote(item.user.id, index)" v-else>
                        <img src="/images/icon-vote.png" />
                    </a>
                </div>
                <div class="star">{{ item.words_number }}</div>
                <div class="name-text">{{ item.user.name }}</div>
                <div class="number">
                    <span>{{ item.rank }}</span>
                </div>
                <div class="avatar">
                    <img :src="item.user.avatar" class="rounded-circle" />
                </div>
            </div>
        </div>
        <div class="board-more" v-if="showMore"  v-on:click="fetchMore(true)">
            <img src="/images/icon-more-01.png" />
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
        computed: mapState({
            loading: 'loading',
            user: 'self',
            boardList: 'boardList',
            showMore(state) {
                return state.boardList.meta && (state.boardList.meta.current_page != state.boardList.meta.last_page)
            }
        }),
        created() {
            this.$store.dispatch('initIndexPage')
        },
        methods: {
            fetchMore: function (more = false) {
                let page = 1;
                if (more == true) {
                    page = this.boardList.meta.current_page + 1
                }
                let type = 'withoutme'
                this.$store.dispatch('getBoardList', {
                    page: page,
                    more: more,
                    type: type
                })
                /*
                if(this.user.is_activated == 1){
                    let city = this.user.city_id
                    let ageGroup = this.user.age_group_id
                    this.$store.dispatch('getBoardList', {page:page,city:city,ageGroup:ageGroup,more:more,type:type})
                }
                else{
                    this.$store.dispatch('getBoardList', {page:page,more:more,type:type})
                }
                */
                //let more = true;

            },
            vote: function (user_id, index) {
                this.$store.dispatch('vote', {
                    user_id,
                    index
                })
            }
        }
    }
</script>