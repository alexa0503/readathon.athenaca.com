export default {
    setCities(state, payload) {
        state.cities = payload
    },
    loading(state, payload){
        state.loading = payload
    },
    setUserInfo(state, user){
        state.user = user
    },
    clearBoardList(state, name){
        if( name == 'home' ){
            state.homeBoardList = {}
        }
        else{
            state.boardList = {}
        }
    },
    setBoardList(state, payload){
        let boardList = {}
        if( payload.name == 'home' ){
            boardList =  state.homeBoardList
        }
        else{
            boardList =  state.boardList
        }
        if( Object.keys(boardList).length == 0 || payload.page == 1){
            boardList  = payload.boardList
        }
        else{
            boardList.data = boardList.data.concat(payload.boardList.data)
            boardList.meta = payload.boardList.meta
            boardList.links = payload.boardList.links
        }
        if( payload.name == 'home' ){
            state.homeBoardList =  boardList
        }
        else{
            state.boardList =  boardList
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
    updateHomeVotedNumber(state, payload){
        if( state.homeBoardList.data[payload.index] ){
            state.homeBoardList.data[payload.index].voted_number = payload.voted_number
            state.homeBoardList.data[payload.index].has_voted = payload.has_voted
            state.homeBoardList.data[payload.index].words_number = payload.words_number
        }
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