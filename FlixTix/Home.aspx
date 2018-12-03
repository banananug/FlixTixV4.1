<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
        .auto-style2 {
            font-size: 100pt;
            color: #FFFFCC;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   
    <div class="bgimage strech">
    <div class="container">
        <div class="jumbotron text-center">
            <span class="auto-style2">FlixTix</span><p class="auto-style1">
                The leading Ticketing Software in the world.
            </p>
        </div>
    </div>
        <div class="container">
        <div class="payPanel text-center">
            <h3 class="auto-style1">Welcome</h3>
            <asp:Label id="lbl_txtUserName" AssociatedControlId="txtUserName" Text="Username" runat="server" CssClass="auto-style1" />
            <asp:TextBox ID="txtUserName" CssClass="bigBorder" runat="server"></asp:TextBox>
            <br />
            <asp:Label id="lbl_txtPassword" AssociatedControlId="txtUserPass" Text="Password" runat="server" CssClass="auto-style1" />
            <asp:TextBox ID="txtUserPass" CssClass="bigBorder" runat="server"></asp:TextBox>
            <br />
        <asp:Button CssClass="btn btn-primary btn-lg bigBorder" ID="btnEnter" runat="server" Text="Enter" OnClick="btnEnter_Click" />
            <br />
            <br />
        <asp:Button CssClass="btn btn-primary btn-lg bigBorder" ID="btnSignUp" runat="server" Text="Sign-Up" OnClick="btnSignUp_Click" />
        </div></div>
</asp:Content>

