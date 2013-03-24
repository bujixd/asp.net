<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Companies.aspx.cs" Inherits="Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
        <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
        <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        <asp:BoundField DataField="CotactsNumbers" HeaderText="CotactsNumbers" ReadOnly="True" SortExpression="CotactsNumbers" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ContactsConnectionString %>" SelectCommand="SELECT Adress.Company, Adress.Street, Adress.City, Adress.Zip, Adress.State, COUNT(Person.name) AS CotactsNumbers FROM Adress INNER JOIN Person ON Adress.AddressID = Person.AddressID GROUP BY Adress.Company, Adress.Street, Adress.City, Adress.Zip, Adress.State"></asp:SqlDataSource>
</asp:Content>

