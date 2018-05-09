<template>
    <div class="container-fluid question" v-if="!loading">
        <div class="question-content">
                <p>已经在阅读马拉松记录了{{user.words_number}}个字数。书中自有万里路，我们一起来！</p>
                <p>邀请到好友注册并激活可以给您累积阅读字数。</p>
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
                
            }
        },
        computed: mapState({
            loading: 'loading',
            user: 'self'
        }),
        created() {
            this.$store.dispatch('initInvitePage')
        },
        methods:{
            previous: function(){
                this.$router.go(-1)
            },
        }
    }
</script>
