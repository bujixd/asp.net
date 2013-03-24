using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String userid = Request.QueryString["userid"];
        String errid = Request.QueryString["errid"];

        Userid.Text = userid;

        if (errid == "lookup") {
            message.Text = "error trying to retrieve user data! ";
        }
        else if (errid == "registration")
        {
            message.Text = "error trying to save user data!";
        }
        else {
            message.Text = "unknow erroe!";
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        Object isAda = Session["ada"];
        if (isAda != null)
        {
            Boolean ada = (Boolean)isAda;
            if (ada)
                Page.Theme = "ADA";
        }

        /*HttpCookie cookie = Request.Cookies.Get("Registration");
        if (cookie != null && cookie["ADA"] == "true")
            Page.Theme = "ADA";*/
    }
}