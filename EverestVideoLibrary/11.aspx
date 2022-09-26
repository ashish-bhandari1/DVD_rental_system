<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="11.aspx.cs" Inherits="EverestVideoLibrary._11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 216px;
        }
        .auto-style2 {
            margin-left: 520px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p class="auto-style2">
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="DVDs currently on loan."></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="auto-style1" Width="900px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />
                <asp:BoundField DataField="mem_firstname" HeaderText="mem_firstname" SortExpression="mem_firstname" />
                <asp:BoundField DataField="mem_lastname" HeaderText="mem_lastname" SortExpression="mem_lastname" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT Loan.loan_date, DvdDetails.title, Loan.copy_id, Members.mem_firstname, Members.mem_lastname FROM Members INNER JOIN Loan ON Members.mem_id = Loan.mem_id INNER JOIN DvdCopies ON Loan.copy_id = DvdCopies.copy_id INNER JOIN DvdDetails ON DvdCopies.dvd_id = DvdDetails.dvd_id WHERE (Loan.return_date IS NULL) ORDER BY Loan.loan_date"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
