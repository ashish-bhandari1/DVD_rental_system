<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="13.aspx.cs" Inherits="EverestVideoLibrary._13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 146px;
            margin-top: 35px;
        }
        .auto-style2 {
            margin-left: 360px;
        }
        .auto-style3 {
            margin-left: 440px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style3">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DVDs not loaned for last 31 days"></asp:Label>
    </p>

    <div style="margin-left: 60px">
        <asp:GridView ID="GridView1" runat="server" Width="846px" AutoGenerateColumns="False" DataKeyNames="dvd_id,copy_id,loan_id" DataSourceID="SqlDataSource1" CssClass="auto-style1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" InsertVisible="False" ReadOnly="True" SortExpression="dvd_id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="copy_id" HeaderText="copy_id" InsertVisible="False" ReadOnly="True" SortExpression="copy_id" />
                <asp:BoundField DataField="copy_name" HeaderText="copy_name" SortExpression="copy_name" />
                <asp:BoundField DataField="loan_id" HeaderText="loan_id" InsertVisible="False" ReadOnly="True" SortExpression="loan_id" />
                <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT DvdDetails.dvd_id, DvdDetails.title, DvdCopies.copy_id, DvdCopies.copy_name, Loan.loan_id, Loan.loan_date FROM DvdDetails INNER JOIN DvdCopies ON DvdDetails.dvd_id = DvdCopies.dvd_id INNER JOIN Loan ON DvdCopies.copy_id = Loan.copy_id WHERE (DATEDIFF(day, Loan.loan_date, GETDATE()) NOT BETWEEN '0' AND '30')"></asp:SqlDataSource>
    </div>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
