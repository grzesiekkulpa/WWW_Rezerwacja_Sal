using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Npgsql;
using NpgsqlTypes;
using System.Data;

namespace projekt
{
    public partial class wyp_sali_del : System.Web.UI.Page
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
                   
                    
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    // quite complex sql statement
                    string sql = "SELECT * FROM wyp_sali";
                    // data adapter making request from our connection
                    NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
                    // i always reset DataSet before i do
                    // something with it.... i don't know why :-)
                    ds.Reset();
                    // filling DataSet with result from NpgsqlDataAdapter
                    da.Fill(ds);
                    // since it C# DataSet can handle multiple tables, we will select first
                    dt = ds.Tables[0];
                    // connect grid to DataTable
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    // since we only showing the result we don't need connection anymore
                    conn.Close();
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
            string checks;
            string checkw;
            string id_sali = TextBox1.Text;
            string id_wyp = TextBox2.Text;
            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            NpgsqlCommand check1 = new NpgsqlCommand("select id_sali from wyp_sali where id_sali = '" + id_sali + "'", conn);
            NpgsqlCommand check2 = new NpgsqlCommand("select id_wyp from wyp_sali where id_sali = '" + id_sali + "'and id_wyp = '" + id_wyp + "'", conn);
            checks = (String)check1.ExecuteScalar();
            checkw = (String)check2.ExecuteScalar();
            if (checkw != id_wyp)
            {
                Label2.Text = "";
                Label3.Text = "Wyposażenie nie istnieje w tej sali";
            }
            else if (checkw == id_wyp && checks == id_sali)
            {
                NpgsqlCommand del = new NpgsqlCommand("delete from wyp_sali where id_wyp ='" + id_wyp + "' and id_sali = '" + id_sali + "'", conn);
                del.ExecuteScalar();
                conn.Close();
                Label2.Text = "Usunięto wyposażenie z sali!";
                Label3.Text = "";
            }
        }
    }
}