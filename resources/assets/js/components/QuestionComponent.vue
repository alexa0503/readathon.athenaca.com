<template>
    <div class="container-fluid question" v-if="!loading">
        <div class="question-content">
            <form @submit.prevent="answerQuestion" v-if="status != 1001 && question">
                <p>{{ question.title }}
<br/>({{ question.rewarded_number }}字数奖励)</p>
                <div class="question-answer">
                    <label v-for="item in answers" v-bind:key="item.id">
                         <span class="answered-label" v-if="answered != null && answered == item.id && isRight == 1">✓</span>
                         <span class="answered-label" v-else-if="answered != null && answered == item.id && isRight == 0">✗</span>
                         <span class="answered-label" v-if="answered != null && answered != item.id && isRight == 0 && item.is_right == 1">✓</span>
                         
                        <input type="radio" id=""  v-bind:value="item.id" v-model="answer" v-bind:disabled="status != 0" v-if="answered == null">
                        <input  type="radio" id=""  v-bind:value="item.id" v-model="answered" v-bind:disabled="status != 0" v-else>
                        {{item.title}}
                    </label>
                </div>
                <div class="text-center" v-if="status == 0"><button type="submit" class="btn btn-warning">提交</button></div>
                <div class="alert alert-warning mt-4" v-else>{{errMsg}}</div>
            </form>
            <div v-if="status == 1001" class="text-center">
                {{ errMsg }}
            </div>
        </div>
        <div class="board-space"></div>
        
        
        <div class="modal fade" id="questionModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true"  v-if="status != 1001 && question">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h3>Yeah！答对了！</h3>
                        <p>收获{{ question.rewarded_number }}字数！</p>
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
    import * as apiUrls from './../utils/api-urls'
    export default {
        data(){
            return {
                answer: '',
                hasPosted: false,
            }
        },
        computed: mapState({
            loading: 'loading',
            status(state){
                return state.question.ret
            },
            answered(state){
                return state.question.data.answered
            },
            isRight(state){
                return state.question.data.is_right
            },
            question(state){
                if( state.question.ret != 1001 ){
                    return state.question.data.question
                }
                else{
                    return {}
                }
            },
            answers(state){
                if( state.question.ret != 1001 ){
                    return state.question.data.answers
                }
                else{
                    return {}
                }
            },
            errMsg(state){
                if( state.question.ret != 0 ){
                    return state.question.errMsg
                }
                else{
                    return ''
                }
            }
        }),
        created() {
            this.$store.dispatch('initQuestionPage')
        },
        methods:{
            previous: function(){
                this.$router.go(-1)
            },
            answerQuestion: function(){
                let vm = this;
                if( vm.answer == '' ){
                    alert('请选择答案')
                }
                else{
                    let data = {answer:vm.answer}
                    let url = apiUrls.ANSWER_URL + '/'+vm.question.id
                    if(!vm.hasPosted){
                        vm.hasPosted = true
                        axios({
                            method: 'post',
                            url: url,
                            data: data
                        })
                        .then(function (response) {
                            let data = response.data
                            if(data && data.ret == 0){
                                $('#questionModal').modal('show')
                            }
                            else{
                                $('#questionModal .modal-body h3').html('Oops，答错了！')
                                $('#questionModal .modal-body p').html('继续努力吧！')
                                $('#questionModal').modal('show')
                            }
                            vm.hasPosted = false
                            vm.$store.dispatch('initQuestionPage')
                        })
                        .catch(function (error) {
                            vm.hasPosted = false
                            if (error.response.status == 403) {
                                $('#questionModal .modal-body h3').html('Oops，答错了！')
                                $('#questionModal .modal-body p').html('继续努力吧！')
                                $('#questionModal').modal('show')
                                vm.$store.dispatch('initQuestionPage')
                            } else {
                                alert('服务器发生错误')
                            }
                        })
                    }
                }
            }
        }
    }
</script>
