using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BooksAndLocationsWeb.Startup))]
namespace BooksAndLocationsWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
