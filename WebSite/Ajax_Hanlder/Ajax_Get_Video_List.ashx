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
        System.Collections.Generic.List<TBKH_VIDEO_INFO> list = webdata.TBKH_VIDEO_INFO.ToList();
        context.Response.Write((new JavaScriptSerializer()).Serialize(list));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}