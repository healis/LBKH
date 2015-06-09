<%@ WebHandler Language="C#" Class="Ajax_Get_Author_List" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
public class Ajax_Get_Author_List : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        List<TBKH_AUTHOR> list = new List<TBKH_AUTHOR>();
        WebEntity webdata = new WebEntity();
        list = webdata.TBKH_AUTHOR.ToList();

        if (context.Request.Params["AUTHOR_NAME"] != null)
        {
            string author_name = context.Request.Params["AUTHOR_NAME"];
            list = list.Where(m => m.AUTHOR_NAME.Contains(author_name)).ToList();
        }
        if (context.Request.Params["TOP"] != null)
        {
            int top = Convert.ToInt16(context.Request.Params["TOP"]);
            list = list.OrderBy(m => m.AUTHOR_KY).Take(top).ToList();
        }

        if (context.Request.Params["AUTHOR_KY"] != null)
        {
            int author_ky = Convert.ToInt16(context.Request.Params["AUTHOR_KY"]);
            list = list.Where(m => m.AUTHOR_KY == author_ky).ToList();
        }
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