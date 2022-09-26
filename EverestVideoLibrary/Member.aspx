<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="EverestVideoLibrary.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #212529;
            border-collapse: collapse;
            margin-left: 179px;
            margin-bottom: 1rem;
        }
        .auto-style3 {
            margin-left: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>  &nbsp;</p>
    <p class="auto-style3">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Member Details Form"></asp:Label>
    </p>

            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">
                <asp:Label runat="server" Text="First Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstName"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="Last Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLastName"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="Age"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAge"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="Phone"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="Address"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAddress"></asp:TextBox>
                <br />
                <asp:Label runat="server" Text="Member Category ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownMemCatID" runat="server" DataSourceID="SqlDataSource1" DataTextField="mem_category_name" DataValueField="mem_category_id" Height="30px" Width="205px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [mem_category_id], [mem_category_name] FROM [MemberCategory]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
                <br />
                <br />
                <br />
            </div>
                <div>
                    <asp:GridView runat="server" ID="grdDVD" CssClass="auto-style1" AutoGenerateColumns="False" Height="143px" AllowSorting="True" DataKeyNames="mem_id" DataSourceID="SqlDataSource2" Width="919px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="mem_id" HeaderText="mem_id" ReadOnly="True" SortExpression="mem_id" InsertVisible="False" />
                            <asp:BoundField DataField="mem_firstname" HeaderText="mem_firstname" SortExpression="mem_firstname" />
                            <asp:BoundField DataField="mem_lastname" HeaderText="mem_lastname" SortExpression="mem_lastname" />
                            <asp:BoundField DataField="mem_age" HeaderText="mem_age" SortExpression="mem_age" />
                            <asp:BoundField DataField="mem_phone" HeaderText="mem_phone" SortExpression="mem_phone" />
                            <asp:BoundField DataField="mem_address" HeaderText="mem_address" SortExpression="mem_address" />
                            <asp:BoundField DataField="mem_category_id" HeaderText="mem_category_id" SortExpression="mem_category_id" />
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
        
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Members] WHERE [mem_id] = @original_mem_id AND [mem_firstname] = @original_mem_firstname AND [mem_lastname] = @original_mem_lastname AND [mem_age] = @original_mem_age AND (([mem_phone] = @original_mem_phone) OR ([mem_phone] IS NULL AND @original_mem_phone IS NULL)) AND (([mem_address] = @original_mem_address) OR ([mem_address] IS NULL AND @original_mem_address IS NULL)) AND [mem_category_id] = @original_mem_category_id" InsertCommand="INSERT INTO [Members] ([mem_firstname], [mem_lastname], [mem_age], [mem_phone], [mem_address], [mem_category_id]) VALUES (@mem_firstname, @mem_lastname, @mem_age, @mem_phone, @mem_address, @mem_category_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Members]" UpdateCommand="UPDATE [Members] SET [mem_firstname] = @mem_firstname, [mem_lastname] = @mem_lastname, [mem_age] = @mem_age, [mem_phone] = @mem_phone, [mem_address] = @mem_address, [mem_category_id] = @mem_category_id WHERE [mem_id] = @original_mem_id AND [mem_firstname] = @original_mem_firstname AND [mem_lastname] = @original_mem_lastname AND [mem_age] = @original_mem_age AND (([mem_phone] = @original_mem_phone) OR ([mem_phone] IS NULL AND @original_mem_phone IS NULL)) AND (([mem_address] = @original_mem_address) OR ([mem_address] IS NULL AND @original_mem_address IS NULL)) AND [mem_category_id] = @original_mem_category_id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_mem_id" Type="Int32" />
                        <asp:Parameter Name="original_mem_firstname" Type="String" />
                        <asp:Parameter Name="original_mem_lastname" Type="String" />
                        <asp:Parameter Name="original_mem_age" Type="Int32" />
                        <asp:Parameter Name="original_mem_phone" Type="String" />
                        <asp:Parameter Name="original_mem_address" Type="String" />
                        <asp:Parameter Name="original_mem_category_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtFirstName" Name="mem_firstname" Type="String" />
                        <asp:ControlParameter ControlID="txtLastName" Name="mem_lastname" Type="String" />
                        <asp:ControlParameter ControlID="txtAge" Name="mem_age" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPhone" Name="mem_phone" Type="String" />
                        <asp:ControlParameter ControlID="txtAddress" Name="mem_address" Type="String" />
                        <asp:ControlParameter ControlID="DropDownMemCatID" Name="mem_category_id" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mem_firstname" Type="String" />
                        <asp:Parameter Name="mem_lastname" Type="String" />
                        <asp:Parameter Name="mem_age" Type="Int32" />
                        <asp:Parameter Name="mem_phone" Type="String" />
                        <asp:Parameter Name="mem_address" Type="String" />
                        <asp:Parameter Name="mem_category_id" Type="String" />
                        <asp:Parameter Name="original_mem_id" Type="Int32" />
                        <asp:Parameter Name="original_mem_firstname" Type="String" />
                        <asp:Parameter Name="original_mem_lastname" Type="String" />
                        <asp:Parameter Name="original_mem_age" Type="Int32" />
                        <asp:Parameter Name="original_mem_phone" Type="String" />
                        <asp:Parameter Name="original_mem_address" Type="String" />
                        <asp:Parameter Name="original_mem_category_id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
</asp:Content>
