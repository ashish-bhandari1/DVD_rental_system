<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="8.aspx.cs" Inherits="EverestVideoLibrary._8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 300px;
        }
        .auto-style3 {
            margin-left: 143px;
        }
        .auto-style4 {
            margin-left: 460px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style4">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Members with Total Loan"></asp:Label>
    </p>

        <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mem_id" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black" Width="1083px" CssClass="auto-style3">
            <Columns>
                <asp:BoundField DataField="mem_id" HeaderText="mem_id" ReadOnly="True" SortExpression="mem_id" InsertVisible="False" />
                <asp:BoundField DataField="mem_firstname" HeaderText="mem_firstname" SortExpression="mem_firstname" />
                <asp:BoundField DataField="mem_lastname" HeaderText="mem_lastname" SortExpression="mem_lastname" />
                <asp:BoundField DataField="mem_age" HeaderText="mem_age" SortExpression="mem_age" />
                <asp:BoundField DataField="mem_phone" HeaderText="mem_phone" SortExpression="mem_phone" />
                <asp:BoundField DataField="mem_address" HeaderText="mem_address" SortExpression="mem_address" />
                <asp:BoundField DataField="Total Dvd on loan" HeaderText="Total Dvd on loan" ReadOnly="True" SortExpression="Total Dvd on loan" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT Members_1.mem_id, Members_1.mem_firstname, Members_1.mem_lastname, Members_1.mem_age, Members_1.mem_phone, Members_1.mem_address, (SELECT COUNT(mem_id) AS Expr1 FROM Loan WHERE (mem_id = Members_1.mem_id)) AS [Total Dvd on loan] FROM Loan AS Loan_1 INNER JOIN Members AS Members_1 ON Loan_1.mem_id = Members_1.mem_id INNER JOIN MemberCategory ON Members_1.mem_category_id = MemberCategory.mem_category_id"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <br />
    <br />
</asp:Content>
