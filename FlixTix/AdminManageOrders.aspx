<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminManageOrders.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    .auto-style2 {
        font-size: xx-large;
        color: #FFFFFF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="bgimageAdmin strech">
<div />
    <div class="text-center">
    <br />
    <br />
    <br />
        <strong><span class="auto-style2">Manage Orders</span></strong><br />
    <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="946px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="FilmId" HeaderText="FilmId" SortExpression="FilmId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="DateNTime" HeaderText="DateNTime" SortExpression="DateNTime" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlixTixConnectionString %>" SelectCommand="SELECT [Id], [FilmId], [UserId], [DateNTime] FROM [Orders]"></asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" HorizontalAlign="Center" AutoGenerateRows="False" CellPadding="4" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="536px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="FilmId" HeaderText="FilmId" SortExpression="FilmId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="Seats" HeaderText="Seats" SortExpression="Seats" />
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
            <asp:BoundField DataField="DateNTime" HeaderText="DateNTime" SortExpression="DateNTime" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FlixTixConnectionString %>" SelectCommand="SELECT * FROM [Orders] WHERE ([Id] = @Id)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @original_Id AND [FilmId] = @original_FilmId AND [UserId] = @original_UserId AND (([Seats] = @original_Seats) OR ([Seats] IS NULL AND @original_Seats IS NULL)) AND (([Payment] = @original_Payment) OR ([Payment] IS NULL AND @original_Payment IS NULL)) AND (([DateNTime] = @original_DateNTime) OR ([DateNTime] IS NULL AND @original_DateNTime IS NULL))" InsertCommand="INSERT INTO [Orders] ([FilmId], [UserId], [Seats], [Payment], [DateNTime]) VALUES (@FilmId, @UserId, @Seats, @Payment, @DateNTime)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Orders] SET [FilmId] = @FilmId, [UserId] = @UserId, [Seats] = @Seats, [Payment] = @Payment, [DateNTime] = @DateNTime WHERE [Id] = @original_Id AND [FilmId] = @original_FilmId AND [UserId] = @original_UserId AND (([Seats] = @original_Seats) OR ([Seats] IS NULL AND @original_Seats IS NULL)) AND (([Payment] = @original_Payment) OR ([Payment] IS NULL AND @original_Payment IS NULL)) AND (([DateNTime] = @original_DateNTime) OR ([DateNTime] IS NULL AND @original_DateNTime IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_FilmId" Type="Int16" />
            <asp:Parameter Name="original_UserId" Type="Int16" />
            <asp:Parameter Name="original_Seats" Type="String" />
            <asp:Parameter Name="original_Payment" Type="String" />
            <asp:Parameter Name="original_DateNTime" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FilmId" Type="Int16" />
            <asp:Parameter Name="UserId" Type="Int16" />
            <asp:Parameter Name="Seats" Type="String" />
            <asp:Parameter Name="Payment" Type="String" />
            <asp:Parameter Name="DateNTime" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="Id" PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FilmId" Type="Int16" />
            <asp:Parameter Name="UserId" Type="Int16" />
            <asp:Parameter Name="Seats" Type="String" />
            <asp:Parameter Name="Payment" Type="String" />
            <asp:Parameter Name="DateNTime" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_FilmId" Type="Int16" />
            <asp:Parameter Name="original_UserId" Type="Int16" />
            <asp:Parameter Name="original_Seats" Type="String" />
            <asp:Parameter Name="original_Payment" Type="String" />
            <asp:Parameter Name="original_DateNTime" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>

