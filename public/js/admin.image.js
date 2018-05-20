var maxNumber = 1
function thumbRemove(obj) {
    if (confirm('确认删除?')) {
        obj.parent('.col-md-3').remove();
        imagesCount--;
        if( imagesCount < maxNumber){
            $('#imageAdd').show();
        }
    }
}
function addImage()
{
    if( imagesCount >= maxNumber ){
        alert('最多只能添加一张图片')
        return false;
    }
    window.open('/filemanager?type=Images','upload','fullscreen=no,width=1000,height=600',true);
}
function SetUrl(url1, url2) {
    if( imagesCount >= maxNumber ){
        alert('最多只能添加一张图片')
        return false;
    }
    var url = ('/' + url2).replace('//', '/');
    var html = '';
    html +=
        '<div class="col-md-3"><a href="javascript:;" title="点击删除" onclick="thumbRemove($(this))" class="thumbnail"><img src="' +
        url + '" /></a><input type="hidden" name="image" value="' + url + '"></div>';
    $('#image-add').before(html);
    imagesCount++ ;
    if( imagesCount >= maxNumber ){
        $('#imageAdd').hide();
    }
}