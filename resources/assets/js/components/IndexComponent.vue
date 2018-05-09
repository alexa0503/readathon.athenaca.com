<template>
    <div class="container-fluid" v-if="!loading">
        <div class="row board-content">
            <div class="board-list board-list-home" v-if="user.is_activated == 1  && user.has_joined == 1">
                <div class="float-right">
                    <div class="star">{{ user.words_number }}</div>
                    <div class="vote"><span>{{ user.voted_number }}</span><a href="javascript:;" v-on:click="vote(user.id)"><img src="/images/icon-voted.png" v-if="user.has_voted == 1" /><img src="/images/icon-vote.png" v-else /></a></div>
                </div>
                <div class="number">{{ user.rank }}</div>
                <div class="avatar">
                    <img :src="user.avatar"
                        width="96" height="96" class="rounded-circle" />
                </div>
                <div class="name-text">{{ user.name }}</div>
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
            <div class="board-list board-list-home-others" v-for="(item,index) in boardList.data" v-bind:key="item.id">
                <div class="float-right">
                    <div class="star">{{ item.user.words_number }}</div>
                    <div class="vote"><span>{{ item.user.voted_number }}</span>
                    <a href="javascript:;" v-if="item.user.has_voted == 1"><img src="/images/icon-voted.png" /></a>
                    <a href="javascript:;" v-on:click="vote(item.user.id, index)" v-else><img src="/images/icon-vote.png" /></a>
                    </div>
                </div>
                <div class="number">{{ item.user.rank }}</div>
                <div class="avatar">
                    <img :src="item.user.avatar"
                        width="96" height="96" class="rounded-circle" />
                </div>
                <div class="name-text">{{ item.user.name }}</div>
            </div>
        </div>
        <div class="row board-more" v-if="showMore">
            <img src="/images/icon-more-01.png" v-on:click="fetchMore(true)" />
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
            showMore(state){
                return state.boardList.meta && (state.boardList.meta.current_page != state.boardList.meta.last_page)
            }
        }),
        created() {
            this.$store.dispatch('initIndexPage')
        },
        methods:{
            fetchMore: function(more = false){
                let page = 1;
                if( more == true){
                    page = this.boardList.meta.current_page + 1
                }
                let type = 'withoutme'
                this.$store.dispatch('getBoardList', {page:page,more:more,type:type})
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
            vote: function(id,index){
                this.$store.dispatch('vote',{id,index})
            }
        }
    }
</script>
