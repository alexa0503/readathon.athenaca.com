<template>
    <div class="container-fluid account" v-if="!loading">
        <div class="account-topper">
            <div class="account-avatar" v-on:click="edit">
                <div class="account-img"><img :src="user.avatar" class="rounded-circle" /><div class="account-edit" v-if="isSelf"><img src="/images/icon-pen.png" /></div></div>
                <div class="account-nickname">{{ user.nickname }}</div>
                <div class="account-city">{{ user.city_name }}</div>
                <div class="account-name" v-if="isSelf">{{ user.name }}</div>
                
            </div>
            <div class="account-info">
                <div class="account-rank" v-if="isSelf">我的排名<span>{{ user.activity_info.rank }}</span></div>
                <div class="account-rank" v-else>TA的排名<span>{{ user.activity_info.rank }}</span></div>
                <div class="account-text">阅读水平值<span>GE {{ user.ge }}</span></div>
                <div class="account-text">阅读书籍数<span>{{ user.activity_info.reading_number }}</span></div>
                <div class="account-text">累计阅读字数<span>{{ user.activity_info.words_number }}</span></div>
                <div class="account-add" v-if="isSelf"><a href="javascript:;" v-on:click="addReadingLog">添加阅读记录</a></div>
                <div class="account-vote" v-else><a href="javascript:;" v-on:click="vote(user.id)">赞 <img src="/images/icon-account-vote.png" v-if="user.activity_info.has_voted != 1" /><img src="/images/icon-account-voted.png" v-else /><span>{{ user.activity_info.voted_number }}</span></a></div>
            </div>
        </div>
        <div class="account-tabs">
                <ul class="nav nav-tabs nav-pills nav-fill">
                    <li class="nav-item"><a href="javascript:;" v-on:click="showLogs('reading')" class="nav-link" v-bind:class="type == 'reading' ? 'active' : ''"><div class="center"><img src="/images/icon-tab-reading.png"/><br/>阅读记录</div></a></li>
                    <li class="nav-item"><a href="javascript:;"  v-on:click="showLogs('activity')" class="nav-link" v-bind:class="type == 'activity' ? 'active' : ''"><div class="center"><img src="/images/icon-tab-activity.png"/><br/>活动记录</div></a></li>
                    <li class="nav-item" v-if="isSelf"><a href="javascript:;"  v-on:click="showLogs('prize')" class="nav-link" v-bind:class="type == 'prize' ? 'active' : ''"><div class="center"><img src="/images/icon-tab-prize.png"/><br/>奖品记录</div></a></li>
                </ul>
                <div class="tab-content">
                    <table class="table borderless">
                        <thead>
                            <tr v-if="type === 'reading'">
                                <th>日期</th><th>书名</th><th>字数</th>
                            </tr>
                            <tr v-if="type === 'activity'">
                                <th>日期</th><th>活动</th><th>字数</th>
                            </tr>
                            <tr v-if="type === 'prize' && isSelf">
                                <th>日期</th><th>奖品</th><th>状态</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-if="type === 'reading'" v-for="log in logs.data" v-bind:key="log.id">
                                <td>{{ log.created_at }}</td><td>{{ log.book_name }}</td><td>{{ log.words_number }}</td>
                            </tr>
                            <tr v-if="type === 'activity'" v-for="log in logs.data" v-bind:key="log.id">
                                <td>{{ log.created_at }}</td><td>{{ log.reason }}</td><td>{{ log.words_number }}</td>
                            </tr>
                            <tr v-if="type === 'prize' && isSelf" v-for="log in logs.data" v-bind:key="log.id">
                                <td>{{ log.activity_name }}</td><td>{{ log.prize_name }}</td><td>{{ log.has_checked == 0 ? '未核销' : '已核销'}}</td>
                            </tr>
                            <tr v-if="logs.data == undefined || logs.data.length == 0 ">
                                <td colspan="3">没有任何记录</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation" class="page">
                    <ul class="pagination justify-content-center" v-if="logs.meta && logs.meta.last_page != 1">
                         <li class="page-item"><a class="page-link" href="javascript:;" v-on:click="showLogs(type, 1)" v-if=" logs.meta.current_page !=1">|&lt;</a></li>
                        <li class="page-item">
                        <a class="page-link"  v-if="logs.meta.current_page > 1"  href="javascript:;"  v-on:click="showLogs(type, logs.meta.current_page-1)" aria-label="Previous">
                            <span aria-hidden="true">&lt;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                        </li>
                        <li class="page-item" v-bind:class="logs.meta.current_page == n ? 'active' : ''" v-for="n in logs.meta.last_page" v-bind:key="n"><a class="page-link" href="javascript:;" v-on:click="showLogs(type, n)" v-if="(n < logs.meta.current_page + 2 && n > logs.meta.current_page - 2)">{{ n }}</a></li>
                        <li class="page-item">
                        <a class="page-link" v-if="logs.meta.last_page > logs.meta.current_page" href="javascript:;" v-on:click="showLogs(type, logs.meta.current_page+1)" aria-label="Next">
                            <span aria-hidden="true">&gt;</span>
                            <span class="sr-only">Next</span>
                        </a>
                        </li>
                         <li class="page-item"><a class="page-link" href="javascript:;" v-on:click="showLogs(type, logs.meta.last_page)" v-if=" logs.meta.current_page != logs.meta.last_page">&gt;|</a></li>
                    </ul>
                </nav>
                <div class="board-space"></div>
        </div>
        
        <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h3>抱歉，您的账户还没有被激活。</h3>
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
    import {
        mapGetters,
        mapState,
        mapActions
    } from 'vuex'
    export default {
        data(){
            return {
                type: 'reading',
                isSelf: false,
                hasError: false
            }
        },
        computed: mapState({
            loading: 'loading',
            user: 'user',
            readingLogs: 'readingLogs',
            activityLogs: 'activityLogs',
            prizeLogs: 'prizeLogs',
            logs(state){
                if(this.type == 'activity'){
                    return state.activityLogs
                }
                else if(this.type == 'prize'){
                    return state.prizeLogs
                }
                else{
                    return state.readingLogs
                }
            }
        }),
        created() {
            if( this.$route.params.id == undefined ){
                this.isSelf = true
            }
            this.$store.dispatch('initAccountPage',this.$route.params.id)
        },
        methods:{
            previous: function(){
                this.$router.go(-1)
            },
            addReadingLog: function(){
                if( this.user.is_activated != 1 ){
                     $('#errorModal').modal('show')
                }
                else{
                    $('#addReadingLogModal').modal('show')
                }
                return false
            },
            showLogs: function(type, page = null){
                let id = this.$route.params.id
                this.type = type
                if( page != null){
                    if( type == 'activity' ){
                        this.$store.dispatch('getActivityLogs', {page:page,id:id});
                    }
                    else if( type == 'prize' ){
                        this.$store.dispatch('getPrizeLogs', {page:page,id:id});
                    }
                    else{
                        this.$store.dispatch('getReadingLogs', {page:page,id:id});
                    }
                }
            },
            edit: function(){
                if(this.isSelf){
                    this.$router.push({name:'profile'})
                }
            },
            vote: function(user_id){
                let hasVoted = this.user.has_voted
                let store = this.$store
                let vm = this
                if( hasVoted != 1){
                    let promise = store.dispatch('vote',{user_id,index:-1})
                    promise.then(null,function(error){
                        alert(error.errMsg)
                    })
                }
            }
        }
    }
</script>
