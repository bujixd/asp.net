using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Object user = Session["userid"];
        if (user != null)
        {
            String userid = (String)user;
            try
            {
                String filename = Server.MapPath("~/User_Data/" + userid + ".js");
                String jsonData = File.ReadAllText(filename);

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                RegData data = serializer.Deserialize<RegData>(jsonData);

                name.Text = data.name;
                Userid.Text = userid;
                userName.Text = data.userName;
                password.Text = data.password;
                userProfile.Text = data.userProfile;
                state.Text = data.state;
                politic.Text = data.politic;
                foreach (string interest in data.interests)
                {
                    interests.Text += interest+",";
                }
                String imageurl = "~/User_Images/" + userid + ".jpg";
                Image.ImageUrl = imageurl;
            }
            catch (IOException exn) {
                Response.Redirect("Error.aspx?userid=" + userid + "&errid=lookup");
            }
        }
        else {
            Response.Redirect("Login.aspx");
        }


        /*
        HttpCookie cookie = Request.Cookies.Get("Registration");
        if (cookie != null)
        {
            name.Text = cookie["name"];
            userName.Text = cookie["userName"];
            password.Text = cookie["password"];
            userProfile.Text = cookie["userProfile"];
            state.Text = cookie["state"];
            politic.Text = cookie["politic"];
            interests.Text = cookie["interests"];
        }
        else {
            name.Text = "<Undefined name>";
            userName.Text = "<Undefined user name>";
            password.Text = "<Undefined password>";
            userProfile.Text = "<Undefined user profile>";
            state.Text = "<Undefined state>";
            politic.Text = "<Undefined politic>";
            interests.Text = "<Undefined interests>";
        }
         * */
    }

    /*protected void Page_PreInit(object sender, EventArgs e) {
        HttpCookie cookie = Request.Cookies.Get("Registration");
        if (cookie != null && cookie["ADA"] == "true")
            Page.Theme = "ADA";
    }*/
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