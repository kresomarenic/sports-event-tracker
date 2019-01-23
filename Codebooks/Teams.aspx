<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teams.aspx.cs" Inherits="Sifrarnici_ManageTeams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">

        <div class="col-4">
            <div class="card mx-auto" style="width: 18rem;">
                <h5 class="card-header text-center">Unos novog kluba</h5>
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="LabelTeamName" runat="server" Text="Naziv kluba"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxTeamName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTeamName" ControlToValidate="TextBoxTeamName" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCountryTeamCountry" runat="server" Text="Država"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceTeamCountry" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [Country]"></asp:SqlDataSource>
                        <asp:DropDownList CssClass="form-control" ID="DropDownTeamCountry" runat="server" DataSourceID="SqlDataSourceTeamCountry" DataTextField="CountryName" DataValueField="CountryID"></asp:DropDownList>                        
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelSport" runat="server" Text="Sport"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceTeamSport" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [SportID], [SportName] FROM [Sport] WHERE [Active] = 1"></asp:SqlDataSource>
                        <asp:DropDownList CssClass="form-control" ID="DropDownListTeamSport" runat="server" DataSourceID="SqlDataSourceTeamSport" DataTextField="SportName" DataValueField="SportID"></asp:DropDownList>                        
                    </div>
                    <div>
                        <asp:Button CssClass="btn btn-primary" ID="ButtonNewCountry" runat="server" Text="Unesi" OnClick="ButtonNewCountry_Click"/>
                    </div>
                </div>
            </div>
        </div>
          

        <div class="col-8">
            <asp:SqlDataSource ID="SqlDataSourceTeams" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT Team.TeamID, Team.TeamName, Country.CountryName, Sport.SportID, Sport.SportName FROM Team INNER JOIN Country ON Team.CountryID = Country.CountryID INNER JOIN Sport ON Team.SportID = Sport.SportID" DeleteCommand="DELETE FROM Team WHERE TeamID = @TeamID">
                <DeleteParameters>
                    <asp:Parameter Name="TeamID" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:GridView CssClass="mx-auto table table-striped table-light table-hover" ID="GridViewTeams" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTeams" DataKeyNames="TeamID">
                <Columns>                    
                    <asp:BoundField DataField="TeamName" ItemStyle-CssClass="align-middle" HeaderText="Naziv kluba" SortExpression="TeamName" />                    
                    <asp:BoundField DataField="SportName" ItemStyle-CssClass="align-middle" HeaderText="Sport" SortExpression="SportName" />
                    <asp:BoundField DataField="CountryName" ItemStyle-CssClass="align-middle" HeaderText="Država" SortExpression="CountryName" />
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="align-middle text-center" ControlStyle-CssClass="btn btn-link" DeleteText="Obriši" ShowDeleteButton="True" />
                </Columns>
                <HeaderStyle CssClass="thead-light" />
                <PagerStyle CssClass="pagination page-item page-link" />
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
                    <h6>
                        Neuspješno spremanje novog kluba.
                        <br />
                        Molim kontaktirajte administratora.
                    </h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal">U redu</button>                    
                </div>
            </div>
        </div>
    </div>


</asp:Content>

