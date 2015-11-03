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
    public partial class prac_del : System.Web.UI.Page
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
            try
            {
                string user_id = TextBox1.Text;
                string check;
                NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                conn.Open();
                NpgsqlCommand check_user = new NpgsqlCommand("select id_prac from pracownicy where id_prac = '" + user_id + "'", conn);
                check = (String)check_user.ExecuteScalar();
                if (check == user_id)
                {
                    NpgsqlCommand delete = new NpgsqlCommand("delete from pracownicy where id_prac = '" + user_id + "'", conn);
                    delete.ExecuteScalar();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    Label3.Text = "Użytkownik został usunięty!";
                    Label2.Text = "";
                }
                else if (check != user_id)
                {
                    Label2.Text = "Brak użytkownika w bazie!";
                    Label3.Text = "";
                }

            }
            catch
            {
            }
        }

       
    }
}