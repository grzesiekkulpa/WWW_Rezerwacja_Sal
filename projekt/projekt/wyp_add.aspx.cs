using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Npgsql;

namespace projekt
{
    public partial class wyp_add : System.Web.UI.Page
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
            Response.Redirect("index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string check;
            string id_wyp = TextBox1.Text;
            string nazwa = TextBox2.Text;
            string opis = TextBox3.Text;

            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            NpgsqlCommand check1 = new NpgsqlCommand("select id_wyp from wyposazenie where id_wyp = '" + id_wyp + "'", conn);
            check = (String)check1.ExecuteScalar();
            if (check != id_wyp)
            {
                NpgsqlCommand add = new NpgsqlCommand("insert into wyposazenie values ('" + id_wyp + "', '" + nazwa + "', '" + opis + "')", conn);
                add.ExecuteScalar();
                conn.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                Label2.Text = "Dodano wyposażenie!";
                Label3.Text = "";
            }
            else if (check == id_wyp)
            {
                Label2.Text = "";
                Label3.Text = "Wyposażenie już istnieje!";
            }
        }

       

   
    }
}