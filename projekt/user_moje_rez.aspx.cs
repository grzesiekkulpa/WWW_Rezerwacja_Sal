using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Npgsql;
using System.Data;
namespace projekt
{
    public partial class user_moje_rez : System.Web.UI.Page
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

                    if (rola != "users") Response.Redirect("index.aspx");

                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    string id_pracc = User.Identity.Name;
                    // quite complex sql statement
                    string sql = "SELECT * FROM rezerwacja where id_pracownika =  '"+ id_pracc +"'";
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
            Response.Redirect("index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                Int32 numer = System.Int32.Parse(TextBox1.Text);
                Int32 check = 0; ;
                NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                conn.Open();
                NpgsqlCommand check_user = new NpgsqlCommand("select nr_rezerwacji from rezerwacja where nr_rezerwacji = '" + numer + "'", conn);
                try
                {
                    check = (Int32)check_user.ExecuteScalar();
                }
                catch { }
                if (check == numer)
                    {
                        NpgsqlCommand delete = new NpgsqlCommand("delete from rezerwacja where nr_rezerwacji = '" + numer + "'and id_pracownika='"+User.Identity.Name+"'", conn);
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
    }
}