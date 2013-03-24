using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    int Counter = 0;
    protected void ImageTimer_Tick(object sender, EventArgs e)
    {
        if(Session["image"] != null){
            Counter = (Int32)Session["image"];
        }

        UserInfo info = new UserInfo();
        String userid = info.GetImageUserid(Counter);
        UserLink.NavigateUrl = "Details.aspx?user=" + userid;
        UserLink.ImageUrl = "User_Images/" + userid + ".jpg";
        Counter++;
        Session["image"] = (Int32)Counter;
    }
    
}