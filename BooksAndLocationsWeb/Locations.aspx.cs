using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksAndLocationsWeb
{
    public partial class Locations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormViewLocation_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridViewLocations.DataBind();
        }

        protected void FormViewLocation_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridViewLocations.DataBind();
        }

        protected void FormViewLocation_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridViewLocations.DataBind();
        }

        protected void LinkButtonAddLocation_Click(object sender, EventArgs e)
        {
            FormViewLocation.ChangeMode(FormViewMode.Insert);
        }
    }
}