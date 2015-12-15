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
    public partial class user_rezerwuj : System.Web.UI.Page
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
                    
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    NpgsqlCommand command1 = new NpgsqlCommand("select * from sala", conn);

                   try
                    {
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
                
        }

        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime data_od = DatePicker1.SelectedDate;
            DateTime data_do = DatePicker2.SelectedDate;
            string t_od = TextBox1.Text;
            string t_do = TextBox2.Text;
            DateTime dt1 = DateTime.ParseExact(t_od, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            DateTime dt2 = DateTime.ParseExact(t_do, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            string cel = TextBox3.Text;
            string user = User.Identity.Name;
            string id_sali = DropDownList1.SelectedValue.ToString();
            TimeSpan ts1 = dt1.TimeOfDay;
            TimeSpan ts2 = dt2.TimeOfDay;
            data_od = data_od.Date + ts1;
            data_do = data_od.Date + ts2;
            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            NpgsqlCommand terminy = new NpgsqlCommand("select termin_od, termin_do from rezerwacja", conn);
            Int32 termin = 0;
            NpgsqlCommand id = new NpgsqlCommand("select count(*) from rezerwacja", conn);
            NpgsqlCommand time_check = new NpgsqlCommand("select nr_rezerwacji from rezerwacja where (termin_od<='" + data_do + "' and termin_do>='" + data_do + "' and id_sali= '" + id_sali + "') or (termin_do>='" + data_od + "' and termin_od<='" + data_od + "'and id_sali= '" + id_sali + "')", conn);
            try
            {
                termin = (Int32)time_check.ExecuteScalar();
            }
            catch { }
            if (termin == 0)
            {
                Int64 count_rez;
                count_rez = (Int64)id.ExecuteScalar();
                count_rez += 5;
                NpgsqlCommand add = new NpgsqlCommand("insert into rezerwacja values ('" + count_rez + "', '" + id_sali + "', '" + user + "', '" + data_od + "', '" + data_do + "', '" + cel + "')", conn);
                add.ExecuteScalar();
                conn.Close();
                Label2.Text = "";
                Label3.Text = "Zarezerwowano salę";
            }
            else if (termin != 0)
            {
                Label2.Text = "Wybrany termin nie jest wolny!";
                Label3.Text = "";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            // quite complex sql statement
            string id_sali = DropDownList1.SelectedValue.ToString();
            string sql = "SELECT * FROM rezerwacja where id_sali='" + id_sali +"'";
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
}