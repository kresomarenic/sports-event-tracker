using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracija_AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonAddUser_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Admin (AdminName, AdminSurname, Username, Password) VALUES (@name, @surname, @username, @password)", conn);
            cmd.Parameters.AddWithValue("@name", TextBoxFirstname.Text);
            cmd.Parameters.AddWithValue("@surname", TextBoxLastname.Text);
            cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text);
            cmd.Parameters.AddWithValue("@password", TextBoxPassword.Text);
            cmd.ExecuteNonQuery();
            LabelMessage.Text = "Korisnik " + TextBoxUsername.Text + " usješno kreiran.";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveSuccess);", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveError);", true);
        }
        finally
        {
            TextBoxFirstname.Text = string.Empty;
            TextBoxLastname.Text = string.Empty;
            TextBoxUsername.Text = string.Empty;
            TextBoxPassword.Text = string.Empty;
            TextBoxRepeatedPassword.Text = string.Empty;
            if (conn != null)
            {
                conn.Close();
            }            
        }


    }
}