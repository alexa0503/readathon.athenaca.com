window.axios = require('axios')
import * as apiUrls from './../utils/api-urls'

export const loadWxShare = function(url){
    return new Promise((resolve, reject) => {
        if( url == undefined ){
            url = location.href
        }
        url = encodeURIComponent(url.split('#')[0]);
        axios.get(apiUrls.WX_CONFIG_URL, {
            params: {
                url: url
            }
        })
        .then(function (response) {
            return resolve(response.data)
        })
        .catch(function (error) {
            return reject(error)
        })
    })
}
export const share = function(config,data) {
    wx.config({
        debug: false,
        appId: config.appId,
        timestamp: config.timestamp,
        nonceStr: config.nonceStr,
        signature: config.signature,
        jsApiList: [
            'onMenuShareAppMessage',
            'onMenuShareTimeline',
            'chooseImage',
            'uploadImage',
            'previewImage',
            'getLocalImgData',
        ]
    })
    wx.error(function(res){
        console.log(res)
        // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
    })
    let shareData = {
        title: data.title || '阅读马拉松，书中也有万里路 ！',
        desc: data.desc || '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
        timelineDesc: data.timelineDesc || '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
        imgUrl: data.imgUrl || 'http://readathon.athenaca.com/images/share.png',
        link: data.link || 'http://readathon.athenaca.com/'
    }
    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: shareData.title, // 分享标题
            desc: shareData.desc, // 分享描述
            link: shareData.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: shareData.imgUrl, // 分享图标
            type:'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            fail: function(){
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.onMenuShareTimeline({
            title: shareData.timelineDesc, // 分享标题
            link: shareData.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: shareData.imgUrl, // 分享图标
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            fail: function(){
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });
}