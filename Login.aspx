<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card mx-auto" style="width: 18rem;">
        <h5 class="card-header text-center">Prijava</h5>
        <div class="card-body">
            <div class="form-group">
                <asp:Label ID="LabelUsername" runat="server" Text="Korisničko ime"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxUsername" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelPassword" runat="server" Text="Lozinka"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="text-center">
                <asp:Button CssClass="btn btn-primary" ID="ButtonLogin" runat="server" Text="Prijava" OnClick="ButtonLogin_Click" />
            </div>
        </div>
    </div>

    <div class="modal modal-fade" id="modalError" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Neuspješna prijava</h5>
                </div>
                <div class="modal-body">
                    <h6>
                        Pogrešno korisničko ime ili lozinka.                        
                    </h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal">U redu</button>                    
                </div>
            </div>
        </div>
    </div>

</asp:Content>

