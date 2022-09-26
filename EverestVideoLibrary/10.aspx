<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="10.aspx.cs" Inherits="EverestVideoLibrary._10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 153px;
        }
        .auto-style2 {
            margin-left: 500px;
        }
        .auto-style3 {
            margin-left: 460px;
        }
        .auto-style4 {
            margin-left: 460px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <p>
        <br />
    </p>
    <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="365 days old DVDs"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="dvd_id" DataSourceID="SqlDataSource1" CssClass="auto-style1" Width="1028px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" ReadOnly="True" SortExpression="dvd_id" InsertVisible="False" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
                <asp:BoundField DataField="producer" HeaderText="producer" SortExpression="producer" />
                <asp:BoundField DataField="dateReleased" HeaderText="dateReleased" SortExpression="dateReleased" />
                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                <asp:BoundField DataField="ageRestricted" HeaderText="ageRestricted" SortExpression="ageRestricted" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT dvd_id, title, studio, producer, dateReleased, category, ageRestricted FROM DvdDetails WHERE (DATEDIFF(DAY, CONVERT (datetime, dateReleased, 103), GETDATE()) &gt; 365)"></asp:SqlDataSource>
    </p>
     <p>
         &nbsp;</p>
    <p class="auto-style3">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="dvd_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [dvd_id], [title] FROM [DvdDetails]"></asp:SqlDataSource>
    </p>
    <p class="auto-style4">
        <asp:Button ID="Button1" runat="server" Text="Delete Record" OnClick="Button1_Click" />
    </p>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
