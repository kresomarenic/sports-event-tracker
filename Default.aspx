<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
        <div class="col-4">
            <div class="card mx-auto" style="width: 18rem;">
                <h5 class="card-header text-center">Filter</h5>
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="LabelSport" runat="server" Text="Odaberite sport"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceFilterSport" runat="server" ConnectionString="<%$ ConnectionStrings:SportEventTrackerDB %>" SelectCommand="SELECT [SportID], [SportName] FROM [Sport] WHERE [Active] = 1"></asp:SqlDataSource>
                        <asp:DropDownList CssClass="form-control" ID="DropDownListFilterSport" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceFilterSport" DataTextField="SportName" DataValueField="SportID" AutoPostBack="True" OnSelectedIndexChanged="DropDownListFilterSport_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>                        
                    </div>               
                </div>
            </div>            
        </div>
        

        <div class="col-8">                  
            <asp:GridView ID="GridViewEvents" CssClass="mx-auto table table-striped table-light table-hover" runat="server" AutoGenerateColumns="False">
                <Columns>                    
                    <asp:BoundField DataField="EventDate" ItemStyle-CssClass="align-middle" HeaderText="Datum" ReadOnly="True" DataFormatString="{0:dd.MM.yyyy}" SortExpression="EventDate" />
                    <asp:BoundField DataField="EventTime" ItemStyle-CssClass="align-middle" HeaderText="Vrijeme" ReadOnly="True" DataFormatString="{0:HH:mm}"  SortExpression="EventTime" />
                    <asp:BoundField DataField="EventName" ItemStyle-CssClass="align-middle" HeaderText="Događaj" ReadOnly="True" SortExpression="EventName" />
                    <asp:BoundField DataField="EventResult" ItemStyle-CssClass="align-middle text-center" HeaderText="Rezultat" SortExpression="EventResult" NullDisplayText="nije započelo"/>                    
               </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>

