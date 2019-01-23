using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        SqlDataReader reader = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE Username = @username AND Password=@password AND Active = 1", conn);
            cmd.Parameters.AddWithValue("username", TextBoxUsername.Text);
            cmd.Parameters.AddWithValue("password", TextBoxPassword.Text);
            reader = cmd.ExecuteReader(); 

            if (reader.HasRows)
            {
                FormsAuthentication.RedirectFromLoginPage(TextBoxUsername.Text, false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalError);", true);
                TextBoxUsername.Text = string.Empty;
                TextBoxPassword.Text = string.Empty;
            }            
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalError);", true);
        }
        finally
        {
            if (reader != null)
            {
                reader.Close();
            }
            if (conn != null) 
            {
                conn.Close();
            }
        }

    }
}