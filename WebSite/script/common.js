/*打开窗口*/
function media_open(title_name, url) {
    layer.open({
        type: 2,
        title: title_name,
        area: ['630px', '360px'],
        shade: 0.8,
        shadeClose: false,
        content: url


    });
}




//弹出即全屏
function openFullWindow(title,url) {
    var index = layer.open({
        type: 2,
        title:title,
        content: url,
        area: ['300px', '195px'],
        maxmin: true
    });
    layer.full(index);

}


/*格式化日期*/
function formatJsonDate(fromatStr) {
    var jsonDate = new Date(parseInt(fromatStr.substring(6, fromatStr.length - 2)));
    return jsonDate.getFullYear() + "-" + (jsonDate.getMonth() + 1) + "-" + jsonDate.getDate();
}