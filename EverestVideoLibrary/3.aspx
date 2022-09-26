<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="3.aspx.cs" Inherits="EverestVideoLibrary._3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 102px;
        }
        .auto-style2 {
            margin-left: 440px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DVD loaned by Member in last 31 days"></asp:Label>
    </p>

    <div style="height: 70px; margin-left: 508px; margin-right: 536px; margin-top: 50px; width: 573px;">

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="mem_lastname" DataValueField="mem_lastname" Height="30px" Width="205px">
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [mem_id], [mem_firstname], [mem_lastname] FROM [Members]"></asp:SqlDataSource>

    </div>
    <div style="margin-left: 80px">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="828px" CssClass="auto-style1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="copy_name" HeaderText="copy_name" SortExpression="copy_name" />
                <asp:BoundField DataField="loan_id" HeaderText="loan_id" SortExpression="loan_id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
                <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                <asp:BoundField DataField="mem_id" HeaderText="mem_id" SortExpression="mem_id" InsertVisible="False" ReadOnly="True" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT DvdDetails.title, DvdCopies.copy_name, Loan.loan_id, Loan.loan_date, Loan.due_date, Members.mem_id, Members.mem_firstname, Members.mem_lastname FROM DvdDetails INNER JOIN DvdCopies ON DvdDetails.dvd_id = DvdCopies.dvd_id INNER JOIN Loan ON DvdCopies.copy_id = Loan.copy_id INNER JOIN Members ON Loan.mem_id = Members.mem_id WHERE (Members.mem_lastname = @mem_lastname) AND (DATEDIFF(day, Loan.loan_date, GETDATE()) BETWEEN '0' AND '31')">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="mem_lastname" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

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
</asp:Content>
