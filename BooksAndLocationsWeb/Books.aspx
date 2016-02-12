<%@ Page Title="Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BooksAndLocationsWeb.Books" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>

    <div class="row">
        <h2>Books</h2>
    </div>
    <div class="row">
        <h3>Edit Books</h3>
    </div>
    <asp:LinkButton ID="LinkButtonAddBook" runat="server" OnClick="LinkButtonAddBook_Click">Add Book</asp:LinkButton>
    <br />
    <asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="SqlDataSourceBooks" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="BookName" HeaderText="Name" SortExpression="BookName"></asp:BoundField>
            <asp:BoundField DataField="BookAuthor" HeaderText="Author" SortExpression="BookAuthor" />
            <asp:BoundField DataField="BookISBN" HeaderText="ISBN" SortExpression="BookISBN" />
            <asp:BoundField DataField="BookDescription" HeaderText="Description" SortExpression="BookDescription"></asp:BoundField>
            <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" Visible="False" />
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

<asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [BookID] = @BookID" SelectCommand="SELECT [BookName], [BookAuthor], [BookISBN], [BookDescription], [BookID] FROM [Books] ORDER BY [BookName]">
    <DeleteParameters>
        <asp:Parameter Name="BookID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

    <br />

    <asp:FormView ID="FormViewBook" runat="server" DataKeyNames="BookID" DataSourceID="SqlDataSourceEditBook" Width="549px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnItemDeleted="FormViewBook_ItemDeleted" OnItemInserted="FormViewBook_ItemInserted" OnItemUpdated="FormViewBook_ItemUpdated">
        <EditItemTemplate>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' Width="300px" />
            <br />
            Author:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="BookAuthorTextBox" runat="server" Text='<%# Bind("BookAuthor") %>' Width="200px" />
            <br />
            ISBN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="BookISBNTextBox" runat="server" Text='<%# Bind("BookISBN") %>' />
            <br />
            Description:
            <asp:TextBox ID="BookDescriptionTextBox" runat="server" Text='<%# Bind("BookDescription") %>' Width="300px" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Name:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' Width="300px" />
            <br />
            Author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="BookAuthorTextBox" runat="server" Text='<%# Bind("BookAuthor") %>' Width="300px" />
            <br />
            ISBN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="BookISBNTextBox" runat="server" Text='<%# Bind("BookISBN") %>' />
            <br />
            Description:&nbsp;<asp:TextBox ID="BookDescriptionTextBox" runat="server" Text='<%# Bind("BookDescription") %>' Width="400px" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="BookNameLabel" runat="server" Text='<%# Bind("BookName") %>' />
            <br />
            Author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="BookAuthorLabel" runat="server" Text='<%# Bind("BookAuthor") %>' />
            <br />
            ISBN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="BookISBNLabel" runat="server" Text='<%# Bind("BookISBN") %>' />
            <br />
            Description:
            <asp:Label ID="BookDescriptionLabel" runat="server" Text='<%# Bind("BookDescription") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;
        </ItemTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceEditBook" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" 
        DeleteCommand="DELETE FROM [Books] WHERE [BookID] = @BookID" 
        InsertCommand="INSERT INTO [Books] ([BookName], [BookAuthor], [BookISBN], [BookDescription], [LocationID]) VALUES (@BookName, @BookAuthor, @BookISBN, @BookDescription, @LocationID)" 
        SelectCommand="SELECT * FROM [Books] WHERE [BookID] = @BookID" 
        UpdateCommand="UPDATE [Books] SET [BookName] = @BookName, [BookAuthor] = @BookAuthor, [BookISBN] = @BookISBN, [BookDescription] = @BookDescription, [LocationID] = @LocationID WHERE [BookID] = @BookID">
        <DeleteParameters>
            <asp:Parameter Name="BookID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewBooks" Name="BookID" PropertyName="SelectedValue" Type="Double" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="BookName" Type="String" />
            <asp:Parameter Name="BookAuthor" Type="String" />
            <asp:Parameter Name="BookISBN" Type="String" />
            <asp:Parameter Name="BookDescription" Type="String" />
            <asp:Parameter Name="LocationID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BookName" Type="String" />
            <asp:Parameter Name="BookAuthor" Type="String" />
            <asp:Parameter Name="BookISBN" Type="String" />
            <asp:Parameter Name="BookDescription" Type="String" />
            <asp:Parameter Name="LocationID" Type="Int32" />
            <asp:Parameter Name="BookID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
