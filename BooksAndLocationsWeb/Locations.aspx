<%@ Page Title="Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locations.aspx.cs" Inherits="BooksAndLocationsWeb.Locations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>

    <div class="row">
        <h2>Locations</h2>
    </div>
    <div class="row">
        <h3>Edit Locations</h3>
    </div>

        <asp:LinkButton ID="LinkButtonAddLocation" runat="server" OnClick="LinkButtonAddLocation_Click">Add Location</asp:LinkButton>
    <br />
    <asp:GridView ID="GridViewLocations" runat="server" AutoGenerateColumns="False" DataKeyNames="LocationID" DataSourceID="SqlDataSourceLocations" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="LocationID" HeaderText="LocationID" InsertVisible="False" ReadOnly="True" SortExpression="LocationID" Visible="False" />
            <asp:BoundField DataField="LocationName" HeaderText="Name" SortExpression="LocationName" />
            <asp:BoundField DataField="LocationDescription" HeaderText="Description" SortExpression="LocationDescription" />
            <asp:BoundField DataField="LocationAddress" HeaderText="Address" SortExpression="LocationAddress" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" DeleteCommand="DELETE FROM [Locations] WHERE [LocationID] = @LocationID" InsertCommand="INSERT INTO [Locations] ([LocationName], [LocationDescription], [LocationAddress]) VALUES (@LocationName, @LocationDescription, @LocationAddress)" SelectCommand="SELECT [LocationID], [LocationName], [LocationDescription], [LocationAddress] FROM [Locations] ORDER BY [LocationName]" UpdateCommand="UPDATE [Locations] SET [LocationName] = @LocationName, [LocationDescription] = @LocationDescription, [LocationAddress] = @LocationAddress WHERE [LocationID] = @LocationID">
        <DeleteParameters>
            <asp:Parameter Name="LocationID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LocationName" Type="String" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="LocationAddress" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LocationName" Type="String" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="LocationAddress" Type="String" />
            <asp:Parameter Name="LocationID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />

    <asp:FormView ID="FormViewLocation" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="LocationID" DataSourceID="SqlDataSourceEditLocation" ForeColor="Black" GridLines="Vertical" Width="480px" OnItemDeleted="FormViewLocation_ItemDeleted" OnItemInserted="FormViewLocation_ItemInserted" OnItemUpdated="FormViewLocation_ItemUpdated">
        <EditItemTemplate>
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LocationNameTextBox" runat="server" Text='<%# Bind("LocationName") %>' Width="250px" />
            <br />
            Description:
            <asp:TextBox ID="LocationDescriptionTextBox" runat="server" Text='<%# Bind("LocationDescription") %>' Width="150px" />
            <br />
            Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LocationAddressTextBox" runat="server" Text='<%# Bind("LocationAddress") %>' Width="300px" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LocationNameTextBox" runat="server" Text='<%# Bind("LocationName") %>' Width="250px" />
            <br />
            Description:
            <asp:TextBox ID="LocationDescriptionTextBox" runat="server" Text='<%# Bind("LocationDescription") %>' Width="150px" />
            <br />
            Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LocationAddressTextBox" runat="server" Text='<%# Bind("LocationAddress") %>' Width="300px" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LocationNameLabel" runat="server" Text='<%# Bind("LocationName") %>' />
            <br />
            Description:
            <asp:Label ID="LocationDescriptionLabel" runat="server" Text='<%# Bind("LocationDescription") %>' />
            <br />
            Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LocationAddressLabel" runat="server" Text='<%# Bind("LocationAddress") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        </ItemTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceEditLocation" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" 
        DeleteCommand="DELETE FROM [Locations] WHERE [LocationID] = @LocationID" 
        InsertCommand="INSERT INTO [Locations] ([LocationName], [LocationDescription], [LocationAddress], [LocationLatitude], [LocationLongitude]) VALUES (@LocationName, @LocationDescription, @LocationAddress, @LocationLatitude, @LocationLongitude)" 
        SelectCommand="SELECT * FROM [Locations] WHERE [LocationID] = @LocationID"  
        UpdateCommand="UPDATE [Locations] SET [LocationName] = @LocationName, [LocationDescription] = @LocationDescription, [LocationAddress] = @LocationAddress, [LocationLatitude] = @LocationLatitude, [LocationLongitude] = @LocationLongitude WHERE [LocationID] = @LocationID">
        <DeleteParameters>
            <asp:Parameter Name="LocationID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewLocations" Name="LocationID" PropertyName="SelectedValue" Type="Double" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="LocationName" Type="String" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="LocationAddress" Type="String" />
            <asp:Parameter Name="LocationLatitude" Type="String" />
            <asp:Parameter Name="LocationLongitude" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LocationName" Type="String" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="LocationAddress" Type="String" />
            <asp:Parameter Name="LocationLatitude" Type="String" />
            <asp:Parameter Name="LocationLongitude" Type="String" />
            <asp:Parameter Name="LocationID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
