using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        populateGridViewEvents();
    }

    private void populateGridViewEvents()
    {
        SqlConnection conn = null;
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SportEventTrackerDB"].ConnectionString);
            conn.Open();

            string cmdText = "SELECT ";            
            cmdText += "(th.TeamName + ' - ' + tg.TeamName) as EventName, ";
            cmdText += "e.EventStart as EventDate, ";
            cmdText += "e.EventStart as EventTime, ";
            cmdText += "(CONVERT(varchar, e.EventHostResult) + ' : ' + CONVERT(varchar, e.EventGuestResult)) as EventResult, ";
            cmdText += "e.SportID ";
            cmdText += "FROM Event e ";
            cmdText += "JOIN Team th ON e.HostID = th.TeamID ";
            cmdText += "JOIN Team tg ON e.GuestID = tg.TeamID ";
            cmdText += "JOIN Sport s ON e.SportID = s.SportID ";
            cmdText += "WHERE e.Active = 1";

            cmdText += checkSportFilter();          

            SqlCommand cmd = new SqlCommand(cmdText, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            GridViewEvents.DataSource = reader;
            GridViewEvents.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    private string checkSportFilter()
    {
        string newCondition = "";

        if (DropDownListFilterSport.SelectedIndex != 0)
        {            
            newCondition += " AND s.SportID = " + DropDownListFilterSport.SelectedValue;
        }
        return newCondition;
    }

    protected void DropDownListFilterSport_SelectedIndexChanged(object sender, EventArgs e)
    {
        populateGridViewEvents();
    }
}