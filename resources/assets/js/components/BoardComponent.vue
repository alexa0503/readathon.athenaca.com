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
                            <option value="">年龄组/所有</option>
                            <option v-for="ageGroup in ageGroups" v-bind:key="ageGroup.id" v-bind:value="ageGroup.id">{{ ageGroup.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" v-model="cityId" v-on:change="fetchMore(false)">
                            <option value="">城市/所有</option>
                            <option v-for="city in cities" v-bind:key="city.id" v-bind:value="city.id">{{ city.name }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" v-model="activityId" v-on:change="fetchMore(false)">
                            <option value="" disabled="disabled">选择赛季/当前</option>
                            <option v-for="activity in activities" v-bind:key="activity.id" v-bind:value="activity.id">{{ activity.name }}</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="board-content">
            <div v-for="(item,index) in boardList.data" v-bind:key="item.id" class="board-list " v-bind:class="item.rank < 4 ? 'board-list-'+item.rank : 'board-list-others'">
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
        <div class="row board-more" v-if="showMore"  v-on:click="fetchMore(true)">
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
        data() {
            return {
                ageGroupId: '',
                cityId: '',
                activityId: ''
            }
        },
        computed: mapState({
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
        }),
        created() {
            this.$store.dispatch('initBoardPage')
        },
        methods: {
            fetchMore: function (more = false) {
                let page = 1;
                if (more == true) {
                    page = this.boardList.meta.current_page + 1
                }
                let ageGroupId = this.ageGroupId
                let cityId = this.cityId
                let activityId = this.activityId
                //let more = true;
                this.$store.dispatch('getBoardList', {
                    page: page,
                    ageGroup: ageGroupId,
                    city: cityId,
                    activity: activityId,
                    more: more
                })
            },
            vote: function (user_id, index) {
                if (this.isCurrentActivity == 1) {
                    this.$store.dispatch('vote', {
                        user_id,
                        index
                    })
                }
            }
        }
    }
</script>