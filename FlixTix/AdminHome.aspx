<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
    .auto-style2 {
        color: #FFFFFF;
        text-align: center;
        font-size: xx-large;
    }
    .auto-style3 {
        font-size: large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="bgimageAdmin strech">
    <p>
    <a href="Home.aspx">http://localho</a></p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p class="auto-style2">
    <strong>Welcome to the Admin Center!</strong></p>
<p>
    &nbsp;</p>
<p class="text-center">
    <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Height="60px" OnClick="Button1_Click" Text="Edit Users" Width="190px" BackColor="#FF6600" />
</p>
<p>
    &nbsp;</p>
<p class="text-center">
    <asp:Button ID="Button2" runat="server" CssClass="auto-style1" Height="60px" OnClick="Button2_Click" Text="Edit Movies" Width="190px" BackColor="#FF6600" />
</p>
    <p class="text-center">
        &nbsp;</p>
    <p class="text-center">
        <asp:Button ID="Button3" runat="server" BackColor="#FF6600" CssClass="auto-style3" Height="60px" OnClick="Button3_Click" Text="Manage Orders" Width="190px" />
</p>
</div>
</asp:Content>

