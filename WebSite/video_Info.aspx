<%@ Page Language="C#" AutoEventWireup="true" CodeFile="video_Info.aspx.cs" Inherits="video_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="script/jquery-1.7.1.min.js"></script>

    <link href="css/css.css" rel="stylesheet" />
    <link href="css/video_info.css" rel="stylesheet" />
    <script src="script/common.js"></script>
    <title>视频详细信息</title>
    <script type="text/javascript">
        jQuery(function () {
            jQuery("#tdHide").click(function () {
                if (jQuery(this).text() == "收起") {
                    jQuery(this).text("展开");
                    jQuery("#divVideoDetail").hide();
                    jQuery("#divTools").animate({ "top": "-220px","opacity":"0.4" })
                } else {
                    jQuery(this).text("收起")
                    jQuery("#divTools").animate({ "top": "0px", "opacity": "1.0" });
                }
            })

            jQuery("#tdDetail").click(function () {
                jQuery("#divVideoDetail").slideToggle()
            })

            jQuery("#tdAsk").click(function () {
                window.parent.layer.open();
            })
            jQuery("#tdtc").click(function () {
                window_open_NoTitle(window.location.href + "&tc=tc", 800, 400);
            })
        });
    </script>
</head>
<body style="padding: 0px; margin: 0px; background: #ccc">
    <form id="form1" runat="server">
        <div style="width: 840px; height: 400px; z-index: 20;">

            <embed runat="server" id="embedSrc" src="http://player.video.qiyi.com/b56eb32db21162a91f31ce8664fff8e9/0/0/v_19rrohyses.swf-albumId=371270200-tvId=371270200-isPurchase=0-cnId=6"
                quality="high"
                wmode="opaque"
                type="application/x-shockwave-flash" width="840" height="400" />

        </div>
        <div id="divVideoDetail" class="divVideoDetail">
            <table>
                <tr>
                    <th>名称</th>
                    <td><span id="spanVideoName" runat="server"></span></td>
                    <th>时长</th>
                    <td><span id="spanVideoTime" runat="server"></span></td>
                    <th>播放次数</th>
                    <td><span id="spanVideoViewCount" runat="server"></span></td>
                </tr>
                <tr>
                    <th>人员</th>
                    <td><span id="spanVideoPreform" runat="server"></span></td>
                    <th>好评</th>
                    <td><span id="spanVideoGood" runat="server"></span></td>
                    <th>差评</th>
                    <td><span id="spanVideoBad" runat="server"></span></td>
                </tr>
                <tr>
                    <th>视屏来源</th>
                    <td colspan="5"><span id="spanVideoFrom" runat="server"></span></td>
                </tr>
                <tr>
                    <td style="padding: 10px; text-indent: 30px; line-height: 30px; text-align: left;" colspan="6">
                        <span id="spanVideoDesc" runat="server"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divTools" class="video_tools" runat="server">
            <table>

                <tr>
                    <td id="tdDetail">详细</td>
                </tr>
                <tr>
                    <td>点赞</td>
                </tr>
                <tr>
                    <td>差评</td>
                </tr>
                <tr>
                    <td id="tdAsk">评论</td>
                </tr>
                <tr>
                    <td id="tdtc">弹出</td>
                </tr>
                <tr>
                    <td id="tdHide">收起</td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
