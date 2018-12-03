<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style1 {
            width: 1178px;
            text-align: right;
        }
        .auto-style2 {
            width: 1178px;
            height: 50px;
            text-align: right;
        }
        .auto-style3 {
            height: 50px;
            width: 1209px;
        }
        .auto-style4 {
            width: 1178px;
            height: 42px;
            text-align: right;
        }
        .auto-style5 {
            height: 42px;
            width: 1209px;
        }
        .auto-style6 {
            width: 1178px;
            height: 26px;
            text-align: right;
        }
        .auto-style7 {
            height: 26px;
            width: 1209px;
        }
        .auto-style8 {
            width: 1209px;
        }
        .auto-style9 {
            color: #FFFFFF;
        }
        .auto-style10 {
            font-size: medium;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <div class="bgimage strech">
    <table>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label12" runat="server" Text="First Name" CssClass="auto-style9"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtFirstName0" runat="server" Width="357px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFirstName0" ErrorMessage="First Name required" ForeColor="White" CssClass="auto-style9"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label8" runat="server" Text="Last Name" CssClass="auto-style9"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtLastName0" runat="server" Width="357px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLastName0" ErrorMessage="Last Name required" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label9" runat="server" Text="Email" CssClass="auto-style9"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtEmail0" runat="server" TextMode="Email" Width="357px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail0" ErrorMessage="Email required" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label10" runat="server" Text="Password" CssClass="auto-style9"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPassword3" runat="server" TextMode="Password" Width="357px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPassword3" ErrorMessage="Password required" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label11" runat="server" Text="Repeat Password" CssClass="auto-style9"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtPassword4" runat="server" TextMode="Password" Width="357px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword4" ControlToValidate="txtPassword3" ErrorMessage="Passwords do not match" ForeColor="White"></asp:CompareValidator>
            </td>
        </tr>
    </table>
        <br />
        <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Sign Me Up!" style="height: 27px" CssClass="auto-style10" />
    </div>

</asp:Content>

