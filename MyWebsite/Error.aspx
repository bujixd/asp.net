<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
<h2>Error</h2>
<p>userid: 
        <asp:Label ID="Userid" runat="server" ></asp:Label></p>
    <p>Message:
        <asp:Label ID="message" runat="server" ></asp:Label>
    </p>
</asp:Content>

