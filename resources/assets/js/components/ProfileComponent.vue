<template>
    <div class="container-fluid profile" v-if="!loading">
        <div class="profile-topper">
            <div class="return">
                <img src="/images/icon-quit.png" v-on:click="quit" />
            </div>
            <div class="avatar">
                <img :src="userInfo.avatar" class="rounded-circle" />
            </div>
            <div class="edit-text" @click="chooseImg">点击修改头像</div>
        </div>
        <form class="row" method="POST" @submit.prevent="update" >
            <div class="form-content">
                <div class="form-group row" v-bind:class="hasError && errMsg.nickname ? 'has-error' : ''">
                    <label class="col-form-label">昵称</label>
                    <div>
                        <input v-model="nickname" type="text" class="form-control" placeholder="请输入昵称">
                        <label class="help-block" for="" v-if="hasError && errMsg.nickname">{{ errMsg.nickname[0] }}</label>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label">真实姓名</label>
                    <div>
                        <input readonly v-model="userInfo.name" type="text" class="form-control-plaintext">
                    </div>
                </div>
                <div class="form-group row" v-bind:class="hasError && errMsg.tel ? 'has-error' : ''">
                    <label class="col-form-label">联系电话</label>
                    <div>
                        <input v-model="userInfo.tel" type="text" class="form-control" placeholder="请输入电话">
                        <label class="help-block" for="" v-if="hasError && errMsg.tel">{{ errMsg.tel[0] }}</label>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label">出生日期</label>
                    <div>
                        <input readonly v-model="userInfo.birthdate" type="text" class="form-control-plaintext">
                    </div>
                </div>
                <div class="form-group row no-border">
                    <label class="col-form-label" style="width:26rem">Athena Academy知慧学院在读学员</label>
                    <div>
                        <input class="form-check-input" type="radio" checked disabled>
                        <label class="form-check-label">
                            {{ is_reading }}
                        </label>
                    </div>
                </div>
                <div class="form-group row no-border">
                    <label class="col-form-label">城市</label>
                    <div>
                        <input readonly v-model="userInfo.city_name" type="text" class="form-control-plaintext">
                    </div>
                </div>
            </div>
            <div class="text-center fixed-bottom" id="profileBtn">
                <button type="submit" class="btn btn-lg btn-info">提交</button>
            </div>
        </form>
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
        data() {
            return {
                hasError: false,
                succeeded: false,
                errMsg: '',
                hasPosted: false
            }
        },
        computed: {
            ...mapState({
                loading: 'loadinuserInfo',
                userInfo: 'self',
                cities: 'cities',
                is_reading(state) {
                    return state.self.is_reading == 1 ? '是' : '否'
                }
            }),
            nickname: {
                get() {
                    return this.$store.state.self.nickname
                },
                set(value) {
                    this.$store.commit('updateNickname', value)
                }
            },
            tel: {
                get() {
                    return this.$store.state.self.tel
                },
                set(value) {
                    this.$store.commit('updateTel', value)
                }
            }
        },
        created() {
            this.$store.dispatch('initProfilePage')
        },
        methods: {
            quit: function () {
                this.$router.push({
                    name: 'account'
                })
            },
            update: function () {
                let vm = this
                let data = {
                    nickname: vm.nickname,
                    tel: vm.tel,
                    id: vm.userInfo.id
                }
                if (!vm.hasPosted) {
                    vm.hasPosted = true
                    axios({
                            method: 'post',
                            url: apiUrls.UPDATE_PROFILE_URL,
                            data: data
                        })
                        .then(function (response) {
                            $('#succeededModal').modal('show')
                            vm.succeeded = true
                            vm.hasPosted = false
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
            chooseImg: function () {
                wx.ready(function () {
                    wx.chooseImage({
                        count: 1, // 默认9
                        sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有
                        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
                        success: function (res) {
                            var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                            wx.uploadImage({
                                localId: localIds[0], // 需要上传的图片的本地ID，由chooseImage接口获得
                                isShowProgressTips: 1, // 默认为1，显示进度提示
                                success: function (res) {
                                    var serverId = res.serverId; // 返回图片的服务器端ID
                                }
                            });
                        }
                    });
                })
            }
        }
    }
</script>