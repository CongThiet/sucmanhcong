using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SUCMANHCONG.Startup))]
namespace SUCMANHCONG
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
