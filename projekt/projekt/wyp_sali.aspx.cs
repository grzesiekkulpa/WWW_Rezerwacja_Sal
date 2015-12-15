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
    public partial class wyp_sali : System.Web.UI.Page
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

                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();

                    NpgsqlCommand command1 = new NpgsqlCommand("select * from sala", conn);
                    NpgsqlCommand command2 = new NpgsqlCommand("select * from wyposazenie", conn);
                   try
                    {
                        if (DropDownList1.Items.Count == 0 && DropDownList2.Items.Count == 0)
                        {
                            
                            NpgsqlCommand count = new NpgsqlCommand("select count(*) from wyposazenie", conn);
                            int coun = (Int32)count.ExecuteScalar();
                            string[] tab1 = new string[coun];
                            NpgsqlDataReader dr1 = command1.ExecuteReader();
                            int i = 0;
                            {
                                while (dr1.Read())
                                {
                                    tab1[i] = Convert.ToString(dr1[0]);
                                    DropDownList1.Items.Insert(i, tab1[i]);
                                    i++;
                                }

                            }
                            NpgsqlDataReader dr2 = command2.ExecuteReader();
                            string[] tab2 = new string[500];
                            int j = 0;
                            {
                                while (dr2.Read())
                                {
                                    tab2[j] = Convert.ToString(dr2[0]);
                                    DropDownList2.Items.Insert(j, tab2[j]);
                                    j++;
                                }

                            }
                        }
                    }
                    finally
                    {

                        conn.Close();
                    }


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
            string checks;
            string checkw;
            string id_sali = DropDownList1.SelectedItem.ToString();
            string id_wyp = DropDownList2.SelectedItem.ToString();
            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            NpgsqlCommand check1 = new NpgsqlCommand("select id_sali from wyp_sali where id_sali = '" + id_sali + "'", conn);
            NpgsqlCommand check2 = new NpgsqlCommand("select id_wyp from wyp_sali where id_sali = '" + id_sali + "'and id_wyp = '" + id_wyp + "'", conn);
            checks = (String)check1.ExecuteScalar();
            checkw = (String)check2.ExecuteScalar();
            if (checks == id_sali && checkw == id_wyp)
            {
                Label2.Text = "";
                Label3.Text = "Wyposażenie jest już przypisane do sali!";
            }
            else if (checkw != id_wyp)
            {
                NpgsqlCommand add = new NpgsqlCommand("insert into wyp_sali values ('" + id_wyp + "', '" + id_sali + "')", conn);
                add.ExecuteScalar();
                conn.Close();
                Label2.Text = "Dodano wyposażenie do sali!";
                Label3.Text = "";
            }
        }
    }
}