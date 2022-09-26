<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="12.aspx.cs" Inherits="EverestVideoLibrary._12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 560px;
        }
        .auto-style2 {
            margin-left: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
        <br />
    </p>
    <p class="auto-style1">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Loan details since last loan"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" CssClass="auto-style2" Width="895px">
            <Columns>
                <asp:BoundField DataField="mem_firstname" HeaderText="mem_firstname" SortExpression="mem_firstname" />
                <asp:BoundField DataField="mem_lastname" HeaderText="mem_lastname" SortExpression="mem_lastname" />
                <asp:BoundField DataField="mem_address" HeaderText="mem_address" SortExpression="mem_address" />
                <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="DaysSinceLastLoan" HeaderText="DaysSinceLastLoan" ReadOnly="True" SortExpression="DaysSinceLastLoan" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT Members.mem_firstname, Members.mem_lastname, Members.mem_address, Loan.loan_date, DvdDetails.title, DATEDIFF(DAY, Loan.loan_date, GETDATE()) AS DaysSinceLastLoan FROM Members INNER JOIN Loan ON Members.mem_id = Loan.mem_id INNER JOIN DvdCopies ON Loan.copy_id = DvdCopies.copy_id INNER JOIN DvdDetails ON DvdCopies.dvd_id = DvdDetails.dvd_id WHERE (DATEDIFF(DAY, Loan.loan_date, GETDATE()) &gt; 31)"></asp:SqlDataSource>
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
    <br />
</asp:Content>
