<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Contacts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
   
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:BoundField DataField="WhenAdd" HeaderText="WhenAdd" SortExpression="WhenAdd" />
    </Columns>
</asp:GridView>
   
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ContactsConnectionString %>" SelectCommand="SELECT Person.name, Email.Email, Phone.Phone, Person.WhenAdd FROM Phone RIGHT OUTER JOIN PhoneRealtions ON Phone.PhoneID = PhoneRealtions.PhoneID FULL OUTER JOIN Person ON PhoneRealtions.PersonID = Person.PersonID FULL OUTER JOIN Email ON Person.PersonID = Email.PersonID"></asp:SqlDataSource>
</asp:Content>

