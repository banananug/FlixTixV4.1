<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
        .auto-style2 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bgimage strech">
    <div class="jumbotron strech text-center">
        <span style="font-size: 40pt;" class="auto-style1">Pay For Your Tickets</span>
        <div class="payPanel">
            <div id="lblTransactionInfo" runat="server" text-color="white"></div>
            <span class="auto-style1">Select Card Type:
                        </span>
                        <asp:DropDownList ID="DD_CardType" runat="server" CssClass="auto-style2">
                            <asp:ListItem>VISA</asp:ListItem>
                            <asp:ListItem>MASTERCARD</asp:ListItem>
                            <asp:ListItem>AMERICAN EXPRESS</asp:ListItem>
                            <asp:ListItem>DEBIT CARD</asp:ListItem>
                        </asp:DropDownList>
            <br class="auto-style1" />
            <span class="auto-style1">Credit Card Number: 
                        <br />
            </span>
            <asp:TextBox id="TxtCardNumber" runat="server" Height="37px" Width="188px" CssClass="auto-style2"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator3" 
                            runat="server"   
                            ControlToValidate="TxtCardNumber" Display="Dynamic">
                <span style="color:red;">Card number required</span>
            </asp:RequiredFieldValidator>
            <br />
            <span class="auto-style1">Phone Number:
                        <br />
            </span>
            <asp:TextBox ID="txtPhoneNumber" runat="server" Height="37px" Width="188px" CssClass="auto-style2"></asp:TextBox>
            <span class="auto-style1">
            <asp:RequiredFieldValidator id="RequiredFieldValidator1"  
                            runat="server" Width="12px"   Display="Dynamic"
                            ControlToValidate="txtPhoneNumber"><span style="color:red;">Phone number required</span></asp:RequiredFieldValidator>
            <br />
           
            <br />
            &nbsp;<br />
            </span>
            <div>
                <asp:Button CssClass="btn btn-lg btn-success" ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" />
            </div>
        </div>
    </div>
        </div>
</asp:Content>

