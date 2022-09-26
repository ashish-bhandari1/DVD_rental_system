<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="6.aspx.cs" Inherits="EverestVideoLibrary._6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 59%;
            height: 114px;
            margin-left: 347px;
        }
        .auto-style3 {
            margin-left: 161px;
        }
    .auto-style4 {
        margin-left: 500px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <p class="auto-style4">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Issue Loan"></asp:Label>
    </p>
    <table class="auto-style1">
        <tr>
            <td style="width: 266px">
                <asp:Label ID="Label2" runat="server" Text="Loan type: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="duration" DataValueField="type_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [type_id], [name], [duration] FROM [LoanType]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 266px">
                <asp:Label ID="Label3" runat="server" Text="Dvd copy:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="copy_name" DataValueField="copy_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [copy_id], [copy_name] FROM [DvdCopies] WHERE ([isonloan] = @isonloan) ORDER BY [copy_name]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="isonloan" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 266px">
                <asp:Label ID="Label4" runat="server" Text="Member ID:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True" Width="154px" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [mem_id], [mem_firstname], [mem_lastname] FROM [Members]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 266px">
                <asp:Label ID="Label5" runat="server" Text="Loan date:"></asp:Label>
            </td>
            <td>
                <asp:Calendar ID="calender_loaddate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 266px">
                <asp:Label ID="Label6" runat="server" Text="Duration:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtbox_duration" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="button_submit" runat="server" OnClick="button_submit_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="button_clear" runat="server" OnClick="button_clear_Click" Text="Clear" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="loan_id" DataSourceID="SqlDataSource4" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style3" ForeColor="Black" Width="977px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="loan_id" HeaderText="loan_id" InsertVisible="False" ReadOnly="True" SortExpression="loan_id" />
            <asp:BoundField DataField="mem_id" HeaderText="mem_id" SortExpression="mem_id" />
            <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />
            <asp:BoundField DataField="type_id" HeaderText="type_id" SortExpression="type_id" />
            <asp:BoundField DataField="loan_date" HeaderText="loan_date" SortExpression="loan_date" />
            <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [loan_id] = @original_loan_id AND [mem_id] = @original_mem_id AND [copy_id] = @original_copy_id AND [type_id] = @original_type_id AND [loan_date] = @original_loan_date AND [due_date] = @original_due_date" InsertCommand="INSERT INTO [Loan] ([mem_id], [copy_id], [type_id], [loan_date], [due_date]) VALUES (@mem_id, @copy_id, @type_id, @loan_date, @due_date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT loan_id, mem_id, copy_id, type_id, loan_date, due_date FROM Loan WHERE (return_date IS NULL) ORDER BY loan_id" UpdateCommand="UPDATE [Loan] SET [mem_id] = @mem_id, [copy_id] = @copy_id, [type_id] = @type_id, [loan_date] = @loan_date, [due_date] = @due_date WHERE [loan_id] = @original_loan_id AND [mem_id] = @original_mem_id AND [copy_id] = @original_copy_id AND [type_id] = @original_type_id AND [loan_date] = @original_loan_date AND [due_date] = @original_due_date">
        <DeleteParameters>
            <asp:Parameter Name="original_loan_id" Type="Int32" />
            <asp:Parameter Name="original_mem_id" Type="String" />
            <asp:Parameter Name="original_copy_id" Type="Int32" />
            <asp:Parameter Name="original_type_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_loan_date" />
            <asp:Parameter DbType="Date" Name="original_due_date" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="mem_id" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="copy_id" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList4" Name="type_id" Type="Int32" />
            <asp:ControlParameter ControlID="calender_loaddate" DbType="Date" Name="loan_date" />
            <%--<asp:ControlParameter ControlID="" DbType="Date" Name="due_date" />--%>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="mem_id" Type="String" />
            <asp:Parameter Name="copy_id" Type="Int32" />
            <asp:Parameter Name="type_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="loan_date" />
            <asp:Parameter DbType="Date" Name="due_date" />
            <asp:Parameter Name="original_loan_id" Type="Int32" />
            <asp:Parameter Name="original_mem_id" Type="String" />
            <asp:Parameter Name="original_copy_id" Type="Int32" />
            <asp:Parameter Name="original_type_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_loan_date" />
            <asp:Parameter DbType="Date" Name="original_due_date" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
