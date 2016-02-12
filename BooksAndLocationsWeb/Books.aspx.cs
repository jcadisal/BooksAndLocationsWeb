using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksAndLocationsWeb
{
    public partial class Books : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormViewBook_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridViewBooks.DataBind();
        }

        protected void FormViewBook_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridViewBooks.DataBind();
        }

        protected void FormViewBook_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridViewBooks.DataBind();
        }

        protected void LinkButtonAddBook_Click(object sender, EventArgs e)
        {
            FormViewBook.ChangeMode(FormViewMode.Insert);
        }
    }
}