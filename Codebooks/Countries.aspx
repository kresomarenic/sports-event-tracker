<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Countries.aspx.cs" Inherits="Administracija_ManageCountries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-4">
            <div class="card mx-auto" style="width: 18rem;">
                <h5 class="card-header text-center">Nova država</h5>
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="LabelCountryName" runat="server" Text="Ime države"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxCountryName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountryName" runat="server" Display="Dynamic" ErrorMessage="Obavezno polje" ControlToValidate="TextBoxCountryName" ForeColor="Red"></asp:RequiredFieldValidator>                        
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCountryISO" runat="server" Text="ISO oznaka"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxCountryISO" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountryISO" runat="server" Display="Dynamic" ErrorMessage="Obavezno polje" ControlToValidate="TextBoxCountryISO" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorCountryName" Display="Dynamic" runat="server" ControlToValidate="TextBoxCountryISO" ErrorMessage="ISO oznaka mora imati točno 3 znaka" ValidationExpression="^[A-Za-z]{3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <asp:Button CssClass="btn btn-primary" ID="ButtonNewCountry" runat="server" Text="Unesi" OnClick="ButtonNewCountry_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-8">
            <asp:SqlDataSource ID="SqlDataSourceCountries" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [CountryID], [CountryName], [CountryISO] FROM [Country]" DeleteCommand="DELETE FROM Country WHERE CountryID = @CountryID">
                <DeleteParameters>
                    <asp:Parameter Name="CountryID" />
                </DeleteParameters>                
            </asp:SqlDataSource>
            <asp:GridView CssClass="mx-auto table table-striped table-light table-hover" ID="GridViewCountries" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountries" DataKeyNames="CountryID">
                <Columns>
                    <asp:BoundField DataField="CountryName" ItemStyle-CssClass="align-middle" HeaderText="Naziv države" SortExpression="CountryName" />
                    <asp:BoundField DataField="CountryISO" ItemStyle-CssClass="align-middle" HeaderText="ISO oznaka" SortExpression="CountryISO" />
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="align-middle text-center" ControlStyle-CssClass="btn btn-link" DeleteText="Obriši" ShowDeleteButton="True"></asp:CommandField>                   
                </Columns>
                <HeaderStyle CssClass="thead-light" />
            </asp:GridView>
        </div>
    </div>

    <div class="modal modal-fade" id="modalSaveSuccess" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Info</h5>
                </div>
                <div class="modal-body">
                    <h6>Država uspješno unesena.</h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal">U redu</button>                    
                </div>
            </div>
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
                        Neuspješno spremanje države.
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

