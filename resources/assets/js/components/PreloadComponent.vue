<template>
    <div class="loading" v-if="loading">
        <div class="main-content"><img src="/images/icon-logo.png"/><p>Loading...</p></div>
    </div>
</template>

<script>
    import {mapGetters, mapActions} from 'vuex'
    import * as jssdk from './../utils/wx' 
    export default {
        computed: mapGetters({
            loading: 'loading'
        }),
        created(){
            jssdk.initConfig()
            console.log(window.wx)
        }
    }
</script>