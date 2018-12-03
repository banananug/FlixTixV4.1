<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminEditMovies.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            color: #FFFFFF;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="bgimageAdmin strech">
    <div class="text-center">
        <br />
        <br />
        <br />
        <span class="auto-style2"><strong>Edit Movies</strong></span><br />
    </div>
    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True" Width="530px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FlixTixConnectionString %>" DeleteCommand="DELETE FROM [Films] WHERE [Id] = @original_Id AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL))" InsertCommand="INSERT INTO [Films] ([Title]) VALUES (@Title)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Title] FROM [Films]" UpdateCommand="UPDATE [Films] SET [Title] = @Title WHERE [Id] = @original_Id AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_Title" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_Title" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" HorizontalAlign="Center" AutoGenerateRows="False" CellPadding="4" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="529px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Plot" HeaderText="Plot" SortExpression="Plot" />
            <asp:BoundField DataField="Poster" HeaderText="Poster" SortExpression="Poster" />
            <asp:BoundField DataField="Time1" HeaderText="Time1" SortExpression="Time1" />
            <asp:BoundField DataField="Time2" HeaderText="Time2" SortExpression="Time2" />
            <asp:BoundField DataField="Time3" HeaderText="Time3" SortExpression="Time3" />
            <asp:BoundField DataField="Time4" HeaderText="Time4" SortExpression="Time4" />
            <asp:BoundField DataField="Time5" HeaderText="Time5" SortExpression="Time5" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FlixTixConnectionString %>" DeleteCommand="DELETE FROM [Films] WHERE [Id] = @original_Id AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Plot] = @original_Plot) OR ([Plot] IS NULL AND @original_Plot IS NULL)) AND (([Poster] = @original_Poster) OR ([Poster] IS NULL AND @original_Poster IS NULL)) AND (([Time1] = @original_Time1) OR ([Time1] IS NULL AND @original_Time1 IS NULL)) AND (([Time2] = @original_Time2) OR ([Time2] IS NULL AND @original_Time2 IS NULL)) AND (([Time3] = @original_Time3) OR ([Time3] IS NULL AND @original_Time3 IS NULL)) AND (([Time4] = @original_Time4) OR ([Time4] IS NULL AND @original_Time4 IS NULL)) AND (([Time5] = @original_Time5) OR ([Time5] IS NULL AND @original_Time5 IS NULL))" InsertCommand="INSERT INTO [Films] ([Title], [Plot], [Poster], [Time1], [Time2], [Time3], [Time4], [Time5]) VALUES (@Title, @Plot, @Poster, @Time1, @Time2, @Time3, @Time4, @Time5)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Films] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Films] SET [Title] = @Title, [Plot] = @Plot, [Poster] = @Poster, [Time1] = @Time1, [Time2] = @Time2, [Time3] = @Time3, [Time4] = @Time4, [Time5] = @Time5 WHERE [Id] = @original_Id AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Plot] = @original_Plot) OR ([Plot] IS NULL AND @original_Plot IS NULL)) AND (([Poster] = @original_Poster) OR ([Poster] IS NULL AND @original_Poster IS NULL)) AND (([Time1] = @original_Time1) OR ([Time1] IS NULL AND @original_Time1 IS NULL)) AND (([Time2] = @original_Time2) OR ([Time2] IS NULL AND @original_Time2 IS NULL)) AND (([Time3] = @original_Time3) OR ([Time3] IS NULL AND @original_Time3 IS NULL)) AND (([Time4] = @original_Time4) OR ([Time4] IS NULL AND @original_Time4 IS NULL)) AND (([Time5] = @original_Time5) OR ([Time5] IS NULL AND @original_Time5 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Plot" Type="String" />
            <asp:Parameter Name="original_Poster" Type="String" />
            <asp:Parameter Name="original_Time1" Type="String" />
            <asp:Parameter Name="original_Time2" Type="String" />
            <asp:Parameter Name="original_Time3" Type="String" />
            <asp:Parameter Name="original_Time4" Type="String" />
            <asp:Parameter Name="original_Time5" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Poster" Type="String" />
            <asp:Parameter Name="Time1" Type="String" />
            <asp:Parameter Name="Time2" Type="String" />
            <asp:Parameter Name="Time3" Type="String" />
            <asp:Parameter Name="Time4" Type="String" />
            <asp:Parameter Name="Time5" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="Id" PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Poster" Type="String" />
            <asp:Parameter Name="Time1" Type="String" />
            <asp:Parameter Name="Time2" Type="String" />
            <asp:Parameter Name="Time3" Type="String" />
            <asp:Parameter Name="Time4" Type="String" />
            <asp:Parameter Name="Time5" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int16" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Plot" Type="String" />
            <asp:Parameter Name="original_Poster" Type="String" />
            <asp:Parameter Name="original_Time1" Type="String" />
            <asp:Parameter Name="original_Time2" Type="String" />
            <asp:Parameter Name="original_Time3" Type="String" />
            <asp:Parameter Name="original_Time4" Type="String" />
            <asp:Parameter Name="original_Time5" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

