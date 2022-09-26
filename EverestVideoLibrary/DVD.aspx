<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVD.aspx.cs" Inherits="EverestVideoLibrary.DVD" %>
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
            .auto-style3 {
                position: relative;
                width: 1000px;
                -ms-flex: 0 0 50%;
                flex: 0 0 50%;
                max-width: 50%;
                left: -74px;
                top: 21px;
                padding-left: 15px;
                padding-right: 15px;
            }
            .auto-style4 {
                position: relative;
                width: 960px;
                -ms-flex: 0 0 50%;
                flex: 0 0 50%;
                max-width: 50%;
                left: 190px;
                top: 21px;
                padding-left: 15px;
                padding-right: 15px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style2">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Add DVD"></asp:Label>
    </p>


            <div  class="col-lg-6" style="left: 320px; top: 21px; width: 1179px">

                <asp:Label runat="server" Text="DVD Title"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="txtDVDTitle" runat="server"></asp:TextBox>  
                <br />
                <asp:Label runat="server" Text="Studio"></asp:Label>
                <asp:DropDownList ID="DropDownStudio" runat="server" Height="30px" Width="205px" DataSourceID="SqlDataSource2" DataTextField="studio" DataValueField="studio" style="margin-left: 33px">

                </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAddStudio" runat="server" Text="Add" OnClick="btnAddStudio_Click" Height="30px" />
             


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT * FROM [Studios]"></asp:SqlDataSource>
                <br />
                <br />
             
                <asp:Label runat="server" Text="Producer"></asp:Label>
                <asp:DropDownList ID="DropDownProducer" runat="server" Height="30px" Width="205px" DataSourceID="SqlDataSource3" DataTextField="producer" DataValueField="producer" style="margin-left: 15px">
                </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAddProducer" runat="server" Text="Add" OnClick="btnAddProducer_Click" Height="30px" />
     

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
     

                <br />
                <br />
 
                <asp:Label runat="server" Text="Date Released"></asp:Label>
                <asp:Calendar ID="txtDateReleased" runat="server" SelectedDate="2020-03-31"></asp:Calendar>
                <br />
    
                <asp:Label runat="server" Text="Category"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drop_category" runat="server" Height="30px" Width="205px">
                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                <asp:ListItem Value="Romance"></asp:ListItem>
                                <asp:ListItem Value="Comedy"></asp:ListItem>
                                <asp:ListItem Value="Thriller"></asp:ListItem>
                                <asp:ListItem Value="Action"></asp:ListItem>
                </asp:DropDownList>
  

                <br />
                <br />

                <asp:Label runat="server" Text="Age Restricted?"></asp:Label>

                <asp:CheckBox ID="CheckBoxRestrict" runat="server" value="1"/>
                <br />
                <br />


                <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click"/>

                <br />
                </div>

                <div  class="auto-style4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="dvd_id" DataSourceID="SqlDataSource1" AllowSorting="True" Height="189px" CssClass="auto-style3" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" style="margin-top: 46px; margin-left: 0px;">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" ReadOnly="True" SortExpression="dvd_id" InsertVisible="False" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
                                <asp:BoundField DataField="producer" HeaderText="producer" SortExpression="producer" />
                                <asp:BoundField DataField="dateReleased" HeaderText="dateReleased" SortExpression="dateReleased" />
                                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                                <asp:BoundField DataField="ageRestricted" HeaderText="ageRestricted" SortExpression="ageRestricted" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:applicationDevCWConnectionString %>" DeleteCommand="DELETE FROM [DvdDetails] WHERE [dvd_id] = @original_dvd_id AND [title] = @original_title AND [studio] = @original_studio AND [producer] = @original_producer AND (([dateReleased] = @original_dateReleased) OR ([dateReleased] IS NULL AND @original_dateReleased IS NULL)) AND [category] = @original_category AND (([ageRestricted] = @original_ageRestricted) OR ([ageRestricted] IS NULL AND @original_ageRestricted IS NULL))" InsertCommand="INSERT INTO [DvdDetails] ([title], [studio], [producer], [dateReleased], [category], [ageRestricted]) VALUES (@title, @studio, @producer, @dateReleased, @category, @ageRestricted)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DvdDetails]" UpdateCommand="UPDATE [DvdDetails] SET [title] = @title, [studio] = @studio, [producer] = @producer, [dateReleased] = @dateReleased, [category] = @category, [ageRestricted] = @ageRestricted WHERE [dvd_id] = @original_dvd_id AND [title] = @original_title AND [studio] = @original_studio AND [producer] = @original_producer AND (([dateReleased] = @original_dateReleased) OR ([dateReleased] IS NULL AND @original_dateReleased IS NULL)) AND [category] = @original_category AND (([ageRestricted] = @original_ageRestricted) OR ([ageRestricted] IS NULL AND @original_ageRestricted IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_dvd_id" Type="Int32" />
                                <asp:Parameter Name="original_title" Type="String" />
                                <asp:Parameter Name="original_studio" Type="String" />
                                <asp:Parameter Name="original_producer" Type="String" />
                                <asp:Parameter Name="original_dateReleased" Type="String" />
                                <asp:Parameter Name="original_category" Type="String" />
                                <asp:Parameter Name="original_ageRestricted" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtDVDTitle" Name="title" Type="String" />
                                <asp:ControlParameter ControlID="DropDownStudio" Name="studio" Type="String" />
                                <asp:ControlParameter ControlID="DropDownProducer" Name="producer" Type="String" />
                                <asp:ControlParameter ControlID="txtDateReleased" Name="dateReleased" Type="String" />
                                <asp:ControlParameter ControlID="drop_category" Name="category" Type="String" />
                                <asp:ControlParameter ControlID="CheckBoxRestrict" Name="ageRestricted" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="studio" Type="String" />
                                <asp:Parameter Name="producer" Type="String" />
                                <asp:Parameter Name="dateReleased" Type="String" />
                                <asp:Parameter Name="category" Type="String" />
                                <asp:Parameter Name="ageRestricted" Type="Int32" />
                                <asp:Parameter Name="original_dvd_id" Type="Int32" />
                                <asp:Parameter Name="original_title" Type="String" />
                                <asp:Parameter Name="original_studio" Type="String" />
                                <asp:Parameter Name="original_producer" Type="String" />
                                <asp:Parameter Name="original_dateReleased" Type="String" />
                                <asp:Parameter Name="original_category" Type="String" />
                                <asp:Parameter Name="original_ageRestricted" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        </div>

</asp:Content>
