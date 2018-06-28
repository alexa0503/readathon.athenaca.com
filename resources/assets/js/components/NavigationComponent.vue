<template>
    <div class="fixed-bottom" id="navigation">
        <ul class="nav nav-pills nav-fill">
            <li class="nav-item" v-for="navigation in navigations" v-bind:key="navigation.name" v-bind:class="{ dropdown:navigation.hasSubMenu }">
                <a :href="navigation.path" class="nav-link no-dropdown" v-bind:class="{ active: navigation.name == routerName }" v-if="!navigation.hasSubMenu">
                    <i class="nav-icon" v-bind:class="navigation.icon"></i>{{ navigation.title }}
                </a>
                <a href="javascript:;" class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false" v-bind:class="{ active: navigation.name == routerName || navigation.isActive }" v-else>
                    <i class="nav-icon nav-icon-activity"></i>{{ navigation.title }}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" v-if="navigation.hasSubMenu">
                    <a :href="sub.path" class="dropdown-item" v-for="sub in navigation.items" :key="sub.name" v-bind:class="{active: sub.name == routerName}">{{ sub.title }}</a>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import {
        mapGetters,
        mapState,
        mapActions
    } from 'vuex'
    export default {
        data() {
            return {
                routerName: null,
                navigations: [{
                        path: '/page/home',
                        icon: 'nav-icon-index',
                        title: '首页',
                        name: 'home',
                        isActive: false,
                        hasSubMenu: false
                    },
                    {
                        path: '/page/board',
                        icon: 'nav-icon-board',
                        title: '排名榜',
                        name: 'board',
                        isActive: false,
                        hasSubMenu: false
                    },
                    {
                        path: '/page/invite',
                        icon: 'nav-icon-invite',
                        title: '邀请好友',
                        name: 'invite',
                        isActive: false,
                        hasSubMenu: false
                    },
                    {
                        path: '/page/activity',
                        icon: 'nav-icon-activity',
                        title: '比赛动态',
                        name: 'activity',
                        isActive: false,
                        hasSubMenu: true,
                        items: [
                            {
                                path: '/page/activity',
                                icon: 'nav-icon-activity',
                                name: 'activity',
                                title: '阅读动态',
                                isActive: false,
                            },
                            {
                                path: '/page/item',
                                icon: 'nav-icon-activity',
                                name: 'item',
                                title: '兑换奖品',
                                isActive: false,
                            },
                            {
                                path: '/page/question',
                                icon: 'nav-icon-activity',
                                name: 'question',
                                title: '有奖问答',
                                isActive: false,
                            },
                            {
                                path: '/page/about',
                                icon: 'nav-icon-activity',
                                title: '关于阅读马拉松',
                                name: 'about',
                                isActive: false,
                            }
                        ]
                    },
                    {
                        path: '/page/account',
                        icon: 'nav-icon-account',
                        title: '我的账户',
                        name: 'account',
                        isActive: false,
                        hasSubMenu: false
                    }
                ]
            }
        },
        created() {
            this.routerName = this.$router.history.current.name
            let name = this.routerName;
            if (name == 'question' || name == 'item' || name == 'about' || name == 'activity') {
                this.navigations[3].isActive = true
            }
        },
        computed: {
            ...mapState({
                loading: 'loading'
            })
        },
        methods: {
        },
        watch: {
            $route(to, from) {
                this.routerName = to.name
            }
        }
    }
</script>