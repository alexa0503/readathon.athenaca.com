import Vue from 'vue'
import Vuex from 'vuex'
import mutations from './mutations'
import actions from './actions'
import getters from './getters'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cities:[],
    loading: false,
    user: {},
    self: {},
    boardList: {},
    homeBoardList: {},
    activities: {},
    ageGroups: {},
    readingLogs: {},
    activityLogs: {},
    prizeLogs: {},
    logs: {},
    question:{ret:0,data:{}},
    prizesData: {},
    posts: {},
    slides: {},
    activityId: 0
  },
  getters,
  actions,
  mutations
  //strict: process.env.NODE_ENV !== 'production'
})