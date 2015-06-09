<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="script/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="script/layer/skin/layer.css" rel="stylesheet" />
    <link href="css/css.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="script/jQuery.Masonry.js" type="text/javascript"></script>
    <script src="script/layer/layer.js"></script>
    <script src="script/common.js"></script>
    <title>萝卜开会</title>
    <script>

        var pageIndex = 0;
        jQuery(function () {

            jQuery("#mascory").masonry({
                itemSelector: '.video_item',
                columnWidth: 220
            });
            jQuery.ajaxSettings.async = false;
            LoadVideoInfo();
            LoadAuthorInfo();
            InitEvent();

        });
        //加载人员信息
        function LoadAuthorInfo() {
            jQuery.getJSON("Ajax_Hanlder/Ajax_Get_Author_List.ashx?m=" + Math.random(), { "TOP": 7 }, function (author_data) {

                jQuery(author_data).each(function (i, m) {
                    var img = $("<img src='" + m.AUTHOR_IMG + "' class='img-circle' />");

                    img.attr("data-value", m.AUTHOR_KY)
                    jQuery(".author_list").append(img);
                });
                jQuery(".author_list").append("<img src='author_img/more.png' data-value='0' class='img-circle' />")
            })
        }
        function LoadVideoInfo() {

            if (jQuery("#divNotNum").html() != "已全部加载完") {
                jQuery.getJSON("Ajax_Hanlder/Ajax_Get_Video_List.ashx?PAGEINDEX=" + pageIndex + "&r=" + Math.random(), function (data) {
                    if (data.list_count == undefined || data.list_count == null) {
                        jQuery.get("templates/video_Item_temp.txt?r=" + Math.random()).success(function (resHtml) {
                            var html = resHtml;
                            jQuery(data).each(function (i, m) {
                                var $item = jQuery(html.replace("$VIDEO-PREFORM", m.VIDEO_PERFORMER)
                                    .replace("$VIDEO-NAME", m.VIDEO_NAME)
                                    .replace("$VIDEO-TIME", m.VIDEO_TIME)
                                    .replace("$VIEW-COUNT", m.VODEO_VIEW_COUNT)
                                    .replace("$GOOD-COUNT", m.VIDEO_GOOD_CLICK)
                                    .replace("$BAD-COUNT", m.VIDEO_BAD_CLICK)

                                    );
                                $item.hover(function () {
                                    jQuery(this).find(".video_item_img").children(".video_item_title").fadeIn();
                                }, function () {
                                    jQuery(this).find(".video_item_img").children(".video_item_title").fadeOut();

                                }).on("click", function () {
                                    media_open("小偷公司", "video_info.aspx");
                                })
                                jQuery("#mascory").append($item).masonry("appended", $item);
                            })
                        });
                    } else {
                        jQuery("#divNotNum").show();
                        jQuery("#divNotNum").html("已全部加载完");
                    }

                });
            }
        }

        function LoadAuthorDetail(author_ky) {
            jQuery.getJSON("Ajax_Hanlder/Ajax_Get_Author_List.ashx?r=" + Math.random(), { "AUTHOR_KY": author_ky }).success(function (author_detail) {
                jQuery.get("templates/author_detail_temp.txt?r=" + Math.random()).success(function (temp_text) {
                    var author_detail_Item = temp_text.replace("$AUTHOR-DESC", author_detail[0].AUTHOR_DESC).
                    replace("$AUTHOR-NAME", author_detail[0].AUTHOR_NAME).
                    replace("$AUTHOR-IMG", author_detail[0].AUTHOR_IMG).
                    replace("$AUTHOR-BIRTHDAY", formatJsonDate(author_detail[0].AUTHOR_BIRTHDAY)).
                    replace("$AUTHOR-SEX", author_detail[0].AUTHOR_SEX_DESC).
                    replace("$AUTHOR-TOWN", author_detail[0].AUTHOR_HOMETOWN).
                    replace("$AUTHOR-OPUS", author_detail[0].AUTHOR_OPUS).
                    replace("$AUTHOR-BAIKE", author_detail[0].AUTHOR_BAIKE_URL).
                    replace("$AUTHOR-FLOWER", author_detail[0].FLOWER_NUM).
                    replace("$AUTHOR-KY", author_detail[0].AUTHOR_KY);

                    jQuery.get("Ajax_Hanlder/Ajax_Get_Video_Count.ashx?r=" + Math.random(), { "AUTHOR_KY": author_ky }).success(function (video_num) {
                        author_detail_Item = author_detail_Item.replace("$VIDEO-NUM", video_num);
                    });

                    jQuery(".author_content").html(author_detail_Item);

                });
            });
        }

        /*
        初始化事件
        */
        function InitEvent() {

            ///点击人物图标
            jQuery(".author_list img").click(function () {

                var author_ky = jQuery(this).attr("data-value");
                if (author_ky == null || author_ky == undefined || author_ky == 0) {
                    layer.msg("更多[More]", { icon: 1 });
                } else {
                    LoadAuthorDetail(author_ky);
                    jQuery(".author_info").slideDown(1000);
                }
            });
            //点击关闭按钮
            jQuery(".author_info_button span").click(function () {
                jQuery(".author_info").slideUp(1000);
            })

            jQuery(window).scroll(function () {
                var scrollTop = $(this).scrollTop();
                var scrollHeight = $(document).height();
                var windowHeight = $(this).height();
                if (scrollTop + windowHeight == scrollHeight) {
                    pageIndex++;
                    LoadVideoInfo();
                }
            });

        }
        //送花
        function clickSendFlover(it) {
            jQuery.post("Ajax_Hanlder/Ajax_SendFlower_Author.ashx?r=" + Math.random(), { "AUTHOR_KY": jQuery(it).attr("data-value") }).success(function (res) {
                if (res == "success") {
                    layer.alert("送花成功", { icon: 1 });
                    jQuery(it).next("span").text(parseInt(jQuery(it).next("span").text()) + 1);
                } else {
                    layer.alert("送花失败，请稍候再试");
                }
            })
        }

        function clickBaiKe(it) {
            if (jQuery(it).text().length == 0 || undefined == jQuery(it).text()) {
                layer.alert("没有百科信息", { icon: 2 });
            } else {
                media_open("百度百科-原文由百度百科提供", jQuery(it).text());
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="nav">
            <table>
                <tr>
                    <td>首页</td>
                    <td>相声小品</td>
                    <td>配音</td>
                    <td>恶搞</td>
                    <td>蛋疼图</td>
                    <td>段子</td>
                    <td>神回复</td>
                    <td>个人中心</td>
                    <td style="border-right: none">论坛</td>
                </tr>
            </table>
        </div>
        <div class="div_title">著名人物</div>
        <div class="author_list">
        </div>
        <div class="author_info">
            <div class="author_info_button">
                <span>X</span>
            </div>
            <div class="author_content">
            </div>
        </div>
        <div class="div_title">最新相声小品</div>
        <div id="mascory">
        </div>
        <div id="divNotNum" style="display: none; height: 100px; border-top: dashed 1px #ccc; line-height: 50px; text-align: center; color: #ccc; font-size: 20px">
        </div>
    </form>
</body>
</html>
