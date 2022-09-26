<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="EverestVideoLibrary.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 0px;
        }
        .auto-style3 {
            margin-left: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-6" style="left: 320px; top: 15px; width: 1179px">

    <p class="auto-style3">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Manage Users"></asp:Label>
    </p>


                <asp:Label runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFullName"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Designation"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDesignation"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="User ID"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtUserID"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Password"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword"></asp:TextBox>
                <br />


                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            

                    <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="UserID" DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="auto-style2">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [UserID] = @original_UserID AND [FullName] = @original_FullName AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL)) AND [Password] = @original_Password" InsertCommand="INSERT INTO [User] ([FullName], [Designation], [UserID], [Password]) VALUES (@FullName, @Designation, @UserID, @Password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [FullName] = @FullName, [Designation] = @Designation, [Password] = @Password WHERE [UserID] = @original_UserID AND [FullName] = @original_FullName AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL)) AND [Password] = @original_Password">
                    <DeleteParameters>
                        <asp:Parameter Name="original_UserID" Type="String" />
                        <asp:Parameter Name="original_FullName" Type="String" />
                        <asp:Parameter Name="original_Designation" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>

                        <asp:ControlParameter ControlID="txtFullName" Name="FullName" Type="String" />
                        <asp:ControlParameter ControlID="txtDesignation" Name="Designation" Type="String" />
                        <asp:ControlParameter ControlID="txtUserID" Name="UserID" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="Password" Type="String" />

                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="Designation" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="original_UserID" Type="String" />
                        <asp:Parameter Name="original_FullName" Type="String" />
                        <asp:Parameter Name="original_Designation" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

                    <br />
                <br />
                <br />
                <br />
        </div>

</asp:Content>
