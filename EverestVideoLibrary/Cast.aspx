<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cast.aspx.cs" Inherits="EverestVideoLibrary.Cast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #212529;
            border-collapse: collapse;
            margin-bottom: 1rem;
        margin-left: 0px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            
            <div class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <h2>Cast Details Form</h2>
                
                    <asp:Label runat="server" Text="Cast ID"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtCastID" runat="server"></asp:TextBox>  
                <br />

                <asp:Label runat="server" Text="First Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server"></asp:TextBox>  
                <br />
                
                <asp:Label runat="server" Text="Last Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server"></asp:TextBox>  
                <br />

                <asp:Label runat="server" Text="DVD ID"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT [dvd_id], [title] FROM [DvdDetails]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownDVDid" runat="server" Height="30px" Width="205px" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="dvd_id">
                </asp:DropDownList>
                        <br />
                        <br />

                
                 <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" style="margin-top: 0"/>
           
                </div>
                <div class="col-lg-6" style="left: 270px; top: 21px; width: 1179px">
                    <asp:GridView runat="server" ID="grdDVD" CssClass="auto-style1" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="cast_id" DataSourceID="SqlDataSource2" style="margin-top: 26px" Height="300px" Width="805px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="cast_id" HeaderText="cast_id" ReadOnly="True" SortExpression="cast_id" />
                            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                            <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" SortExpression="dvd_id" />
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
        

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [Cast] WHERE [cast_id] = @original_cast_id AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [dvd_id] = @original_dvd_id" InsertCommand="INSERT INTO [Cast] ([cast_id], [first_name], [last_name], [dvd_id]) VALUES (@cast_id, @first_name, @last_name, @dvd_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cast]" UpdateCommand="UPDATE [Cast] SET [first_name] = @first_name, [last_name] = @last_name, [dvd_id] = @dvd_id WHERE [cast_id] = @original_cast_id AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [dvd_id] = @original_dvd_id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_cast_id" Type="Int32" />
                        <asp:Parameter Name="original_first_name" Type="String" />
                        <asp:Parameter Name="original_last_name" Type="String" />
                        <asp:Parameter Name="original_dvd_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCastID" Name="cast_id" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFirstName" Name="first_name" Type="String" />
                        <asp:ControlParameter ControlID="txtLastName" Name="last_name" Type="String" />
                        <asp:ControlParameter ControlID="DropDownDVDid" Name="dvd_id" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="dvd_id" Type="Int32" />
                        <asp:Parameter Name="original_cast_id" Type="Int32" />
                        <asp:Parameter Name="original_first_name" Type="String" />
                        <asp:Parameter Name="original_last_name" Type="String" />
                        <asp:Parameter Name="original_dvd_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>

    <br />
    <br />
</asp:Content>
