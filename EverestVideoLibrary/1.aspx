<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="1.aspx.cs" Inherits="EverestVideoLibrary._1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 470px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Available DVDs of Actors"></asp:Label>
    </p>


    <div style="height: 70px; margin-left: 508px; margin-right: 536px; margin-top: 50px; width: 573px;">
    <asp:DropDownList ID="actor1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="last_name" DataValueField="last_name" Height="30px" Width="210px">
    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [cast_id], [last_name], [dvd_id] FROM [Cast]"></asp:SqlDataSource>
    </div>
    <br />
    <div style="margin-left: 80px">
    <asp:GridView ID="grd1" runat="server" AutoGenerateColumns="False" DataKeyNames="dvd_id" DataSourceID="SqlDataSource2" Width="829px" style="margin-top: 7px; margin-left: 189px;" AllowSorting="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" ReadOnly="True" SortExpression="dvd_id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
            <asp:BoundField DataField="dateReleased" HeaderText="dateReleased" SortExpression="dateReleased" />
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT DvdDetails.dvd_id, DvdDetails.title, DvdDetails.studio, DvdDetails.dateReleased, DvdDetails.category, Cast.first_name, Cast.last_name FROM DvdDetails INNER JOIN Cast ON DvdDetails.dvd_id = Cast.dvd_id WHERE (Cast.last_name = @last_name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="actor1" Name="last_name" PropertyName="SelectedValue" />
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
</asp:Content>
