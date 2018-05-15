<template>
    <div class="modal fade" id="addReadingLogModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" v-if="!succeeded">
                <form @submit.prevent="addReadingLog">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" v-bind:class="hasError && errMsg.book_name ? 'has-error' : ''">
                            <input type="text" class="form-control" v-model="bookName" placeholder="书名">
                            <label class="help-block" for="" v-if="hasError && errMsg.book_name">{{ errMsg.book_name[0] }}</label>
                        </div>
                        <div class="form-group" v-bind:class="hasError && errMsg.words_number ? 'has-error' : ''">
                            <input type="text" class="form-control" v-model="wordsNumber" placeholder="字数">
                            <label class="help-block" for="" v-if="hasError && errMsg.words_number">{{ errMsg.words_number[0] }}</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="http://www.arbookfind.com/default.aspx" class="btn btn-info">查询书本字数</a>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info">提交</button>
                    </div>
                </form>
            </div>
            <div class="modal-content" v-if="succeeded">
                <div class="modal-body text-center">
                    <h3>提交成功</h3>
                     <button type="button" class="btn btn-go btn-info" data-dismiss="modal" aria-label="Close">
                        确定
                    </button>
                </div>
                <div class="modal-footer text-center">
                    <button type="button" v-on:click="resetAdd" class="btn btn-info btn-go">继续添加</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import * as apiUrls from './../utils/api-urls'
    export default {
        data() {
            return {
                bookName: '',
                wordsNumber: '',
                hasError: false,
                succeeded: false,
                errMsg: '',
                hasPosted: false
            }
        },
        methods: {
            addReadingLog: function () {
                let vm = this
                let data = {
                    book_name: vm.bookName,
                    words_number: vm.wordsNumber
                }
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    axios({
                            method: 'post',
                            url: apiUrls.ADD_READING_LOG,
                            data: data
                        })
                        .then(function (response) {
                            vm.succeeded = true
                        })
                        .catch(function (error) {
                            vm.hasError = true
                            vm.hasPosted = false
                            if (error.response.status == 403) {
                                let data = error.response.data
                                vm.errMsg = data
                            } else {
                                vm.errMsg = '服务器发生错误'
                            }
                        })
                }
            },
            resetAdd: function () {
                this.succeeded = false
                this.hasPosted = false
                this.errMsg = ''
                this.bookName = ''
                this.wordsNumber = ''
            }
        }
    }
</script>