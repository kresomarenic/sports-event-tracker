using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracija_ManageSports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonNewSport_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        try
        {
            string sportName = (char.ToUpper(TextBoxSportName.Text.First()) + TextBoxSportName.Text.Substring(1).ToLower()).Trim();
            string sportLabel = TextBoxSportLabel.Text.ToUpper().Trim();

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Sport (SportLabel, SportName) VALUES (@sportLabel, @sportName)", conn);
            cmd.Parameters.AddWithValue("@sportLabel", sportLabel);
            cmd.Parameters.AddWithValue("@sportName", sportName);
            cmd.ExecuteNonQuery();            
            GridViewSports.DataBind();
            TextBoxSportName.Text = string.Empty;
            TextBoxSportLabel.Text = string.Empty;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveError);", true);
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    protected void TextBoxSportName_TextChanged(object sender, EventArgs e)
    {
        if (TextBoxSportName.Text.Length <= 3)
        {
            TextBoxSportLabel.Text = TextBoxSportName.Text.ToUpper().Substring(0);
        }
        else
        {
            TextBoxSportLabel.Text = TextBoxSportName.Text.ToUpper().Substring(0, 3);
        }
        
    }
}