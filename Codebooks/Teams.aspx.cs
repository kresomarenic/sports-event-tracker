using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sifrarnici_ManageTeams : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonNewCountry_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        try
        {
            string teamName = (char.ToUpper(TextBoxTeamName.Text.First()) + TextBoxTeamName.Text.Substring(1).ToLower()).Trim();
            int countryId = int.Parse(DropDownTeamCountry.SelectedValue);
            int sportId = int.Parse(DropDownListTeamSport.SelectedValue);

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Team VALUES (@teamName, @countryId, @sportId)", conn);
            cmd.Parameters.AddWithValue("@teamName", teamName);
            cmd.Parameters.AddWithValue("@countryId", countryId);
            cmd.Parameters.AddWithValue("@sportId", sportId);
            cmd.ExecuteNonQuery();            
            GridViewTeams.DataBind();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveError);", true);
        }
        finally
        {
            TextBoxTeamName.Text = string.Empty;
            DropDownTeamCountry.SelectedIndex = 0;
            DropDownListTeamSport.SelectedIndex = 0;
            if (conn != null)
            {
                conn.Close();
            }           
        }
    }

    

}