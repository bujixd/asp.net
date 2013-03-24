<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Welcome3.aspx.cs" Inherits="Welcome2"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">

    <script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
    </script>

    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/WebServices/UserInfo.asmx" />
        </Services>
    </asp:ScriptManagerProxy>
    
    <p>
        <asp:HyperLink ID="UserLink" ClientIDMode="Static" runat="server" ImageUrl="User_Images/invisiable.jpg" NavigateUrl="User_Images/invisiable.jpg">User Images</asp:HyperLink>
    
        <script type="text/javascript">
            $(document).ready(pageLoad);
            function pageLoad() {
                setTimeout(changeImage, 5000);
            }

            var Counter = 0;
            function changeImage() {
                UserInfo.GetImageUserid(Counter++, WS_Callback);
            }

            var ajaxQueue = $({});

            function WS_Callback(userid) {
                //alert("Userid: " + userid);
                $("#UserLink").attr("href", "Details.aspx?user=" + userid);
                $("#UserLink img").attr("src","User_Images/"+ userid + ".jpg");

                ajaxQueue.delay(5000);
                ajaxQueue.queue(function (next) {
                    changeImage();
                    next()
                });
            }


        </script>
    </p>
</asp:Content>

