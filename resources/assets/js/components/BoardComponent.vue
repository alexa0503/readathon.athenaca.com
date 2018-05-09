<template>
    <div class="container-fluid" v-if="!loading">
        <div class="row position-relative border-topper">
            <div class="board-topper-img"><img src="/images/bkg-topper-board.png" /></div>
            <div class="board-select">
                <div class="row">
                    <div class="col-4">
                        <div class="form-group">
                            <select class="form-control" v-model="ageGroupId" v-on:change="fetchMore(false)">
                                <option value="">年龄组/所有</option>
                                <option v-for="ageGroup in ageGroups" v-bind:key="ageGroup.id" v-bind:value="ageGroup.id">{{ ageGroup.title }}</option>
                            </select>
                        </div>
                </div>
                <div class="col-4">
                    <div class="form-group">
                        <select class="form-control" v-model="cityId" v-on:change="fetchMore(false)">
                            <option value="">城市/所有</option>
                            <option v-for="city in cities" v-bind:key="city.id" v-bind:value="city.id">{{ city.name }}</option>
                        </select>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-group">
                        <select class="form-control" v-model="activityId" v-on:change="fetchMore(false)">
                            <option value="" disabled="disabled">赛季</option>
                            <option v-for="activity in activities" v-bind:key="activity.id" v-bind:value="activity.id">{{ activity.name }}</option>
                        </select>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class="row board-content">
            <div  v-for="(item,index) in boardList.data" v-bind:key="item.id" class="board-list " v-bind:class="item.user.rank < 4 ? 'board-list-'+item.user.rank : 'board-list-others'">
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
        data(){
            return {
                ageGroupId:'',
                cityId:'',
                activityId:''
            }
        },
        computed: mapState({
            loading: 'loading',
            cities: 'cities',
            activities: 'activities',
            boardList: 'boardList',
            ageGroups: 'ageGroups',
            showMore(state){
                return state.boardList.meta && (state.boardList.meta.current_page != state.boardList.meta.last_page)
            }
        }),
        created() {
            this.$store.dispatch('initBoardPage')
        },
        methods:{
            fetchMore: function(more = false){
                let page = 1;
                if( more == true){
                    page = this.boardList.meta.current_page + 1
                }
                let ageGroupId = this.ageGroupId
                let cityId = this.cityId
                let activityId = this.activityId
                //let more = true;
                this.$store.dispatch('getBoardList', {page:page,ageGroup:ageGroupId,city:cityId,activity:activityId,more:more})
            },
            vote: function(id,index){
                this.$store.dispatch('vote',{id,index})
            }
        }
    }
</script>