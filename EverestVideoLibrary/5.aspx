<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="5.aspx.cs" Inherits="EverestVideoLibrary._5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 360px;
        }
        .auto-style2 {
            margin-left: 480px;
        }
        .auto-style3 {
            height: 60px;
            width: 573px;
            margin-top: 26px;
        }
        .auto-style4 {
            margin-top: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Loan Record of DVD Copies"></asp:Label>
    </p>

    <div style="margin-left: 508px; margin-right: 536px; " class="auto-style3">
        <asp:DropDownList ID="DropDownCopyNum" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="copy_id" DataValueField="copy_id" Height="30px" Width="210px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [copy_id], [copy_name], [dvd_id] FROM [DvdCopies]"></asp:SqlDataSource>
        <br />
    </div>
    <div style="margin-left: 60px">
        <asp:GridView ID="GridViewCopyMem" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="79px" style="margin-left: 50px;" Width="1100px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" CssClass="auto-style4" >
            <Columns>
                <asp:BoundField DataField="loan_id" HeaderText="loan_id" SortExpression="loan_id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
                <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                <asp:BoundField DataField="return_date" HeaderText="return_date" SortExpression="return_date" />
                <asp:BoundField DataField="mem_id" HeaderText="mem_id" SortExpression="mem_id" />
                <asp:BoundField DataField="mem_firstname" HeaderText="mem_firstname" SortExpression="mem_firstname" />
                <asp:BoundField DataField="mem_lastname" HeaderText="mem_lastname" SortExpression="mem_lastname" />
                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" SortExpression="dvd_id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />

                <asp:BoundField DataField="copy_name" HeaderText="copy_name" SortExpression="copy_name" />

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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT Loan.loan_id, Loan.loan_date, Loan.due_date, Loan.return_date, Loan.mem_id, Members.mem_firstname, Members.mem_lastname, DvdDetails.dvd_id, DvdDetails.title, Loan.copy_id, DvdCopies.copy_name FROM Loan INNER JOIN Members ON Loan.mem_id = Members.mem_id INNER JOIN DvdCopies ON Loan.copy_id = DvdCopies.copy_id INNER JOIN DvdDetails ON DvdCopies.dvd_id = DvdDetails.dvd_id WHERE (Loan.copy_id = @copy_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownCopyNum" Name="copy_id" PropertyName="SelectedValue" Type="Int32" />
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
</asp:Content>
