using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies.Get("Login");
            if (cookie != null && cookie["Userid"] != null)
            {
                Userid.Text = cookie["Userid"];
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String userid = Userid.Text;
        String filename = Server.MapPath("~/User_Data/" + userid + ".js");
        try
        {
            String jsonData = File.ReadAllText(filename);

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            RegData data = serializer.Deserialize<RegData>(jsonData);

            if (data.password == password.Text)
            {
                Session["userid"] = userid;
                Session["ada"] = data.ada;
                if (RememberMe.Checked)
                {
                    HttpCookie cookie = new HttpCookie("Login");
                    cookie.Expires = DateTime.Now.AddDays(7);
                    cookie["Userid"] = userid;
                    Response.Cookies.Add(cookie);
                }
                else {
                    Request.Cookies.Remove("Login");
                }
                Response.Redirect("Lookup.aspx");
            }
            else
            {
                Warning.Text = "wrong password";
            }
        }
        catch (IOException exn) {
            Warning.Text = "user not found (" + exn + ")";
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