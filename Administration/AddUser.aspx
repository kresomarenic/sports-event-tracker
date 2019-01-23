<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Administracija_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="card mx-auto" style="width: 30rem;">
        <h5 class="card-header text-center">Registracija novog korisnika</h5>
        <div class="card-body">
            <div class="form-group">
                <asp:Label ID="LabelFirstname" runat="server" Text="Ime"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxFirstname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ControlToValidate="TextBoxFirstname" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelLastname" runat="server" Text="Prezime"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxLastname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastname" ControlToValidate="TextBoxLastname" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelUsername" runat="server" Text="Korisničko ime"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" ControlToValidate="TextBoxUsername" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>            
            </div>
            <div class="form-group">
                <asp:Label ID="LabelPassword" runat="server" Text="Lozinka"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ControlToValidate="TextBoxPassword" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>            
            </div>
            <div class="form-group">
                <asp:Label ID="LabelRepeatedPassword" runat="server" Text="Ponovljena lozinka"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxRepeatedPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRepeatedPassword" ControlToValidate="TextBoxRepeatedPassword" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Obavezan unos"></asp:RequiredFieldValidator>            
                <asp:CompareValidator ID="CompareValidatorRepeatedPassword" runat="server" ControlToValidate="TextBoxRepeatedPassword" ErrorMessage="Lozinke se moraju podudarati" Display="Dynamic" ControlToCompare="TextBoxPassword" ForeColor="Red"></asp:CompareValidator>
            </div>
            <div class="text-center">
                <asp:Button CssClass="btn btn-primary" ID="ButtonAddUser" runat="server" Text="Dodaj novog korisnika" OnClick="ButtonAddUser_Click" />
            </div>
        </div>
    </div>

    <div class="modal modal-fade" id="modalSaveSuccess" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Info</h5>
                </div>
                <div class="modal-body">
                    <h6>
                        <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                    </h6>
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
                    <h6>Neuspješno kreiranje novog korisnika.
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

