using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Web.Security;

namespace projekt
{
    public partial class index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void buttzaloguj_Click(object sender, EventArgs e)
        {
            if(cbadmin.Checked==true)
                try
                {
                    string login = tbuser.Text.ToString();
                    string pass = tbpass.Text.ToString();
                    string passdb;
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    NpgsqlCommand command = new NpgsqlCommand("select haslo from pracownicy where id_prac = '" + login + "'", conn);
                     try
                         {
                            passdb = (String)command.ExecuteScalar();
                            NpgsqlCommand comm_admin = new NpgsqlCommand("select admin from pracownicy where id_prac = '" + login + "'", conn);
                            Boolean admin;
                            admin = (Boolean)comm_admin.ExecuteScalar();
                            conn.Close();
                            if (passdb == pass && admin == true)
                            {
                                FormsAuthentication.Initialize();
                                
                                
                                //Tworzymy bilet
                                FormsAuthenticationTicket bilet = new FormsAuthenticationTicket(
                                1, //wersja biletu
                                login, //login
                                DateTime.Now, //data i godzina założenia pliku cookie
                                DateTime.Now.AddMinutes(30), //czas wygaśnięcia
                                false, //czy cookie ma być trwałe
                                "admins",
                                FormsAuthentication.FormsCookiePath); //adres strony
                                //Umieszczenie biletu na zdalnym komputerze użytkownika
                                HttpCookie cookie = new HttpCookie(
                                FormsAuthentication.FormsCookieName,
                                FormsAuthentication.Encrypt(bilet));
                                Response.Cookies.Add(cookie);
                              
                                Response.Redirect("admin_start.aspx");
                            }
                            else if (passdb != pass || admin==false)
                            {
                                Label1.Visible=true;
                            }
                         }
                     catch (Exception ex)
                     {
                         Response.Write("Błędne dane logowania!");
                     }
                   
                }
                catch(Exception err)
                {
                    
                }
            else if ((cbadmin.Checked == false)) {
                try
                {
                    string login = tbuser.Text.ToString();                 
                    string pass = tbpass.Text.ToString();
                    string passdb;
                    NpgsqlConnection conn = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=projekt;Database=projekt;");
                    conn.Open();
                    NpgsqlCommand command = new NpgsqlCommand("select haslo from pracownicy where id_prac = '" + login + "'", conn);
                    try
                    {
                        passdb = (String)command.ExecuteScalar();
                        conn.Close();
                        if (passdb == pass)
                        {
                            //Roles.CreateRole("admins");
                            //Roles.AddUserToRole(login, "admins");
                            //Tworzymy bilet
                            FormsAuthenticationTicket bilet = new FormsAuthenticationTicket(
                            1, //wersja biletu
                            login, //login
                            DateTime.Now, //data i godzina założenia pliku cookie
                            DateTime.Now.AddMinutes(30), //czas wygaśnięcia
                            false, //czy cookie ma być trwałe
                            "users",
                            FormsAuthentication.FormsCookiePath); //adres strony
                            //Umieszczenie biletu na zdalnym komputerze użytkownika
                            HttpCookie cookie = new HttpCookie(
                            FormsAuthentication.FormsCookieName,
                            FormsAuthentication.Encrypt(bilet));
                            Response.Cookies.Add(cookie);
                            Response.Redirect("user.aspx");
                        }
                        else if (passdb != pass)
                        {
                            Label1.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Błędne dane logowania!");
                    }

                }
                catch (Exception err)
                {

                }
            }

        }
    }
}