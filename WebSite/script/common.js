/*打开窗口*/
function media_open(url, width, height) {
    layer.open({
        title: "萝卜开会",
        type: 2,
        area: [width, height],
        content: [url, 'no']
    });
}




//弹出即全屏
function openFullWindow(title, url) {
    var index = layer.open({
        type: 2,
        title: title,
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


function window_open_NoTitle(url,width,height) {
    window.open(url, 'newwindow', 'height='+height+', width='+width+', top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')
}