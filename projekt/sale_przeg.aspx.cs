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
    public partial class sale_przeg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
            string sql = "SELECT * FROM sala";
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

        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("index.aspx");
        }
    }
}