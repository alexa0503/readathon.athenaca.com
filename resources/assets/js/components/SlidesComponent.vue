<template>
    <div>
        <slick ref="slick" :options="slickOptions" @afterChange="handleAfterChange" @beforeChange="handleBeforeChange" @breakpoint="handleBreakpoint"
            @destroy="handleDestroy" @edge="handleEdge" @init="handleInit" @reInit="handleReInit" @setPosition="handleSetPosition"
            @swipe="handleSwipe" @lazyLoaded="handleLazyLoaded" @lazyLoadError="handleLazeLoadError">
            <a href="#" v-for="item in slides.data" v-if="slides && slides.data" v-bind:key="item.id">
                <img :src="item.image" :alt="item.name" class="img-fluid">
            </a>
        </slick>
    </div>
</template>

<script>
    import Slick from 'vue-slick'
    import {
        mapGetters,
        mapActions
    } from 'vuex'
    export default {
        components: {
            Slick
        },
        data() {
            return {
                slickOptions: {
                    slidesToShow: 1,
                    dots: true,
                    autoplay: true,
                    focusOnSelect: true,
                    autoplaySpeed: 5000
                },
            }
        },
        computed: mapGetters({
            loading: 'loading',
            slides: 'slides'
        }),
        watch: {
            slides(val) {
                this.reInit();
            }
        },
        created() {
        },
        methods: {
            next() {
                this.$refs.slick.next();
            },
            prev() {
                this.$refs.slick.prev();
            },
            reInit() {
                // Helpful if you have to deal with v-for to update dynamic lists
                this.$refs.slick.destroy()
                this.$nextTick(() => {
                    this.$refs.slick.create();
                });
            },
            // Events listeners
            handleAfterChange(event, slick, currentSlide) {
                //console.log('handleAfterChange', event, slick, currentSlide);
            },
            handleBeforeChange(event, slick, currentSlide, nextSlide) {
                //console.log('handleBeforeChange', event, slick, currentSlide, nextSlide);
            },
            handleBreakpoint(event, slick, breakpoint) {
                //console.log('handleBreakpoint', event, slick, breakpoint);
            },
            handleDestroy(event, slick) {
                //console.log('handleDestroy', event, slick);
            },
            handleEdge(event, slick, direction) {
                //console.log('handleEdge', event, slick, direction);
            },
            handleInit(event, slick) {
                //console.log('handleInit', event, slick);
            },
            handleReInit(event, slick) {
                //console.log('handleReInit', event, slick);
            },
            handleSetPosition(event, slick) {
                //console.log('handleSetPosition', event, slick);
            },
            handleSwipe(event, slick, direction) {
                //console.log('handleSwipe', event, slick, direction);
            },
            handleLazyLoaded(event, slick, image, imageSource) {
                //console.log('handleLazyLoaded', event, slick, image, imageSource);
            },
            handleLazeLoadError(event, slick, image, imageSource) {
                //console.log('handleLazeLoadError', event, slick, image, imageSource);
            },
        },
        beforeRouteEnter (to, from, next) {
            next(vm => {
                let name = vm.$route.name
                vm.$store.dispatch('getPosts', {
                    name: name,
                    type: 'slides'
                })
                // 通过 `vm` 访问组件实例
            })
        }
    }
</script>