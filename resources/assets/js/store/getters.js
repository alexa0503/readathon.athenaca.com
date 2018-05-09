//import * as types from './mutation-types'
export default {
    cities: (state, getters) => {
        return state.cities
    },
    loading: (state, getters) => {
        return state.loading
    },
    singleLoading: (state, getters) => {
        return state.singleLoading
    },
    user: (state, getters) => {
        return state.user
    },
    self: (state, getters) => {
        return state.self
    },
    boardList: (state, getters) => {
       return state.boardList
    },
    ageGroups: (state, getters) => {
        return state.ageGroups
    },
    activities: (state, getters) => {
        return state.activities
    },
    hasRegistered: (state, getters) => {
        return state.self.name != null
    },
    readingLogs: (state, getters) => {
        return state.readingLogs
    },
    activityLogs: (state, getters) => {
        return state.activityLogs
    },
    prizeLogs: (state, getters) => {
        return state.prizeLogs
    },
    question: (state, getters) => {
        return state.question
    },
    prizesData: (state, getters) => {
        return state.prizesData
    },
    posts: (state, getters) => {
        return state.posts
    },
    slides: (state, getters) => {
        return state.slides
    }
}