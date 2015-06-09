<%@ WebHandler Language="C#" Class="Ajax_SendFlower_Author" %>

using System;
using System.Web;
using System.Linq;
public class Ajax_SendFlower_Author : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            if (context.Request.Params["AUTHOR_KY"] != null)
            {
                WebEntity web = new WebEntity();
                int author_ky = Convert.ToInt32(context.Request.Params["AUTHOR_KY"]);
                TBKH_AUTHOR author = web.TBKH_AUTHOR.Where(m => m.AUTHOR_KY == author_ky).FirstOrDefault();
                author.FLOWER_NUM = (author.FLOWER_NUM ?? 0) + 1;
                web.SaveChanges();
                context.Response.Write("success");
            }
            else
            {
                context.Response.Write("erro");
            }
        }
        catch (Exception)
        {

            context.Response.Write("erro");
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