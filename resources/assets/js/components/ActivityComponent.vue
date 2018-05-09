<template>
    <div class="container-fluid prize-page" v-if="!loading">
        <div class="prize-content" v-if="!status">
            <h3>敬请期待</h3>
            <div>目前还没有活动</div>
        </div>
        <div class="prize-content" v-if="status" v-for="post in posts" v-bind:key="post.id">
            <h3>{{ post.title }}</h3>
            <div v-html="post.body"></div>
        </div>
        <div class="row board-more" v-if="status && more">
            <router-link :to="{ name: 'activity',query: { page: current_page + 1 } }">
                <img src="/images/icon-more-01.png">
            </router-link>
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
            return {
            }
        },
        computed: {
            ...mapState({
                loading: 'loading',
                activities: 'activities',
                posts(state) {
                    return state.posts.data
                },
                status(state) {
                    return state.posts && state.posts.meta && state.posts.meta.total > 0 ? true : false
                },
                more(state) {
                    if (state.posts.meta == undefined) {
                        return false;
                    }
                    return state.posts.meta.current_page != state.posts.meta.last_page
                },
                current_page(state) {
                    return state.posts.meta.current_page
                }
            })
        },
        created() {
            let page = this.$route.query.page == undefined ? 1 : this.$route.query.page
            if (page > 1) {
                this.$router.push({
                    name: 'activity'
                })
            }
            this.$store.dispatch('getPosts', {
                name: 'activity',
                type: 'article',
                page: 1,
                more: false
            })
        },
        watch: {
            $route(to, from) {
                let page = to.query.page
                if (page != undefined && page <= 2) {
                    this.$store.dispatch('getPosts', {
                        name: 'activity',
                        type: 'article',
                        page: page,
                        more: true
                    })
                }
            }
        }
    }
</script>