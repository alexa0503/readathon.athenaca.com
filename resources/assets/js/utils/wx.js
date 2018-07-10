window.axios = require('axios')
import * as apiUrls from './../utils/api-urls'
export const share = function(data) {
    //默认值
    let defaultInfo = {
        title: '阅读马拉松，书中也有万里路 ！',
        desc: '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
        timelineDesc: '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
        imgUrl: 'http://readathon.athenaca.com/images/share.png',
        link: 'http://readathon.athenaca.com/'
    }
    let title,desc,imgUrl,link,timelineDesc
    if( data == undefined || data.title == undefined ){
        title = defaultInfo.title
    }
    else{
        title = data.title
    }
    if( data == undefined || data.desc == undefined ){
        desc = defaultInfo.desc
    }
    else{
        desc = data.desc
    }

    if( data == undefined || data.timelineDesc == undefined ){
        timelineDesc = defaultInfo.timelineDesc
    }
    else{
        timelineDesc = data.timelineDesc
    }

    if( data == undefined || data.imgUrl == undefined ){
        imgUrl = defaultInfo.imgUrl
    }
    else{
        imgUrl = data.imgUrl
    }
    if( data == undefined || data.link == undefined ){
        link = defaultInfo.link
    }
    else{
        link = data.link
    }
    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: imgUrl, // 分享图标
            type:'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.onMenuShareTimeline({
            title: timelineDesc, // 分享标题
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: imgUrl, // 分享图标
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });
}
export const initConfig = function(url){
    if( url == undefined ){
        url = window.location.href
    }
    console.log(url.split('#')[0])
    axios.get(apiUrls.WX_CONFIG_URL, {
        params: {
            url: url.split('#')[0]
        }
    })
    .then(function (response) {
        let data = response.data
        wx.config({
            debug: false,
            appId: data.appId,
            timestamp: data.timestamp,
            nonceStr: data.nonceStr,
            signature: data.signature,
            jsApiList: [
                'onMenuShareAppMessage',
                'onMenuShareTimeline',
                'chooseImage',
                'uploadImage',
                'previewImage',
                'getLocalImgData',
            ]
        });
    })
    .catch(function (error) {
    });
}