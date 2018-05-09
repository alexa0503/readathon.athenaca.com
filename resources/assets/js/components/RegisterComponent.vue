<template>
    <div class="container-fluid" v-if="!loading">
        <form class="row" v-if="!succeeded && !hasRegistered" method="POST" @submit.prevent="register">
            <div class="form-content">
                <div class="form-group row" v-bind:class="hasError && errMsg.name ? 'has-error' : ''">
                    <input v-model="user.name" type="text" class="form-control form-control-lg" placeholder="姓名">
                    <label class="help-block" for="" v-if="hasError && errMsg.name">{{ errMsg.name[0] }}</label>
                </div>
                <div class="form-group row" v-bind:class="hasError && errMsg.birthdate ? 'has-error' : ''">
                    <Datetime :value="user.birthdate" placeholder="生日" default-selected-value="2018-01-01" :end-date="endDate" start-date="1980-01-01"
                        class="form-control form-control-lg"></Datetime>
                    <label class="help-block" for="" v-if="hasError && errMsg.birthdate">{{ errMsg.birthdate[0] }}</label>
                </div>
                <div class="form-group row" v-bind:class="hasError && errMsg.tel ? 'has-error' : ''">
                    <input v-model="user.tel" type="tel" class="form-control form-control-lg" placeholder="联系电话">
                    <label class="help-block" for="" v-if="hasError && errMsg.tel">{{ errMsg.tel[0] }}</label>
                </div>
                <div class="form-group row" v-bind:class="hasError && errMsg.is_reading ? 'has-error' : ''">
                    <select v-model="user.is_reading" class="form-control form-control-lg">
                        <option value="" disabled="disabled">是否Athena Academy知慧学院现任成员</option>
                        <option value="y">是</option>
                        <option value="n">否</option>
                    </select>
                    <label class="help-block" for="" v-if="hasError && errMsg.is_reading">{{ errMsg.is_reading[0] }}</label>
                </div>
                <div class="form-group row" v-bind:class="hasError && errMsg.city ? 'has-error' : ''">
                    <select v-model="user.city" class="form-control form-control-lg no-border">
                        <option value="" disabled="disabled">所在城市</option>
                        <option v-for="city in cities" v-bind:key="city.id" v-bind:value="city.id">{{ city.name }}</option>
                    </select>
                    <label class="help-block" for="" v-if="hasError && errMsg.city">{{ errMsg.city[0] }}</label>
                </div>
            </div>
            <div class="text-center container-fluid">
                <button type="submit" class="btn btn-lg btn-warning">提交</button>
            </div>
            <div class="text-center privacy container-fluid">
                <a href="javascript:;" v-on:click="showPrivacy">隐私协议</a>
            </div>
        </form>
        <div class="regester-succeeded" v-else>
            <h3>注册成功！</h3>
            <p>请联系距离您最近的知慧学院Athena Academy，预约英文阅读水平测试，获取阅读水平匹配的英文书单，激活参赛资格！</p>
            <div class="regester-succeeded-link">
                <a>预约美国权威STAR英语水平测试</a>
            </div>
            <div class="regester-succeeded-link">
                <router-link :to="{name:'flow'}">阅读马拉松流程图</router-link>
            </div>
            <div class="regester-succeeded-link">
                <a>关于阅读马拉松</a>
            </div>
            <div class="regester-succeeded-link">
                <a>关于Athena Academy知慧学院 </a>
            </div>
        </div>
        <div class="board-space"></div>
    </div>
</template>

<script>
    import {
        mapGetters,
        mapActions
    } from 'vuex'
    import * as apiUrls from './../utils/api-urls'
    import {
        Datetime,
        dateFormat
    } from 'vux'
    //import * as datepicker from 'vue-datetime-picker'
    export default {
        components: {
            Datetime
        },
        filters: {
            dateFormat
        },
        data() {
            return {
                privacySeen: false,
                hasError: false,
                succeeded: false,
                errMsg: '',
                hasPosted: false,
                user: {
                    city: '',
                    is_reading: '',
                    birthdate: '',
                    tel: '',
                    name: ''
                }
            }
        },
        computed: {
            ...mapGetters({
                cities: 'cities',
                loading: 'loading',
                userInfo: 'self',
                hasRegistered: 'hasRegistered'
            }),
            endDate: function(){
                //return '2018-01-01'
                let d = dateFormat(new Date(), 'YYYY-MM-DD')
                console.log(d)
                return d
            }
        },
        created() {
            this.$store.dispatch('initRegisterPage')
        },
        methods: {
            showPrivacy: function () {
                console.log(this.user.birthdate)
                this.privacySeen = true
            },
            register: function () {
                let vm = this
                let user = this.user
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    axios({
                            method: 'post',
                            url: apiUrls.REGISTER_URL,
                            data: user
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
            }
        }
    };
</script>