<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sports.aspx.cs" Inherits="Administracija_ManageSports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <div class="row">
        <div class="col-4">
            <div class="card mx-auto" style="width: 18rem;">
                <h5 class="card-header text-center">Unos novog sporta</h5>
                <div class="card-body">
                    <div class="form-group">                        
                        <asp:Label ID="LabelSportName" runat="server" Text="Naziv sporta"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxSportName" ValidationGroup="saveSport" runat="server" AutoPostBack="True" OnTextChanged="TextBoxSportName_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSportName" ValidationGroup="saveSport" runat="server" Display="Dynamic" ErrorMessage="Obavezno polje" ControlToValidate="TextBoxSportName" ForeColor="Red"></asp:RequiredFieldValidator>                        
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelSportLabel" runat="server" Text="Oznaka sporta"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxSportLabel" ValidationGroup="saveSport" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSportLabel" ValidationGroup="saveSport" runat="server" Display="Dynamic" ErrorMessage="Obavezno polje" ControlToValidate="TextBoxSportLabel" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorSportLabel" ValidationGroup="saveSport" Display="Dynamic" runat="server" ControlToValidate="TextBoxSportLabel" ErrorMessage="Oznaka mora imati točno 3 znaka" ValidationExpression="^[A-Za-z]{3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <asp:Button CssClass="btn btn-primary" ID="ButtonNewSport" runat="server" Text="Unesi" OnClick="ButtonNewSport_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-8">
            <asp:SqlDataSource ID="SqlDataSourceSports" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [SportID], [SportLabel], [SportName], [Active] FROM [Sport]" DeleteCommand="DELETE FROM Sport WHERE SportID = @SportID" UpdateCommand="UPDATE Sport
SET SportLabel = @SportLabel, SportName =@SportName, Active = @Active
WHERE SportID = @SportID">
                <DeleteParameters>
                    <asp:Parameter Name="SportID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SportLabel" />
                    <asp:Parameter Name="SportName" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="SportID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView CssClass="mx-auto table table-striped table-light table-hover" ID="GridViewSports" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSports" DataKeyNames="SportID">                
                <Columns>
                    <asp:BoundField DataField="SportName" ItemStyle-CssClass="align-middle" HeaderText="Naziv sporta" SortExpression="SportName" />
                    <asp:BoundField DataField="SportLabel" ItemStyle-CssClass="align-middle" HeaderText="Oznaka sporta" SortExpression="SportLabel" />                                
                    <asp:CheckBoxField DataField="Active" ItemStyle-CssClass="align-middle text-center" HeaderText="Aktivan" SortExpression="Active" />
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="align-middle text-center" ControlStyle-CssClass="btn btn-link" CancelText="Odustani" EditText="Uredi" ShowEditButton="True" UpdateText="Spremi" CausesValidation="True" />
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="align-middle text-center" ControlStyle-CssClass="btn btn-link" DeleteText="Obriši" ShowDeleteButton="True" />
              
                     </Columns>
                <HeaderStyle CssClass="thead-light" />
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
                    <h6>Neuspješno spremanje novog sporta.
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

