export default {
    setCities(state, payload) {
        state.cities = payload
    },
    loading(state, payload){
        state.loading = payload
    },
    singleLoading(state, payload){
        state.singleLoading = payload
    },
    setUserInfo(state, user){
        state.user = user
    },
    setBoardList(state, payload){
        if( Object.keys(state.boardList).length == 0 || payload.more != true){
            state.boardList = payload.boardList
        }
        else{
            state.boardList.data = state.boardList.data.concat(payload.boardList.data)
            state.boardList.meta = payload.boardList.meta
            state.boardList.links = payload.boardList.links
        }
    },
    setAgeGroups(state,ageGroups){
        state.ageGroups = ageGroups
    },
    setActivities(state, activities){
        state.activities = activities
    },
    setReadingLogs(state, logs){
        state.readingLogs = logs
    },
    setActivityLogs(state, logs){
        state.activityLogs = logs
    },
    setPrizeLogs(state, logs){
        state.prizeLogs = logs
    },
    setSelfInfo(state, self){
        state.self = self
    },
    updateNickname(state, nickname){
        state.self.nickname = nickname
    },
    updateTel(state, tel){
        state.self.tel = tel
    },
    updateVotedNumber(state, payload){
        if( state.boardList.data[payload.index] ){
            state.boardList.data[payload.index].voted_number = payload.voted_number
            state.boardList.data[payload.index].has_voted = payload.has_voted
            state.boardList.data[payload.index].words_number = payload.words_number
        }
    },
    updateSelfVotedNumber(state, payload){
        if(state.self){
            state.self.activity_info.voted_number = payload.voted_number
            state.self.activity_info.has_voted = payload.has_voted
            state.self.activity_info.words_number = payload.words_number
        }
    },
    updateUserVotedNumber(state, payload){
        if(state.user){
            state.user.activity_info.voted_number = payload.voted_number
            state.user.activity_info.has_voted = payload.has_voted
            state.user.activity_info.words_number = payload.words_number
        }
    },
    setQuestion(state, question){
        state.question = question
    },
    setPrizes(state, payload){
        if( payload != undefined && payload.more == true ){
            let prizes = payload.prizes
            prizes.data.prizes.data = state.prizesData.data.prizes.data.concat(payload.prizes.data.prizes.data)
            state.prizesData = prizes
        }
        else{
            state.prizesData = payload.prizes
        }
    },
    setPosts(state, payload){
        if( payload != undefined && payload.more == true ){
            state.posts.data = state.posts.data.concat(payload.data.data)
            state.posts.meta = payload.data.meta
            state.posts.links = payload.data.links
        }
        else{
            state.posts = payload.data
        }
    },
    setSlides(state, payload){
        state.slides = payload.data
    },
    updateAvatar(state,avatar){
        state.self.avatar = avatar
    }
}