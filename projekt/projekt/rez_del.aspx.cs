using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Web.Security;
using Npgsql;
namespace projekt
{
    public partial class rez_del : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) Response.Redirect("index.aspx");

            else if (User.Identity.IsAuthenticated)
                if (HttpContext.Current.User.Identity is FormsIdentity)
                {
                    string rola;
                    FormsIdentity id =
                        (FormsIdentity)HttpContext.Current.User.Identity;
                    FormsAuthenticationTicket bilet = id.Ticket;
                    Label1.Text = "Zalogowany jako: " + User.Identity.Name;
                    // Get the stored user-data, in this case, our roles
                    rola = bilet.UserData;

                    if (rola != "admins") Response.Redirect("index.aspx");
                }
        }

        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("index.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Int32 numer = System.Int32.Parse(TextBox1.Text);
                Int32 check;
                NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                conn.Open();
                NpgsqlCommand check_user = new NpgsqlCommand("select nr_rezerwacji from rezerwacja where nr_rezerwacji = '" + numer + "'", conn);
                check = (Int32)check_user.ExecuteScalar();
                if (check == numer)
                {
                    NpgsqlCommand delete = new NpgsqlCommand("delete from rezerwacja where nr_rezerwacji = '" + numer + "'", conn);
                    delete.ExecuteScalar();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    Label3.Text = "Rezerwacja została anulowana!";
                    Label2.Text = "";
                }
                else if (check != numer)
                {
                    Label2.Text = "Brak rezerwacji w bazie!";
                    Label3.Text = "";
                }
            }
            catch { }

        }

    }
}