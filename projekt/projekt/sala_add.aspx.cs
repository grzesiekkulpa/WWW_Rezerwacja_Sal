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
    public partial class sala_add : System.Web.UI.Page
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

                    NpgsqlCommand command = new NpgsqlCommand("select * from typ_sali", conn);
                    //NpgsqlCommand count = new NpgsqlCommand("select count(*) from typ_sali", conn);
                    //int coun;
                    //coun = (int)count.ExecuteScalar();
                    
                    try
                    {
                        if (DropDownList1.Items.Count == 0)
                        {
                            NpgsqlDataReader dr = command.ExecuteReader();
                            string[] tab = new string[10];
                            int i = 0;
                            {
                                while (dr.Read())
                                {
                                    tab[i] = Convert.ToString(dr[0]);
                                    DropDownList1.Items.Insert(i, tab[i]);
                                    i++;
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
            string check;
            string id_sali = TextBox1.Text;
            int pojemnosc = System.Int32.Parse(TextBox2.Text);
            string typ = DropDownList1.SelectedItem.ToString();

            NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
            conn.Open();
            NpgsqlCommand check1 = new NpgsqlCommand("select id_sali from sala where id_sali = '" + id_sali + "'", conn);
            check = (String)check1.ExecuteScalar();
            if (check != id_sali)
            {
                NpgsqlCommand add = new NpgsqlCommand("insert into sala values ('" + id_sali + "', '" + typ + "', '" + pojemnosc + "')", conn);
                add.ExecuteScalar();
                conn.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";
                Label2.Text = "Dodano salę!";
                Label3.Text = "";
            }
            else if (check == id_sali)
            {
                Label2.Text = "";
                Label3.Text = "Sala już istnieje!";
            }
        
        }

        
    }
}