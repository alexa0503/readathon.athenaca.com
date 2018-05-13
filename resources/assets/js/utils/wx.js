window.axios = require('axios')
import * as apiUrls from './../utils/api-urls'
export const share = function(data) {
    //默认值
    let defaultInfo = {
        title: '坚持阅读，人生处处有惊喜！',
        desc: '邀请好友一起参加阅读马拉松，就能获得500字数奖励！',
        imgUrl: 'http://readathon.athenaca.com/images/share.png',
        link: 'http://readathon.athenaca.com/'
    }
    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: data.title || defaultInfo.title, // 分享标题
            desc: data.desc || defaultInfo.desc, // 分享描述
            link: data.link || defaultInfo.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: data.imgUrl || defaultInfo.imgUrl, // 分享图标
            type: data.type || 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: data.dataUrl || '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.onMenuShareTimeline({
            title: data.title || defaultInfo.title, // 分享标题
            desc: data.desc || defaultInfo.desc, // 分享描述
            link: data.link || defaultInfo.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: data.imgUrl || defaultInfo.imgUrl, // 分享图标
            type: data.type || 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: data.dataUrl || 'link', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });
}
export const initConfig = function(debug=false){
    let url = window.location.href
    axios.get(apiUrls.WX_CONFIG_URL, {
        params: {
            url: url
        }
    })
    .then(function (response) {
        let data = response.data
        wx.config({
            debug: debug,
            appId: data.appId,
            timestamp: data.timestamp,
            nonceStr: data.nonceStr,
            signature: data.signature,
            jsApiList: [
                'onMenuShareAppMessage',
                'onMenuShareTimeline',
                'uploadImage',
                'previewImage',
                'getLocalImgData',
                'chooseImage'
            ]
        });
    })
    .catch(function (error) {
    });
}