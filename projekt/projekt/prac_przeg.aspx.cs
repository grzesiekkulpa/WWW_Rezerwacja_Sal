using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Npgsql;
using NpgsqlTypes;
namespace projekt
{
    public partial class prac_przeg : System.Web.UI.Page
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
            string sql = "SELECT * FROM pracownicy";
            // data adapter making request from our connection
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conn);
            // i always reset DataSet before i do
            // something with it.... i don't know why :-)
            ds.Reset();
            // filling DataSet with result from NpgsqlDataAdapter
            da.Fill(ds);
            // since it C# DataSet can handle multiple tables, we will select first
            dt = ds.Tables[0];
            dt.Columns.Add("Usuń");
            dt.Columns.Add("Edytuj");

         

            // connect grid to DataTable
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("index.aspx");
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                
                    LinkButton lb = new LinkButton();
                    lb.Text = "Usuń";
                    lb.CommandName = "Usuń użytkownika";
                    lb.Command += LinkButton_Command;
                    row.Cells[8].Controls.Add(lb);
                    LinkButton lbe = new LinkButton();
                    lbe.Text = "Edytuj";
                    lbe.CommandName = "Edytuj użytkownika";
                    lbe.Command += LinkButton_CommandE;
                    row.Cells[9].Controls.Add(lbe);
                }
            } 
        }
        protected void LinkButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Usuń użytkownika")
            {

                    LinkButton lb = (LinkButton)sender;
                    int rindex = (((GridViewRow)(((LinkButton)(sender)).Parent.BindingContainer))).RowIndex;
                    string user_id = GridView1.Rows[rindex].Cells[0].Text;
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    NpgsqlCommand delete = new NpgsqlCommand("delete from pracownicy where id_prac = '" + user_id + "'", conn);
                    delete.ExecuteScalar();
                    conn.Close();
                    GridView1.DataBind();
                    Response.Redirect(Request.RawUrl, true);
            }
        }
        protected void LinkButton_CommandE(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edytuj użytkownika")
            {
                //This is to test  
                int rindex = (((GridViewRow)(((LinkButton)(sender)).Parent.BindingContainer))).RowIndex;
                NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                conn.Open();
                string user_id = GridView1.Rows[rindex].Cells[0].Text;
                NpgsqlCommand select = new NpgsqlCommand("select id_prac from pracownicy where id_prac = '" + user_id + "'", conn);
                select.ExecuteScalar();
                conn.Close();
                Response.Redirect("prac_add.aspx?id="+user_id.ToString());
            }
        }
    }
}