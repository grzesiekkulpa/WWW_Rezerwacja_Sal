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
    public partial class user_szukaj_sali : System.Web.UI.Page
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

                    NpgsqlCommand command1 = new NpgsqlCommand("select typ_sali from typ_sali", conn);
                    //wypełnianie rozwijanej listy z nazwami sal
                    try
                    {
                        if (DropDownList1.Items.Count == 0 && DropDownList1.Items.Count == 0)
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

                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();

                    // quite complex sql statement
                    string sql = "SELECT nazwa FROM wyposazenie";
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
                    CheckBoxList1.DataSource = dt;
                    CheckBoxList1.DataTextField = "nazwa";
                    CheckBoxList1.DataValueField = "nazwa";
                    CheckBoxList1.DataBind();
                    // since we only showing the result we don't need connection anymore
                    conn.Close();
                }
        }

        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("index.aspx");
        }


   


    }
}