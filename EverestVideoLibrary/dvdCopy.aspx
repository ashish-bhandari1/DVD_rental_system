<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dvdCopy.aspx.cs" Inherits="EverestVideoLibrary.dvdCopy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #212529;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }
        .auto-style2 {
            color: #212529;
            border-collapse: collapse;
            margin-bottom: 1rem;
            margin-left: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Add DVD Copy"></asp:Label>
    </p>

            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <asp:Label runat="server" Text="Copy Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtCopyName"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="DVD ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="title" DataValueField="dvd_id" Width="205px" Height="30px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [dvd_id], [title] FROM [DvdDetails]"></asp:SqlDataSource>
                <br />
                <br />


                <asp:Label runat="server" Text="Is on Loan?"></asp:Label>  
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Selected="True" Value="0">No</asp:ListItem>
                </asp:RadioButtonList>

                <br />

                <asp:Label runat="server" Text="Shelf"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtShelf"></asp:TextBox>
                <br />


                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            

                    <br />
                <br />
            

                    <br />

                </div>
            
                <div class="col-lg-6" style="left: 250px; top: 21px; width: 800px">
                    <asp:GridView runat="server" ID="grdDVD" CssClass="auto-style1" AutoGenerateColumns="False" DataKeyNames="copy_id" DataSourceID="SqlDataSource1" AllowSorting="True" Width="817px" Height="250px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="copy_id" HeaderText="copy_id" ReadOnly="True" SortExpression="copy_id" InsertVisible="False" />
                            <asp:BoundField DataField="copy_name" HeaderText="copy_name" SortExpression="copy_name" />
                            <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" SortExpression="dvd_id" />
                            <asp:BoundField DataField="isonloan" HeaderText="isonloan" SortExpression="isonloan" />
                            <asp:BoundField DataField="shelf" HeaderText="shelf" SortExpression="shelf" />
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
        

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [DvdCopies] WHERE [copy_id] = @original_copy_id AND (([copy_name] = @original_copy_name) OR ([copy_name] IS NULL AND @original_copy_name IS NULL)) AND [dvd_id] = @original_dvd_id AND (([isonloan] = @original_isonloan) OR ([isonloan] IS NULL AND @original_isonloan IS NULL)) AND (([shelf] = @original_shelf) OR ([shelf] IS NULL AND @original_shelf IS NULL))" InsertCommand="INSERT INTO [DvdCopies] ([copy_name], [dvd_id], [isonloan], [shelf]) VALUES (@copy_name, @dvd_id, @isonloan, @shelf)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DvdCopies]" UpdateCommand="UPDATE [DvdCopies] SET [copy_name] = @copy_name, [dvd_id] = @dvd_id, [isonloan] = @isonloan, [shelf] = @shelf WHERE [copy_id] = @original_copy_id AND (([copy_name] = @original_copy_name) OR ([copy_name] IS NULL AND @original_copy_name IS NULL)) AND [dvd_id] = @original_dvd_id AND (([isonloan] = @original_isonloan) OR ([isonloan] IS NULL AND @original_isonloan IS NULL)) AND (([shelf] = @original_shelf) OR ([shelf] IS NULL AND @original_shelf IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_copy_id" Type="Int32" />
                        <asp:Parameter Name="original_copy_name" Type="String" />
                        <asp:Parameter Name="original_dvd_id" Type="Int32" />
                        <asp:Parameter Name="original_isonloan" Type="Int32" />
                        <asp:Parameter Name="original_shelf" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCopyName" Name="copy_name" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="dvd_id" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="isonloan" Type="Int32" />
                        <asp:ControlParameter ControlID="txtShelf" Name="shelf" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="copy_name" Type="String" />
                        <asp:Parameter Name="dvd_id" Type="Int32" />
                        <asp:Parameter Name="isonloan" Type="Int32" />
                        <asp:Parameter Name="shelf" Type="String" />
                        <asp:Parameter Name="original_copy_id" Type="Int32" />
                        <asp:Parameter Name="original_copy_name" Type="String" />
                        <asp:Parameter Name="original_dvd_id" Type="Int32" />
                        <asp:Parameter Name="original_isonloan" Type="Int32" />
                        <asp:Parameter Name="original_shelf" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        

            </div>

    <br />
    <br />
    <br />
</asp:Content>
