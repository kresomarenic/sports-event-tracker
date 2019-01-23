using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracija_ManageEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void ButtonNewEvent_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;
        try
        {
            int hostTeamId = int.Parse(DropDownListHostTeam.SelectedValue);
            int guestTeamId = int.Parse(DropDownListGuestTeam.SelectedValue);

            string date = TextBoxEventDate.Text;
            string time = TextBoxEventTime.Text;
            DateTime startDateTime = DateTime.Parse(date + " " + time);

            int sportId = int.Parse(DropDownListSports.SelectedValue);
            int active = int.Parse(RadioButtonListActive.SelectedValue);

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Event (HostID, GuestID, EventStart, SportID, Active) VALUES (@hostId, @guestId, @startDateTime, @sportId, @active)", conn);
            cmd.Parameters.AddWithValue("@hostId", hostTeamId);
            cmd.Parameters.AddWithValue("@guestId", guestTeamId);
            cmd.Parameters.AddWithValue("@startDateTime", startDateTime);
            cmd.Parameters.AddWithValue("@sportId", sportId);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.ExecuteNonQuery();
            GridViewManageEvents.DataBind();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalSaveError);", true);
            throw ex;
        }
        finally
        {            
            DropDownListSports.SelectedIndex = 0;
            DropDownListHostTeam.Items.Clear();
            DropDownListGuestTeam.Items.Clear();
            TextBoxEventDate.Text = string.Empty;
            TextBoxEventTime.Text = string.Empty;
            RadioButtonListActive.SelectedValue = "0";
            if (conn != null)
            {
                conn.Close();
            }
            
        }
    }

    protected void DropDownListSports_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListHostTeam.Items.Clear();
        DropDownListGuestTeam.Items.Clear();
        DropDownListHostTeam.DataBind();
        DropDownListGuestTeam.DataBind();
    }

    protected void DropDownListHostTeam_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListGuestTeam.DataBind();
    }


    protected void GridViewManageEvents_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}