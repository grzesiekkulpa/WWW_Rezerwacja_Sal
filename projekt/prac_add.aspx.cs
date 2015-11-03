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
    public partial class prac_add : System.Web.UI.Page
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

            string key = "id";
            //string value = Request.Params[key];
            string value = Request.QueryString["id"];
            if (value == null)
            {
                //URL nie zawierał parametru ‘key’
            }
            else
            {
                TextBox1.Text = value;
                //URL zawiera parametr ‘key’
            }
        }

        protected void btlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user_id, haslo, imie, nazwisko, kat, email, check;
            int nr_tel;
            Boolean admin=false;
            user_id = TextBox1.Text;
            haslo = TextBox2.Text;
            imie = TextBox4.Text;
            nazwisko = TextBox5.Text;
            kat = TextBox6.Text;
            email = TextBox7.Text; 
            nr_tel = System.Int32.Parse(TextBox8.Text);
            if (CheckBox1.Checked == true) admin = true;
            else if(CheckBox1.Checked == false) admin = false;
            try
            {
                NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                conn.Open();
                NpgsqlCommand check1 = new NpgsqlCommand("select id_prac from pracownicy where id_prac = '" + user_id + "'", conn);
                check = (String)check1.ExecuteScalar();
                
                
                if (check != user_id)
                {
                    NpgsqlCommand command = new NpgsqlCommand("insert into pracownicy values('" + user_id + "', '" + haslo + "', '" + imie + "', '" + nazwisko + "','" + kat + "','" + email + "', '" + nr_tel + "', '" + admin + "')", conn);
                    command.ExecuteScalar();
                    conn.Close();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    Label3.Text = "Użytkownik został dodany!";
                    Label2.Text = "";

                }
                else if (check == user_id)
                {
                    Label2.Text = "Użytkownik już istnieje!";
                    Label3.Text = "";
                }

            }
            catch 
            { 
            }

        }
    }
}