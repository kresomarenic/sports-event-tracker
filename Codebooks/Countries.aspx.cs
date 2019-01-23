using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracija_ManageCountries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ButtonNewCountry_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        try
        {
            string countryName = (char.ToUpper(TextBoxCountryName.Text.First()) + TextBoxCountryName.Text.Substring(1).ToLower()).Trim();
            string countryISO = TextBoxCountryISO.Text.ToUpper().Trim();

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Country VALUES (@countryName, @countryISO)", conn);
            cmd.Parameters.AddWithValue("@countryName", countryName);
            cmd.Parameters.AddWithValue("@countryISO", countryISO);
            cmd.ExecuteNonQuery();           
            GridViewCountries.DataBind();
            TextBoxCountryName.Text = string.Empty;
            TextBoxCountryISO.Text = string.Empty;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveError);", true);
        }
        finally
        {
            conn.Close();
        }





        
    }
}