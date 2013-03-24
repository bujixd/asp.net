<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lookup.aspx.cs" Inherits="_Default" Theme="default"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <h2>Lookup</h2>
    <p>
        Name: <asp:Label ID="name" runat="server"></asp:Label>
    </p>
<p>
        userId:<asp:Label ID="Userid" runat="server"></asp:Label>
    </p>
    <p>
        User Name: <asp:Label ID="userName" runat="server"></asp:Label>
    </p>
    <p>
        password: <asp:Label ID="password" runat="server"></asp:Label>
    </p>
     <p>
        user Profile: <asp:Label ID="userProfile" runat="server"></asp:Label>
    </p>
     <p>
        state: <asp:Label ID="state" runat="server"></asp:Label>
    </p>
     <p>
        politic: <asp:Label ID="politic" runat="server"></asp:Label>
    </p>
     <p>
        interests: <asp:Label ID="interests" runat="server"></asp:Label>
    </p>
<p>
        <asp:Image ID="Image" runat="server" />
    </p>
</asp:Content>

