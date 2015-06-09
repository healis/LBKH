
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        //WebData webdata = new WebData();
        //webdata.TBKH_AUTHOR.AddObject(
        //    new TBKH_AUTHOR()
        //    {
        //        AUTHOR_NAME = this.txtAuthorName.Value,
        //        AUTHOR_OPUS = this.txtOpus.Value,
        //        AUTHOR_ADD_TIME = DateTime.Now,
        //        AUTHOR_BIRTHDAY = DateTime.Parse(this.txtBirthday.Value),
        //        AUTHOR_HOMETOWN = this.txtHomeTown.Value,
        //        AUTHOR_SEX_CODE = this.selectSex.SelectedItem.Value,
        //        AUTHOR_SEX_DESC = this.selectSex.SelectedItem.Text,
        //        AUTHOR_STATUS_CODE = 0,
        //        AUTHOR_STATUS_DESC = "正常",
        //        AUTHOR_WORKS = this.txtWork.Value,
        //        AUTHOR_BAIKE_URL = this.txtBaikeUrl.Value,
        //        AUTHOR_FRIEND = this.txtFrid.Value,
        //        AUTHOR_DESC = this.txtDesc.Value
        //    }
        //    );
        //webdata.SaveChanges();
    }
}