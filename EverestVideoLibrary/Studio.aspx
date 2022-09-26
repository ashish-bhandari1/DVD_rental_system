<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Studio.aspx.cs" Inherits="EverestVideoLibrary.Studio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <h2>Studio Details Form</h2>

                <asp:Label runat="server" Text="Studio ID"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtStudioID"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Studio Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtStudioName"></asp:TextBox>
                <br />

                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            
                </div>
                    <br />
            

                    <br />
            
               
                <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">
                    <asp:GridView runat="server" ID="grdStudio" CssClass="table" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="studio_id" DataSourceID="SqlDataSource1" Height="200px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="studio_id" HeaderText="studio_id" ReadOnly="True" SortExpression="studio_id" />
                            <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
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
        

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Studios] WHERE [studio_id] = @original_studio_id AND [studio] = @original_studio" InsertCommand="INSERT INTO [Studios] ([studio_id], [studio]) VALUES (@studio_id, @studio)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Studios]" UpdateCommand="UPDATE [Studios] SET [studio] = @studio WHERE [studio_id] = @original_studio_id AND [studio] = @original_studio">
                    <DeleteParameters>
                        <asp:Parameter Name="original_studio_id" Type="String" />
                        <asp:Parameter Name="original_studio" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtStudioID" Name="studio_id" Type="String" />
                        <asp:ControlParameter ControlID="txtStudioName" Name="studio" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="studio" Type="String" />
                        <asp:Parameter Name="original_studio_id" Type="String" />
                        <asp:Parameter Name="original_studio" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        

            </div>

    <br />
</asp:Content>
