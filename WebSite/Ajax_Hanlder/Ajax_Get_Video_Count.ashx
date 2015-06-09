<%@ WebHandler Language="C#" Class="Ajax_Get_Video_Count" %>

using System;
using System.Web;
using System.Linq;
public class Ajax_Get_Video_Count : IHttpHandler
{
    /// <summary>
    /// 获取该人物下的视频数目
    /// </summary>
    /// <param name="context"></param>

    public void ProcessRequest(HttpContext context)
    {
        WebEntity web = new WebEntity();
        IQueryable<TBKH_VIDEO_INFO> list;

        if (context.Request.Params["AUTHOR_KY"] != null)
        {
            int authory_ky = Convert.ToInt32(context.Request.Params["AUTHORY_KY"]);
            list = web.TBKH_VIDEO_INFO.Where(m => m.VIDEO_AUTHOR_KY == authory_ky);

            context.Response.Write(list.Count().ToString());
        }
        else
        {
            context.Response.Write("获取失败");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}