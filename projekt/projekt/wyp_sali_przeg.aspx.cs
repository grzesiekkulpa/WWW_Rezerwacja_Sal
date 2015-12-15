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
    public partial class wyp_sali_przeg : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string rola;
            FormsIdentity id =
                (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket bilet = id.Ticket;
            Label1.Text = "Zalogowany jako: " + User.Identity.Name;
            // Get the stored user-data, in this case, our roles
            rola = bilet.UserData;

            //strona dostępna dla usera i admina
            //if (rola != "admins") Response.Redirect("index.aspx");


            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();

            NpgsqlCommand command1 = new NpgsqlCommand("select * from sala", conn);
            
            
                try
                {
                    if (DropDownList1.Items.Count == 0)
                    {
                        NpgsqlDataReader dr1 = command1.ExecuteReader();
                        string[] tab1 = new string[500];
                        int i = 0;
                        {
                            while (dr1.Read())
                            {
                                tab1[i] = Convert.ToString(dr1[0]);
                                DropDownList1.Items.Insert(i, tab1[i]);
                                i++;
                            }
                        }
                    }

                }
                finally
                {

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
            id = DropDownList1.SelectedItem.ToString();
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            // quite complex sql statement
            string sql = "SELECT id_wyp FROM wyp_sali where id_sali='" + id + "'";
            // data adapter making request from our connection
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
            // i always reset DataSet before i do
            // something with it.... i don't know why :-)
            ds.Reset();
            // filling DataSet with result from NpgsqlDataAdapter
            da.Fill(ds);
            // since it C# DataSet can handle multiple tables, we will select first
            dt = ds.Tables[0];
            int count = dt.Rows.Count;
            for (int i = 0; i < count; i++) 
            {
                string current = dt.Rows[i][0].ToString();
                string sqlc = "SELECT * FROM wyposazenie where id_wyp='" + current + "'";
                NpgsqlDataAdapter dac = new NpgsqlDataAdapter(sqlc, conn);
                dac.Fill(ds1);
                dt1 = ds1.Tables[0];
            }
            GridView1.DataSource = dt1;
            GridView1.DataBind();           
            conn.Close();
        }
    }
}