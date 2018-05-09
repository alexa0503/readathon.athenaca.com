window.axios = require('axios')
import * as apiUrls from './../utils/api-urls' 
export const wxShare = function(data) {
    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: data.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: data.imgUrl, // 分享图标
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
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: data.link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: data.imgUrl, // 分享图标
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
export const initConfig = function(){
    let url = window.location.href
    axios.get(apiUrls.WX_CONFIG_URL, {
        params: {
            url: url
        }
    })
    .then(function (response) {
        console.log(response)
        /*
        wx.config({
            debug: false,
            appId: data.appId,
            timestamp: data.timestamp,
            nonceStr: data.nonceStr,
            signature: data.signature,
            jsApiList: [
                'onMenuShareAppMessage',
                'onMenuShareTimeline'
            ]
          });
        */
    })
    .catch(function (error) {
    });
}