<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoanType.aspx.cs" Inherits="EverestVideoLibrary.LoanType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 1179px;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
            left: 320px;
            top: 21px;
            height: 620px;
            margin-bottom: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            color: #212529;
            border-collapse: collapse;
            margin-left: 250px;
            margin-bottom: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="auto-style1">

                <h2>Loan Type Details Form</h2>

                <asp:Label runat="server" Text="Loan Type ID"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtTypeID"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Loan Type Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLoanTypeName"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Duration"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDuration"></asp:TextBox>
                <br />

                <asp:Label runat="server" Text="Charge Per Day"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtChargePerDay"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonCalculate" runat="server" Height="30px" Text="Calculate" OnClick="btnCalculate_Click" />
                <br />
                <br />

                <asp:Label runat="server" Text="Penalty Charge"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPenalty"></asp:TextBox>
                <br />

                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            

                    <br />
                <br />
            
                </div>
                
                <div>
                    <asp:GridView runat="server" ID="grdDVD" CssClass="auto-style2" AutoGenerateColumns="False" DataKeyNames="type_id" DataSourceID="SqlDataSource1" AllowSorting="True" Width="854px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="type_id" HeaderText="type_id" ReadOnly="True" SortExpression="type_id" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration" />
                            <asp:BoundField DataField="chargePerDay" HeaderText="chargePerDay" SortExpression="chargePerDay" />
                            <asp:BoundField DataField="penalty" HeaderText="penalty" SortExpression="penalty" />
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
        

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [LoanType] WHERE [type_id] = @original_type_id AND [name] = @original_name AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL)) AND (([chargePerDay] = @original_chargePerDay) OR ([chargePerDay] IS NULL AND @original_chargePerDay IS NULL)) AND (([penalty] = @original_penalty) OR ([penalty] IS NULL AND @original_penalty IS NULL))" InsertCommand="INSERT INTO [LoanType] ([type_id], [name], [duration], [chargePerDay], [penalty]) VALUES (@type_id, @name, @duration, @chargePerDay, @penalty)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [LoanType]" UpdateCommand="UPDATE [LoanType] SET [name] = @name, [duration] = @duration, [chargePerDay] = @chargePerDay, [penalty] = @penalty WHERE [type_id] = @original_type_id AND [name] = @original_name AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL)) AND (([chargePerDay] = @original_chargePerDay) OR ([chargePerDay] IS NULL AND @original_chargePerDay IS NULL)) AND (([penalty] = @original_penalty) OR ([penalty] IS NULL AND @original_penalty IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_type_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_duration" Type="Int32" />
                        <asp:Parameter Name="original_chargePerDay" Type="Int32" />
                        <asp:Parameter Name="original_penalty" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtTypeID" Name="type_id" Type="Int32" />
                        <asp:ControlParameter ControlID="txtLoanTypeName" Name="name" Type="String" />
                        <asp:ControlParameter ControlID="txtDuration" Name="duration" Type="Int32" />
                        <asp:ControlParameter ControlID="txtChargePerDay" Name="chargePerDay" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPenalty" Name="penalty" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="duration" Type="Int32" />
                        <asp:Parameter Name="chargePerDay" Type="Int32" />
                        <asp:Parameter Name="penalty" Type="String" />
                        <asp:Parameter Name="original_type_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_duration" Type="Int32" />
                        <asp:Parameter Name="original_chargePerDay" Type="Int32" />
                        <asp:Parameter Name="original_penalty" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        

            </div>
</asp:Content>
