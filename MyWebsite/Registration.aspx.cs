using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.IO;
using System.Collections;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imageValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int FileLen = UserImage.PostedFile.ContentLength;
        if (FileLen > 0)
        {
            if (FileLen > 4096 * 1024)
            {
                args.IsValid = false;
                return;
            }

            string FileName = UserImage.FileName;
            if (FileName.ToLower().IndexOf(".jpg") == -1)
            {
                args.IsValid = false;
                return;
            }
        }
        else
        {
            args.IsValid = false;
        }
    }
    
    protected void submit_Click(object sender, EventArgs e)
    {
        if(!IsValid) 
            return;

        ArrayList interest = new ArrayList();
        foreach (ListItem item in interests.Items)
        {
            if (item.Selected)
            {
                interest.Add(item.Text);
            }
        }
        RegData data = new RegData(name.Text, UserName.Text,
                                    password.Text, userProfile.Text,
                                    state.Text, politic.Text, interest,
                                    ChooseADA.Checked);
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        String jsonData = serializer.Serialize(data);

        try
        {
            String filename = Server.MapPath("~/User_Data/" + data.userName + ".js");
            File.WriteAllText(filename, jsonData);

            if (UserImage.HasFile) {
                String imageFilename = Server.MapPath("~/User_Images/" + data.userName + ".jpg");
                UserImage.SaveAs(imageFilename);
            }
            
            Session["userid"] = data.userName;
            Session["ada"] = data.ada;

            Response.Redirect("lookup.aspx");
        }
        catch (IOException exn) {
            Response.Redirect("Error.aspx?userid=" + data.userName + "&errid=registeration");
        }
        /*HttpCookie cookie = new HttpCookie("Registration");
        cookie["name"] = name.Text;
        cookie["userName"] = UserName.Text;
        cookie["password"] = password.Text;
        cookie["userProfile"] = userProfile.Text;
        cookie["state"] = state.SelectedValue;
        cookie["politic"] = politic.SelectedValue;
        foreach (ListItem item in interests.Items)
        {
            if (item.Selected)
            {
                cookie.Values.Add("interests", item.Text);
            }
        }
        if (ChooseADA.Checked)
            cookie["ADA"] = "true";
        else
            cookie["ADA"] = "false";
        cookie.Expires = DateTime.Now.AddMonths(3);
        Response.Cookies.Add(cookie);*/
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        Object isAda = Session["ada"];
        if (isAda != null) {
            Boolean ada = (Boolean)isAda;
            if (ada)
                Page.Theme = "ADA";
        }

        /*HttpCookie cookie = Request.Cookies.Get("Registration");
        if (cookie != null && cookie["ADA"] == "true")
            Page.Theme = "ADA";*/
    }
}