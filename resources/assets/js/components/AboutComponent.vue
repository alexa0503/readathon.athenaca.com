<template>
    <div class="container-fluid about" v-if="!loading">
        <div class="about-content" v-html="about">
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
    import * as apiUrls from './../utils/api-urls'
    export default {
        data() {
            return {}
        },
        computed: mapState({
            loading: 'loading',
            about(state) {
                if (state.posts.data && state.posts.data[0]) {
                    return state.posts.data[0].body
                } else {
                    return '';
                }
            }
        }),
        created() {
            this.$store.dispatch('getPosts', {
                name: 'about',
                type: 'article',
                page: 1,
                more: false
            })
        },
        methods: {}
    }
</script>