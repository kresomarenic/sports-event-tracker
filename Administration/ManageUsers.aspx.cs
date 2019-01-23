using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracija_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string loggedUser = User.Identity.Name;
        string userToUpdate = e.OldValues["Username"].ToString();
        bool active = Convert.ToBoolean(e.NewValues["Active"]);
        if (!active && loggedUser == userToUpdate)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "openModal(modalError);", true);
            e.Cancel = true;
            GridViewUsers.EditIndex = -1;
        }
    }
}