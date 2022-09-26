<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberCategory.aspx.cs" Inherits="EverestVideoLibrary.MemberCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            position: relative;
            width: 1173px;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
            left: 320px;
            top: 21px;
            height: 385px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style3 {
            color: #212529;
            border-collapse: collapse;
            margin-left: 254px;
            margin-top: 0px;
            margin-bottom: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="auto-style2">

                <h2>Member Category Details Form</h2>

                <asp:Label runat="server" Text="Member Category ID"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMemCatID"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Membership Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMemCat"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Total Loan"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtTotalLoan"></asp:TextBox>
                <br />

                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            

                    <br />
                <br />
            </div>
                <div>

                    <asp:GridView runat="server" ID="grdMemberCategory" CssClass="auto-style3" AutoGenerateColumns="False" DataKeyNames="mem_category_id" DataSourceID="SqlDataSource1" AllowSorting="True" Height="73px" Width="843px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="mem_category_id" HeaderText="mem_category_id" ReadOnly="True" SortExpression="mem_category_id" />
                            <asp:BoundField DataField="mem_category_name" HeaderText="mem_category_name" SortExpression="mem_category_name" />
                            <asp:BoundField DataField="totalLoan" HeaderText="totalLoan" SortExpression="totalLoan" />
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
        

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [MemberCategory] WHERE [mem_category_id] = @original_mem_category_id AND (([mem_category_name] = @original_mem_category_name) OR ([mem_category_name] IS NULL AND @original_mem_category_name IS NULL)) AND (([totalLoan] = @original_totalLoan) OR ([totalLoan] IS NULL AND @original_totalLoan IS NULL))" InsertCommand="INSERT INTO [MemberCategory] ([mem_category_id], [mem_category_name], [totalLoan]) VALUES (@mem_category_id, @mem_category_name, @totalLoan)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [MemberCategory]" UpdateCommand="UPDATE [MemberCategory] SET [mem_category_name] = @mem_category_name, [totalLoan] = @totalLoan WHERE [mem_category_id] = @original_mem_category_id AND (([mem_category_name] = @original_mem_category_name) OR ([mem_category_name] IS NULL AND @original_mem_category_name IS NULL)) AND (([totalLoan] = @original_totalLoan) OR ([totalLoan] IS NULL AND @original_totalLoan IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_mem_category_id" Type="String" />
                        <asp:Parameter Name="original_mem_category_name" Type="String" />
                        <asp:Parameter Name="original_totalLoan" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMemCatID" Name="mem_category_id" Type="String" />
                        <asp:ControlParameter ControlID="txtMemCat" Name="mem_category_name" Type="String" />
                        <asp:ControlParameter ControlID="txtTotalLoan" Name="totalLoan" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mem_category_name" Type="String" />
                        <asp:Parameter Name="totalLoan" Type="Int32" />
                        <asp:Parameter Name="original_mem_category_id" Type="String" />
                        <asp:Parameter Name="original_mem_category_name" Type="String" />
                        <asp:Parameter Name="original_totalLoan" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
       
            </div>
</asp:Content>
