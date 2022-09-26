<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Producer.aspx.cs" Inherits="EverestVideoLibrary.Producer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <h2>Producer Details Form</h2>

                <asp:Label runat="server" Text="Producer ID"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtProducerID"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Producer Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtProducerName"></asp:TextBox>
                <br />

                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            

                    <br />
            

                    <br />
            

                    <br />
            
                </div>
                <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">
                    <asp:GridView runat="server" ID="grdProducer" CssClass="table" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="producer_id" DataSourceID="SqlDataSource1" Height="200px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="producer_id" HeaderText="producer_id" ReadOnly="True" SortExpression="producer_id" />
                            <asp:BoundField DataField="producer" HeaderText="producer" SortExpression="producer" />
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
        

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Producer] WHERE [producer_id] = @original_producer_id AND [producer] = @original_producer" InsertCommand="INSERT INTO [Producer] ([producer_id], [producer]) VALUES (@producer_id, @producer)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Producer]" UpdateCommand="UPDATE [Producer] SET [producer] = @producer WHERE [producer_id] = @original_producer_id AND [producer] = @original_producer">
                    <DeleteParameters>
                        <asp:Parameter Name="original_producer_id" Type="String" />
                        <asp:Parameter Name="original_producer" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtProducerID" Name="producer_id" Type="String" />
                        <asp:ControlParameter ControlID="txtproducerName" Name="producer" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="producer" Type="String" />
                        <asp:Parameter Name="original_producer_id" Type="String" />
                        <asp:Parameter Name="original_producer" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        

            </div>

    <br />
    <br />
</asp:Content>
