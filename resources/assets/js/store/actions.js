//import * as types from './mutation-types'
import * as apiUrls from './../utils/api-urls'
export default {
    initRegisterPage({
        dispatch,
        commit
    }) {
        dispatch('getCites')
        dispatch('getPosts', {
            name:'register',
            type:'article',
            page: 1,
            more: false
        })
    },
    initBoardPage({
        dispatch,
        commit
    }, id) {
        (async function () {
            await dispatch('getCites');
            await dispatch('getAgeGroups');
            await dispatch('getActivities');
            dispatch('getBoardList', {page:1, id:id})
        })()
    },
    initProfilePage({
        dispatch,
        commit
    }) {
        dispatch('getCites')
    },
    initQuestionPage({
        dispatch,
        commit
    }) {
        dispatch('getQuestion')
    },
    initInvitePage({
        dispatch,
        commit
    }) {
        //dispatch('getSelfInfo')
    },
    initIndexPage({
        dispatch,
        commit
    }) {
        (async function () {
            await dispatch('getSelfInfo', 'withoutme')
            dispatch('getBoardList', {page:1, type: 'withoutme', name:'home'})
        })()
    },
    initPrizePage({
        dispatch,
        state,
        commit
    }, id) {
        dispatch('getPrizes', {
            id: id
        })
    },
    initAccountPage({
        dispatch,
        commit
    }, id) {
        (async function () {
            await dispatch('getUserInfo', id)
            //await dispatch('getSelfInfo')
            dispatch('getReadingLogs', {
                page: 1,
                id: id
            })
            dispatch('getActivityLogs', {
                page: 1,
                id: id
            })
            dispatch('getPrizeLogs', {
                page: 1,
                id: id
            })
        })()
    },
    getCites({
        state,
        commit
    }) {
        if (state.cities.length == 0) {
            axios.get(apiUrls.CITIES_URL)
                .then(function (response) {
                    let cities = response.data.data
                    commit('setCities', cities)
                })
                .catch(function (error) {});
        }

    },
    loading({
        dispatch,
        commit
    }) {
        return new Promise((resolve, reject) => {
            commit('loading', true)
            setTimeout(function () {
            }, 500)
            resolve()
        })
        
    },
    finished({
        commit
    }) {
        return new Promise((resolve, reject) => {
            setTimeout(function () {
                commit('loading', false)
                resolve()
            }, 500)
        });
        
    },
    getUserInfo({
        state,
        commit
    }, id = null) {
        let url
        if (id == undefined || id == null) {
            url = apiUrls.USER_URL
        } else {
            url = apiUrls.USER_URL + '/' + id
        }
        axios.get(url).then(function (response) {
                let user = response.data.data
                commit('setUserInfo', user)
            })
            .catch(function (error) {});
    },
    getSelfInfo({
        state,
        commit
    }, type) {
        return new Promise((resolve, reject) => {
            if (typeof state.self === "object" && !(state.self instanceof Array)) {
                axios.get(apiUrls.USER_URL, {
                        params: {
                            type: type,
                        }
                    })
                    .then(function (response) {
                        let user = response.data.data
                        commit('setSelfInfo', user)
                        resolve(user)
                    })
                    .catch(function (error) {
                        reject(error)
                    });
            }
            else{
                resolve()
            }
        })

    },
    getBoardList({
        commit
    }, payload) {
        let name = payload.name
        if (payload.page == undefined || payload.page == 1 ) {
            commit('clearBoardList', name)
        }
        return new Promise((resolve, reject) => {
            let url = apiUrls.BOARD_LIST_URL
            let params =  {
                id: payload.id,
                page: payload.page,
                type: payload.type,
                city: payload.city,
                activity: payload.activity,
                agegroup: payload.ageGroup
            }
            axios.get(url, {
                params:params
            })
            .then(function (response) {
                let boardList = response.data
                commit('setBoardList', {
                    boardList,
                    name
                })
               return resolve(boardList)
            })
            .catch(function (error) {
                return reject(error)
            });
        })
        
    },
    getActivities({
        state,
        commit
    }, limit) {
        axios.get(apiUrls.ACTIVITIES_URL, {
                params: {
                    limit: 2
                }
            }).then(function (response) {
                let activities = response.data.data
                commit('setActivities', activities)
            })
            .catch(function (error) {});
    },
    getAgeGroups({
        state,
        commit
    }) {
        if (typeof state.ageGroups === "object" && !(state.ageGroups instanceof Array)) {
            axios.get(apiUrls.AGE_GROUPS_URL).then(function (response) {
                    let ageGroups = response.data.data
                    commit('setAgeGroups', ageGroups)
                })
                .catch(function (error) {});
        }
    },
    getReadingLogs({
        state,
        commit
    }, {
        page,
        id
    }) {
        let url
        if (id == undefined) {
            url = apiUrls.READING_LOGS_URL
        } else {
            url = apiUrls.READING_LOGS_URL + '/' + id
        }
        axios.get(url, {
                params: {
                    page: page,
                    id: id
                }
            }).then(function (response) {
                let logs = response.data
                commit('setReadingLogs', logs)
            })
            .catch(function (error) {});
    },
    getActivityLogs({
        state,
        commit
    }, {
        page,
        id
    }) {
        let url
        if (id == undefined) {
            url = apiUrls.ACTIVITY_LOGS_URL
        } else {
            url = apiUrls.ACTIVITY_LOGS_URL + '/' + id
        }
        axios.get(url, {
                params: {
                    page: page
                }
            }).then(function (response) {
                let logs = response.data
                commit('setActivityLogs', logs)
            })
            .catch(function (error) {});
    },
    getPrizeLogs({
        state,
        commit
    }, {
        page,
        id
    }) {
        let url
        if (id == undefined) {
            url = apiUrls.PRIZE_LOGS_URL
        } else {
            url = apiUrls.PRIZE_LOGS_URL + '/' + id
        }
        axios.get(url, {
                params: {
                    page: page
                }
            }).then(function (response) {
                let logs = response.data
                commit('setPrizeLogs', logs)
            })
            .catch(function (error) {});
    },
    async vote({
        commit
    }, {
        user_id,
        index
    }) {
        let url = apiUrls.VOTE_URL + '/' + user_id
        if (user_id == undefined) {
            return reject('no id')
        }
        axios.post(url).then(function (response) {
            if (response.data && response.data.ret == 0) {
                let data = response.data.data
                if (index == undefined) {
                    commit('updateSelfVotedNumber', data)
                } else if (index != -1) {
                    data.index = index
                    commit('updateVotedNumber', data)
                } else {
                    commit('updateUserVotedNumber', data)
                }
            }
        }).catch(function (error) {
        })
    },
    getQuestion({
        commit
    }) {
        let url = apiUrls.QUESTION_URL
        axios.get(url).then(function (response) {
            let question = response.data
            commit('setQuestion', question)
        }).catch(function (error) {})
    },
    getPrizes({
        state,
        commit
    }, payload) {
        let more, page, id, url
        if (payload == undefined || payload.more == undefined) {
            more = false
        } else {
            more = payload.more
        }
        if (payload == undefined || payload.page == undefined) {
            page = 1
        } else {
            page = payload.page
        }

        if (payload == undefined || payload.id == undefined) {
            id = null
        } else {
            id = payload.id
        }

        if (id != null) {
            url = apiUrls.PRIZES_URL + '/' + id
        } else {
            url = apiUrls.PRIZES_URL
        }
        
        return new Promise((resolve, reject) => {
            axios.get(url, {
                params: {
                    page: page,
                }
            }).then(function (response) {
                let prizes = response.data
                commit('setPrizes', {
                    prizes,
                    more
                })
                return resolve(prizes);
            }).catch(function (error) {
                return reject(error)
            })
        });
    },
    getPosts({
        commit
    }, payload) {
        if (payload == undefined) {
            payload = {
                name: 'home',
                type: 'article',
                page: 1,
                more: false
            }
        }
        let url = apiUrls.POSTS_URL + '/' + payload.name + '/' + payload.type
        let commitName
        if (payload.type == 'article') {
            commitName = 'setPosts'
        } else {
            commitName = 'setSlides'
        }
        axios.get(url, {
            params: {
                page: payload.page,
            }
        }).then(function (response) {
            let data = response.data
            commit(commitName, {
                data,
                more: payload.more
            })
        }).catch(function (error) {})
    },
    uploadAvatar({commit},serverId){
        let url = apiUrls.GET_AVATAR_FROM_WX + '/' + serverId
        axios.get(url).then(function (response) {
            if( response && response.data.ret == 0){
                let avatar = response.data.data.url
                commit('updateAvatar', avatar)
            }
        }).catch(function (error) {})
    }
}