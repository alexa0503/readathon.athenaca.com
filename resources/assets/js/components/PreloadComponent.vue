<template>
    <div class="loading" v-if="loading">
        <div class="main-content"><img src="/images/icon-logo.png" class="img-fluid" width="100" /></div>
    </div>
</template>

<script>
    import {mapGetters, mapActions} from 'vuex'
    export default {
        computed: {
            ...mapGetters({
                loading: 'loading',
                self: 'self'
            })
        }
    }
</script>