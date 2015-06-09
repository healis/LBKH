<%@ WebHandler Language="C#" Class="Ajax_Get_Video_List" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
public class Ajax_Get_Video_List : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        WebEntity webdata = new WebEntity();
        int pageIndex = Convert.ToInt16(context.Request.Params["PAGEINDEX"]);
        System.Collections.Generic.List<TBKH_VIDEO_INFO> list = webdata.TBKH_VIDEO_INFO.Take(300).ToList();
        list=list.OrderBy(m=>m.VIDEO_ADD_TIME).OrderBy(m=>m.VIDEO_AUTHOR_KY).Skip(pageIndex * 30).Take(30).ToList();
        if (list.Count > 0)
        {
            context.Response.Write((new JavaScriptSerializer()).Serialize(list));
        }
        else
        {
            context.Response.Write("{\"list_count\":\"0\"}");
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