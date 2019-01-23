<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Administracija_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col">
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [AdminID], [AdminName], [AdminSurname], [Username], [Active] FROM [Admin]" DeleteCommand="DELETE FROM Admin WHERE AdminID = @AdminID" UpdateCommand="UPDATE Admin SET AdminName = @AdminName, AdminSurname = @AdminSurname, Username = @Username, Active = @Active WHERE AdminID = @AdminID">
                <DeleteParameters>
                    <asp:Parameter Name="AdminID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AdminName" />
                    <asp:Parameter Name="AdminSurname" />
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="AdminID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView CssClass="mx-auto table table-striped table-light table-hover" ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsers" DataKeyNames="AdminID" OnRowUpdating="GridViewUsers_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="AdminName" ItemStyle-CssClass="align-middle" HeaderText="Ime" SortExpression="AdminName" />
                    <asp:BoundField DataField="AdminSurname" ItemStyle-CssClass="align-middle" HeaderText="Prezime" SortExpression="AdminSurname" />
                    <asp:BoundField DataField="Username" ItemStyle-CssClass="align-middle" HeaderText="Korisničko ime" SortExpression="Username" />                    
                    <asp:CheckBoxField DataField="Active" ItemStyle-CssClass="align-middle text-center"  HeaderText="Aktivan" SortExpression="Active" />                    
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-link" ShowEditButton="True" ShowHeader="True" CancelText="Odustani" EditText="Uredi" UpdateText="Spremi" > </asp:CommandField>
                    <asp:CommandField ButtonType="Button" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-link text-center" DeleteText="Obriši" ShowDeleteButton="True"> </asp:CommandField>                        
                    
                </Columns>
                <HeaderStyle CssClass="thead-light"/>               
            </asp:GridView>
        </div>
    </div>

    <div class="modal modal-fade" id="modalError" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Neuspješno ažuriranje</h5>
                </div>
                <div class="modal-body">
                    <h6>
                        Nije moguće deaktivirati prijavljenog korisnika.                        
                    </h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal">U redu</button>                    
                </div>
            </div>
        </div>
    </div>

</asp:Content>

