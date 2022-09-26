<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="4.aspx.cs" Inherits="EverestVideoLibrary._4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        margin-left: 130px;
            margin-top: 42px;
        }
        .auto-style2 {
            margin-left: 520px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="List of all DVDs"></asp:Label>
    </p>

    <div style="margin-left: 60px">

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="dvd_id,cast_id" DataSourceID="SqlDataSource1" Width="931px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style1" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" ReadOnly="True" SortExpression="dvd_id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
                <asp:BoundField DataField="producer" HeaderText="producer" SortExpression="producer" />
                <asp:BoundField DataField="dateReleased" HeaderText="dateReleased" SortExpression="dateReleased" />
                <asp:BoundField DataField="cast_id" HeaderText="cast_id" ReadOnly="True" SortExpression="cast_id" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT DvdDetails.dvd_id, DvdDetails.title, DvdDetails.studio, DvdDetails.producer, DvdDetails.dateReleased, Cast.cast_id, Cast.first_name, Cast.last_name FROM DvdDetails INNER JOIN Cast ON DvdDetails.dvd_id = Cast.dvd_id ORDER BY Cast.last_name"></asp:SqlDataSource>

    </div>


    <br />
    <br />
    <br />
    <br />
</asp:Content>
