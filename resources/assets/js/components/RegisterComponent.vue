<template>
    <div class="container-fluid" v-if="!loading">
        <form class="register-form row" v-if="!succeeded && !hasRegistered" method="POST" @submit.prevent="register">
            <div class="form-content">
                <div class="form-group" v-bind:class="hasError && errMsg.name ? 'has-error' : ''">
                    <input v-model="user.name" type="text" class="form-control form-control-lg" placeholder="姓名">
                    <label class="help-block" for="" v-if="hasError && errMsg.name">{{ errMsg.name[0] }}</label>
                </div>
                <div class="form-group" v-bind:class="hasError && errMsg.birthdate ? 'has-error' : ''">
                    <input v-model="user.birthdate" type="text" class="form-control form-control-lg" placeholder="出生年月" v-on:click="openPicker"
                        v-on:focus="disableKey">
                    <mt-datetime-picker ref="picker" type="date" year-format="{value} 年" month-format="{value} 月" date-format="{value} 日" :startDate="startDate"
                        :endDate="endDate" @confirm="handleConfirm" itemHeight="80" v-model="pickerDate">
                    </mt-datetime-picker>
                    <label class="help-block" for="" v-if="hasError && errMsg.birthdate">{{ errMsg.birthdate[0] }}</label>
                </div>
                <div class="form-group" v-bind:class="hasError && errMsg.tel ? 'has-error' : ''">
                    <input v-model="user.tel" type="tel" class="form-control form-control-lg" placeholder="联系电话">
                    <label class="help-block" for="" v-if="hasError && errMsg.tel">{{ errMsg.tel[0] }}</label>
                </div>
                <div class="form-group" v-bind:class="hasError && errMsg.is_reading ? 'has-error' : ''">
                    <div class="form-control form-control-lg">知慧学院 Athena Academy现任学员
                        <mt-switch v-model="user.is_reading"></mt-switch>
                    </div>
                    <label class="help-block" for="" v-if="hasError && errMsg.is_reading">{{ errMsg.is_reading[0] }}</label>
                </div>
                <div class="form-group" v-bind:class="hasError && errMsg.city ? 'has-error' : ''">
                    <select v-model="user.city" class="form-control form-control-lg">
                        <option value="" disabled="disabled">所在城市</option>
                        <option v-for="city in cities" v-bind:key="city.id" v-bind:value="city.id">{{ city.name }}</option>
                    </select>
                    <label class="help-block" for="" v-if="hasError && errMsg.city">{{ errMsg.city[0] }}</label>
                </div>
                <div class="form-group" v-bind:class="hasError && errMsg.privacy ? 'has-error' : ''">
                    <div class="form-control form-control-lg  no-border">
                        <label>
                            <input type="checkbox" class="register-checkbox" v-model="user.privacy" /> 我已经阅读并同意
                            <a href="javascript:;" v-on:click="showPrivacy">阅读马拉松隐私政策</a>
                        </label>
                    </div>
                    <label class="help-block" for="" v-if="hasError && errMsg.privacy">{{ errMsg.privacy[0] }}</label>
                </div>
            </div>
            <div class="text-center container-fluid">
                <button type="submit" class="btn btn-lg btn-warning">提交</button>
            </div>
            <div class="board-space container-fluid"></div>
        </form>
        <div class="regester-succeeded" v-else>
            <h3>注册成功！</h3>
            <p>请联系距离您最近的知慧学院Athena Academy，预约英文阅读水平测试，获取阅读水平匹配的英文书单，激活参赛资格！</p>
            <div class="regester-succeeded-link">
                <router-link :to="{name:'about'}">关于阅读马拉松</router-link>
            </div>
            <div class="regester-succeeded-link">
                <router-link :to="{name:'about', params:{page:'test'}}">关于美国权威STAR英文水平测试</router-link>
            </div>
            <div class="regester-succeeded-link">
                <router-link :to="{name:'about', params:{page:'athena'}}">关于知慧学院 Athena Academy</router-link>
            </div>
        </div>
        <div class="board-space container-fluid"></div>
        <div class="privacy-container" v-if="privacySeen">
            <div class="privacy-body">
                <div class="privacy-content">
                    <div v-html="privacyContent" class="privacy-cc"></div>
                    <div class="close" v-on:click="closePrivacy">&times;</div>
                </div>
            </div>
        </div>
        <div v-if="privacySeen" class="privacy-bg" v-on:click="closePrivacy"></div>
    </div>
</template>

<script>
    
    import {
        mapGetters,
        mapActions,
        mapState
    } from 'vuex'
    import * as apiUrls from './../utils/api-urls'
    import {
        DatetimePicker,
        Switch
    } from 'mint-ui';

    export default {
        components: {
            'mt-datetime-picker': DatetimePicker,
            'mt-switch': Switch
        },
        data() {
            return {
                privacySeen: false,
                hasError: false,
                succeeded: false,
                errMsg: '',
                hasPosted: false,
                pickerVisible: false,
                pickerDate: new Date('2018-01-01'),
                user: {
                    city: '',
                    is_reading: false,
                    birthdate: '',
                    tel: '',
                    name: '',
                    privacy: true
                },
            }
        },
        computed: {
            ...mapState({
                cities: 'cities',
                loading: 'loading',
                userInfo: 'self',
                hasRegistered(state) {
                    return state.self.name != null
                },
                privacyContent(state) {
                    if (state.posts.data && state.posts.data[0]) {
                        return state.posts.data[0].body
                    } else {
                        return '';
                    }
                }
            }),
            startDate: function () {
                return new Date('2000-01-01')
            },
            endDate: function () {
                return new Date()
            }
        },
        watch: {
            hasRegistered(v){
                if( v ){
                    document.body.style.background = '#7fe2bf';
                }
                else{
                    document.body.style.background = '#fff';
                }
            }
        },
        created() {
            if( this.hasRegistered ){
                document.body.style.background = '#7fe2bf';
            }
            else{
                document.body.style.background = '#fff';
            }
            this.$store.dispatch('initRegisterPage')
        },
        methods: {
            disableKey() {
                document.activeElement.blur();
            },
            openPicker() {
                document.activeElement.blur();
                this.user.birthdate = '2018-01-01'
                this.$refs.picker.open();
            },
            handleConfirm(date) {
                let d = moment(date).format('YYYY-MM-DD')
                this.user.birthdate = d
            },
            showPrivacy: function () {
                this.privacySeen = true
            },
            closePrivacy: function () {
                this.privacySeen = false
            },
            register: function () {
                let vm = this
                let user = vm.user
                if (!user.privacy) {
                    //alert('请勾选隐私政策')
                }
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    //user.is_reading = user.is_reading ? 1 : 0;
                    //user.privacy = user.privacy ? 1 : 0;
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