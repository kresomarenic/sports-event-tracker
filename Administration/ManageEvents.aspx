<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageEvents.aspx.cs" Inherits="Administracija_ManageEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="card mx-auto" style="width: 70rem;">
            <h5 class="card-header text-center">Unos novog sportskog događaja</h5>
            <div class="card-body">
                <div class="row">
                <div class="col-2">
                    <div class="form-group">
                        <asp:Label ID="LabelSportName" runat="server" Text="Sport"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceSports" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT SportID, SportName FROM Sport WHERE Active = 1"></asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListSports" CssClass="form-control" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceSports" DataTextField="SportName" AutoPostBack="true" DataValueField="SportID" OnSelectedIndexChanged="DropDownListSports_SelectedIndexChanged" >
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>                        
                    </div>                    
                </div>
                <div class="col-5">
                    <div class="form-group">
                        <asp:Label ID="LabelHostName" runat="server" Text="Domaćin"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceHostTeam" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT TeamID, TeamName FROM Team WHERE (SportID = @SportID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListSports" Name="SportID" PropertyName="SelectedValue" />                                
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListHostTeam" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceHostTeam" DataTextField="TeamName" DataValueField="TeamID" OnSelectedIndexChanged="DropDownListHostTeam_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>                        
                    </div>
                   <div class="form-group">
                        <asp:Label ID="LabelGuestName" runat="server" Text="Gost"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceGuestTeam" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT TeamID, TeamName FROM Team WHERE (SportID = @SportID) AND (TeamID != @TeamID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListSports" Name="SportID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropDownListHostTeam" Name="TeamID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListGuestTeam" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceGuestTeam" DataTextField="TeamName" DataValueField="TeamID" AutoPostBack="True"></asp:DropDownList>                        
                    </div>
                </div>
                 <div class="col-3">
                    <div class="form-group">
                        <asp:Label ID="LabelEventDate" runat="server" Text="Datum"></asp:Label>                        
                        <asp:TextBox CssClass="form-control" ID="TextBoxEventDate" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelEventTime" runat="server" Text="Vrijeme"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxEventTime" runat="server" TextMode="Time"></asp:TextBox>
                    </div>                                        
                </div>
                <div class="col-2">
                    <div class="form-group">
                        <asp:Label ID="LabelActive" runat="server" Text="Aktivan prikaz"></asp:Label>                        
                        <asp:RadioButtonList ID="RadioButtonListActive" CssClass="form-check" runat="server">
                            <asp:ListItem Value="1" Text="da" />
                            <asp:ListItem Value="0" Text="ne" Selected="True" />                            
                        </asp:RadioButtonList>
                    </div>  
                </div>
                    </div>
                <div class="text-center">
                    <asp:Button CssClass="btn btn-primary" ID="ButtonNewEvent" runat="server" Text="Spremi novi događaj" OnClick="ButtonNewEvent_Click" />
                </div>
            </div>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="col">
            <asp:SqlDataSource ID="SqlDataSourceManageEvents" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT 
e.EventID,
(th.TeamName + ' - ' + tg.TeamName) as EventName,
e.EventStart as EventDate,
e.EventStart as EventTime,
e.EventHostResult, e.EventGuestResult,
e.SportID, s.SportName, e.Active
FROM Event e
JOIN Team th ON e.HostID = th.TeamID
JOIN Team tg ON e.GuestID = tg.TeamID
JOIN Sport s ON e.SportID = s.SportID" UpdateCommand="UPDATE Event
SET EventHostResult = @EventHostResult, EventGuestResult = @EventGuestResult, Active = @Active
WHERE EventID = @EventID">
                <UpdateParameters>
                    <asp:Parameter Name="EventHostResult" />
                    <asp:Parameter Name="EventGuestResult" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="EventID" />
                </UpdateParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="GridViewManageEvents" CssClass="mx-auto table table-striped table-light table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="SqlDataSourceManageEvents">
                <Columns>
                    <asp:BoundField DataField="SportName" ItemStyle-CssClass="align-middle" HeaderText="Naziv sporta" ReadOnly="True" SortExpression="SportName" />
                    <asp:BoundField DataField="EventDate" ItemStyle-CssClass="align-middle" HeaderText="Datum" ReadOnly="True" DataFormatString="{0:dd.MM.yyyy}" SortExpression="EventDate" />
                    <asp:BoundField DataField="EventTime" ItemStyle-CssClass="align-middle" HeaderText="Vrijeme" ReadOnly="True" DataFormatString="{0:HH:mm}"  SortExpression="EventTime" />
                    <asp:BoundField DataField="EventName" ItemStyle-CssClass="align-middle" HeaderText="Događaj" ReadOnly="True" SortExpression="EventName" />
                    <asp:BoundField DataField="EventHostResult" ItemStyle-CssClass="align-middle text-center" HeaderText="Rezultat domaćina" SortExpression="EventHostResult" />
                    <asp:BoundField DataField="EventGuestResult" ItemStyle-CssClass="align-middle text-center" HeaderText="Rezultat gosta" SortExpression="EventGuestResult" />
                    <asp:CheckBoxField DataField="Active" ItemStyle-CssClass="align-middle text-center" HeaderText="Prikazano" SortExpression="Active" />
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-link" CancelText="Odustani" EditText="Uredi" ShowEditButton="True" UpdateText="Spremi" />
                </Columns>
            </asp:GridView>
            
        </div>
    </div>

        <div class="modal modal-fade" id="modalSaveError" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Error</h5>
                </div>
                <div class="modal-body">
                    <h6>Neuspješno dodavanje novog događaja.
                        <br />
                        Kontaktirajte administratora.
                    </h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal">U redu</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

