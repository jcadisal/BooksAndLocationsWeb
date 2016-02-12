<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BooksAndLocationsWeb._Default" %>
<%@ Register assembly="Artem.Google" namespace="Artem.Google.UI" tagprefix="artem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h2>Books & Locations</h2>
    </div>
    <div class="row">
        <h3>Books</h3>
    </div>
    <div class="row">
<%--        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
        <asp:ListView ID="ListViewBooks" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookAuthorLabel" runat="server" Text='<%# Eval("BookAuthor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookISBNLabel" runat="server" Text='<%# Eval("BookISBN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookDescriptionLabel" runat="server" Text='<%# Eval("BookDescription") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookAuthorTextBox" runat="server" Text='<%# Bind("BookAuthor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookISBNTextBox" runat="server" Text='<%# Bind("BookISBN") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookDescriptionTextBox" runat="server" Text='<%# Bind("BookDescription") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookAuthorTextBox" runat="server" Text='<%# Bind("BookAuthor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookISBNTextBox" runat="server" Text='<%# Bind("BookISBN") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BookDescriptionTextBox" runat="server" Text='<%# Bind("BookDescription") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookAuthorLabel" runat="server" Text='<%# Eval("BookAuthor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookISBNLabel" runat="server" Text='<%# Eval("BookISBN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookDescriptionLabel" runat="server" Text='<%# Eval("BookDescription") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Name</th>
                                    <th runat="server">Author</th>
                                    <th runat="server">ISBN</th>
                                    <th runat="server">Description</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookAuthorLabel" runat="server" Text='<%# Eval("BookAuthor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookISBNLabel" runat="server" Text='<%# Eval("BookISBN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BookDescriptionLabel" runat="server" Text='<%# Eval("BookDescription") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" SelectCommand="SELECT [BookName], [BookAuthor], [BookISBN], [BookDescription] FROM [Books] ORDER BY [BookName]"></asp:SqlDataSource>
    </div>
    <div class="row">
        <h3>Locations</h3>
<%--        <artem:GoogleMap ID="GoogleMap1" runat="server" Width="800px" Height="600px" Latitude="38.079233" Longitude="-96.574223">
        </artem:GoogleMap>--%>
    </div>

    <div class="row">

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">

var markers = [

<asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource2">

<ItemTemplate>

            {

            "title": '<%# Eval("LocationName") %>' + ', ' + '<%# Eval("LocationDescription") %>',

            "lat": '<%# Eval("LocationLatitude") %>',

            "lng": '<%# Eval("LocationLongitude") %>',

            "description": '<%# Eval("LocationDescription") %>',

            "address": '<%# Eval("LocationAddress")%>' + ', ' + '<%# Eval("LocationName")%>' + ', ' + '<%# Eval("LocationDescription") %>'

        }

</ItemTemplate>

<SeparatorTemplate>

    ,

</SeparatorTemplate>

</asp:Repeater>

];

</script>
<script type="text/javascript">

    window.onload = function () {

        var mapOptions = {
            center: new google.maps.LatLng(38.079233, -96.574223),
            zoom: 4,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        var geocoder = new google.maps.Geocoder();
        var latglobal = 0;
        var lngglobal = 0;
        var timeout = 60;

        for (i = 0; i < markers.length; i++) {
            //alert("Loop: " + i);
            var data = markers[i]
            addMarker(map, data)

        };

        function addMarker(map, data){
            var infoWin = new google.maps.InfoWindow({content: data.description});
            geocoder.geocode({ 'address': data.address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latglobal = results[0].geometry.location.lat();
                    var lngglobal = results[0].geometry.location.lng();

                    var myLatlng = new google.maps.LatLng(latglobal, lngglobal);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        title: data.title
                    });
                    google.maps.event.addListener(marker, 'click', function(){
                        infoWin.setContent(data.address);
                        infoWin.open(map, marker);
                    });
                }
                else
                {
                    if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT)
                    {
                        setTimeout(function() { addMarker(map, data); }, (timeout));
                    }
                }

            });
        }

    }

</script>

<div id="dvMap" style="width: 800px; height: 600px">

</div>
    </div>


    <div class="row">

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyLibraryConnectionString %>" SelectCommand="SELECT [LocationName], [LocationDescription], [LocationAddress], [LocationLatitude], [LocationLongitude], [LocationID] FROM [Locations] ORDER BY [LocationName]"></asp:SqlDataSource>
    </div>

</asp:Content>
