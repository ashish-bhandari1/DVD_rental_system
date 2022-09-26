<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Loan.aspx.cs" Inherits="EverestVideoLibrary.Loan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <h2>Loan Details Form</h2>

                <asp:Label runat="server" Text="Date Out"></asp:Label>
                <asp:Calendar ID="txtDateOut" runat="server"></asp:Calendar>

                <br />
                <asp:Label ID="Label5" runat="server" Text="Loan Type ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="duration" DataValueField="type_id" Height="33px" Width="240px" AutoPostBack="True" onselectedindexchanged="ddldetails_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [type_id], [name], [duration] FROM [LoanType]"></asp:SqlDataSource>
                    <br />
                <br />

                <asp:Label ID="Label4" runat="server" Text="Duration"></asp:Label>
                <asp:TextBox ID="txtbox_duration" runat="server" CssClass="form-control"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Date Returned"></asp:Label>
                <asp:Calendar ID="txtDateReturned" runat="server"></asp:Calendar>

                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Member ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownMemID" runat="server" DataSourceID="SqlDataSource3" DataTextField="mem_firstname" DataValueField="mem_id" Height="30px" Width="240px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [mem_id], [mem_firstname] FROM [Members]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Copy ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownCopyID" runat="server" DataSourceID="SqlDataSource2" DataTextField="copy_name" DataValueField="copy_id" Height="31px" Width="240px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [copy_id], [copy_name] FROM [DvdCopies]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Loan Type ID"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownTypeID" runat="server" DataSourceID="SqlDataSource1" DataTextField="duration" DataValueField="type_id" Height="33px" Width="240px" AutoPostBack="True" onselectedindexchanged="ddldetails_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [type_id], [name], [duration] FROM [LoanType]"></asp:SqlDataSource>
                <br />
                <br />

                <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>
            

                <br />
            

                <br />
                <br />

                </div>
                <div class="col-lg-6" style="left: 200px; top: 21px; width: 1179px">
                <asp:GridView ID="GridView1" runat="server" Width="830px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="loan_id" DataSourceID="SqlDataSource4" CssClass="auto-style1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="loan_id" HeaderText="loan_id" ReadOnly="True" SortExpression="loan_id" InsertVisible="False" />
                        <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
                        <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                        <asp:BoundField DataField="return_date" HeaderText="return_date" SortExpression="return_date" />
                        <asp:BoundField DataField="mem_id" HeaderText="mem_id" SortExpression="mem_id" />
                        <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />
                        <asp:BoundField DataField="type_id" HeaderText="type_id" SortExpression="type_id" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [loan_id] = @original_loan_id AND [loan_date] = @original_loan_date AND [due_date] = @original_due_date AND (([return_date] = @original_return_date) OR ([return_date] IS NULL AND @original_return_date IS NULL)) AND [mem_id] = @original_mem_id AND [copy_id] = @original_copy_id AND [type_id] = @original_type_id" InsertCommand="INSERT INTO [Loan] ([loan_date], [due_date], [return_date], [mem_id], [copy_id], [type_id]) VALUES (@loan_date, @due_date, @return_date, @mem_id, @copy_id, @type_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Loan]" UpdateCommand="UPDATE [Loan] SET [loan_date] = @loan_date, [due_date] = @due_date, [return_date] = @return_date, [mem_id] = @mem_id, [copy_id] = @copy_id, [type_id] = @type_id WHERE [loan_id] = @original_loan_id AND [loan_date] = @original_loan_date AND [due_date] = @original_due_date AND (([return_date] = @original_return_date) OR ([return_date] IS NULL AND @original_return_date IS NULL)) AND [mem_id] = @original_mem_id AND [copy_id] = @original_copy_id AND [type_id] = @original_type_id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_loan_id" Type="Int32" />
                        <asp:Parameter Name="original_loan_date" DbType="Date" />
                        <asp:Parameter Name="original_due_date" DbType="Date" />
                        <asp:Parameter Name="original_return_date" DbType="Date" />
                        <asp:Parameter Name="original_mem_id" Type="Int32" />
                        <asp:Parameter Name="original_copy_id" Type="Int32" />
                        <asp:Parameter Name="original_type_id" Type="Int32" />
                    </DeleteParameters>

                    <InsertParameters>

                        <asp:ControlParameter ControlID="txtDateOut" Name="loan_date" DbType="Date" />
                        <asp:ControlParameter ControlID="txtDateReturned" Name="return_date" DbType="Date" />
                        <asp:ControlParameter ControlID="DropDownMemID" Name="mem_id" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownCopyID" Name="copy_id" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownTypeID" Name="type_id" Type="Int32" />

                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="loan_date" DbType="Date" />
                        <asp:Parameter Name="due_date" DbType="Date" />
                        <asp:Parameter Name="return_date" DbType="Date" />
                        <asp:Parameter Name="mem_id" Type="Int32" />
                        <asp:Parameter Name="copy_id" Type="Int32" />
                        <asp:Parameter Name="type_id" Type="Int32" />
                        <asp:Parameter Name="original_loan_id" Type="Int32" />
                        <asp:Parameter Name="original_loan_date" DbType="Date" />
                        <asp:Parameter Name="original_due_date" DbType="Date" />
                        <asp:Parameter Name="original_return_date" DbType="Date" />
                        <asp:Parameter Name="original_mem_id" Type="Int32" />
                        <asp:Parameter Name="original_copy_id" Type="Int32" />
                        <asp:Parameter Name="original_type_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
        

            </div>
        
</asp:Content>
