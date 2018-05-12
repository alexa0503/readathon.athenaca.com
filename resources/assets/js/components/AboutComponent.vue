<template>
    <div class="container-fluid question" v-if="!loading">
        <div class="question-content">
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
        }),
        created() {
            //this.$store.dispatch('initQuestionPage')
        },
        methods:{
        }
    }
</script>
