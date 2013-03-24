<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Welcome1.aspx.cs" Inherits="Welcome1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <p>
        <asp:Timer ID="ImageTimer" runat="server" Interval="5000" OnTick="ImageTimer_Tick">
        </asp:Timer>
        <asp:HyperLink ID="UserLink" runat="server">User Images</asp:HyperLink>
    </p>
</asp:Content>

