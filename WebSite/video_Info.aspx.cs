using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class video_Info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["tc"] != null && Request.Params["tc"] == "tc")
        {
            this.divTools.Visible = false;
        }
        LoadVideoData();
    }

    public void LoadVideoData()
    {
        int video_ky = Convert.ToInt32(Request.Params["VIDEO_KY"]);
        WebEntity web = new WebEntity();
        TBKH_VIDEO_INFO videoInfo = web.TBKH_VIDEO_INFO.Where(m => m.VIDEO_KY == video_ky).FirstOrDefault();
        this.embedSrc.Attributes["src"] = videoInfo.VIDEO_SHARE_URL;
        this.spanVideoBad.InnerText = videoInfo.VIDEO_BAD_CLICK.ToString();
        this.spanVideoDesc.InnerHtml = videoInfo.VIDEO_DESC;
        this.spanVideoFrom.InnerHtml = videoInfo.VIDEO_FORM;
        this.spanVideoGood.InnerHtml = videoInfo.VIDEO_GOOD_CLICK.ToString();
        this.spanVideoName.InnerHtml = videoInfo.VIDEO_NAME;
        this.spanVideoPreform.InnerHtml = videoInfo.VIDEO_PERFORMER;
        this.spanVideoTime.InnerHtml = videoInfo.VIDEO_TIME;
        this.spanVideoViewCount.InnerHtml = videoInfo.VODEO_VIEW_COUNT.ToString();
    }
}