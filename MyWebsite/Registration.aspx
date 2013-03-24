<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" Theme="default"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <h2>Registeration</h2>
    
    <p>
                
                name:<asp:TextBox ID="name" runat="server"  Width="233px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameRequired" runat="server" 
                    ControlToValidate="name" Display="Dynamic" 
                    ErrorMessage="please provide your name" ForeColor="Red"></asp:RequiredFieldValidator>
                
            </p>
<p>
                
                <asp:FileUpload ID="UserImage" runat="server" />
                
                <asp:CustomValidator ID="imageValidator" runat="server" ControlToValidate="UserImage" Display="Dynamic" EnableTheming="True" ErrorMessage="please provide .jpg file and do not over 4M." ForeColor="#FF3300" OnServerValidate="imageValidator_ServerValidate"></asp:CustomValidator>
                
            </p>
            <p>
                
                user name:<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                    ControlToValidate="UserName" Display="Dynamic" 
                    ErrorMessage="Please provide user name" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="UserNameRegularExpression" runat="server" 
                    ControlToValidate="UserName" 
                    ErrorMessage="please provide 10 characters name made up of alphabetic and numberic characters, within the first character required to be alphabetic" 
                    ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]\w{9}$" Display="Dynamic"></asp:RegularExpressionValidator>
                
            </p>
            <p>
                
                password:<asp:TextBox ID="password" runat="server" MaxLength="10" 
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordRequired" runat="server" 
                    ControlToValidate="password" Display="Dynamic" 
                    ErrorMessage="please provide password" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="passwordValid" runat="server" 
                    ControlToValidate="password" Display="Dynamic" 
                    ErrorMessage="Please provide password no less than 4 characters and no longer than 10 characters" 
                    ForeColor="#FF3300" ValidationExpression="^\w{4,10}$"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                    ControlToCompare="UserName" ControlToValidate="password" Display="Dynamic" 
                    ErrorMessage="Please do not use your user name as your password" 
                    ForeColor="#FF3300" Operator="NotEqual"></asp:CompareValidator>
                
            </p>
            <p>
                
                Password confirmation:<asp:TextBox ID="passwordConfirm" runat="server" 
                    MaxLength="10" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordConfirmRequired" runat="server" 
                    ControlToValidate="passwordConfirm" Display="Dynamic" 
                    ErrorMessage="Please confirm your password" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="password" ControlToValidate="passwordConfirm" 
                    Display="Dynamic" ErrorMessage="Please input same password" 
                    ForeColor="#FF3300"></asp:CompareValidator>
                
            </p>
            <p>
                
                User profile:<br />
                <asp:TextBox ID="userProfile" runat="server" Height="62px" 
                    TextMode="MultiLine" Width="539px"></asp:TextBox>
                
            </p>
    <p>
                
                state:<asp:DropDownList ID="state" runat="server">
                    <asp:ListItem Value="xx">--please select a state--</asp:ListItem>
                    <asp:ListItem>New Jersey</asp:ListItem>
                    <asp:ListItem>New York</asp:ListItem>
                    <asp:ListItem>shanghai</asp:ListItem>
                    <asp:ListItem>beijing</asp:ListItem>
                    <asp:ListItem>boston</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="stateRequired" runat="server" Display="Dynamic" 
                    ErrorMessage="please select a state" ForeColor="#FF3300" InitialValue="xx" 
                    ControlToValidate="state"></asp:RequiredFieldValidator>
                
            </p>
    <p style="margin-left: 0px">
                politic:
                <asp:RadioButtonList runat="server" ID="politic">
                    <asp:ListItem>independent</asp:ListItem>
                    <asp:ListItem>Democratic</asp:ListItem>
                    <asp:ListItem>Republican</asp:ListItem>
                </asp:RadioButtonList>
                
            </p>
            <p>
                
                Topic of interests:<asp:CheckBoxList ID="interests" runat="server" 
                    Width="155px">
                    <asp:ListItem Value="s">soccer</asp:ListItem>
                    <asp:ListItem>baskerball</asp:ListItem>
                    <asp:ListItem>video game</asp:ListItem>
                    <asp:ListItem>programming</asp:ListItem>
                    <asp:ListItem>party</asp:ListItem>
                    <asp:ListItem>shopping</asp:ListItem>
                </asp:CheckBoxList>
                
            </p>
    <p>
                
                Visually impaired: <asp:CheckBox ID="ChooseADA" runat="server" />
                
            </p>
            <p dir="ltr">
                
                <asp:Button ID="submit" runat="server" Text="submit" Font-Bold="True" 
                    onclick="submit_Click" />
                
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" />
</asp:Content>

