using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = HttpContext.Current.Request.Url.AbsoluteUri;
        String userId = str.Substring(str.LastIndexOf("=")+1);
        try
        {
            String filename = Server.MapPath("~/User_Data/" + userId + ".js");
            String jsonData = File.ReadAllText(filename);

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            RegData data = serializer.Deserialize<RegData>(jsonData);

            name.Text = data.name;
            userid.Text = userId;

            String imageurl = "~/User_Images/" + userId + ".jpg";
            userImage.ImageUrl = imageurl;


        }
        catch (IOException exn)
        {
            Response.Redirect("Error.aspx?userid=" + userId + "&errid=lookup");
        }
    }
}