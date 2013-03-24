<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <p>
    name:<asp:Label ID="name" runat="server"></asp:Label>
</p>
<p>
    userID:<asp:Label ID="userid" runat="server"></asp:Label>
</p>
<p>
    <asp:Image ID="userImage" runat="server" />
</p>
</asp:Content>

