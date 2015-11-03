<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="wyp_sali.aspx.cs" Inherits="projekt.wyp_sali" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        width: 910px;
    }
    .style6
    {
        text-align: right;
    }
    .style7
    {
        color: #FFFFFF;
    }
    .style8
    {
        color: #FFFFFF;
        text-align: right;
        width: 336px;
    }
    .style9
    {
        width: 336px;
    }
    .style10
    {
        width: 336px;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style4">
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td class="style6">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" CausesValidation="False" />
                </td>
    </tr>
</table>
<br />
<br />
<span class="style7">Wybierz ID sali i określ wyposażenie:</span><br />
<br />
<table class="style4">
    <tr>
        <td class="style8">
            Wybierz ID sali:</td>
        <td class="style9">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="340px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            Wybierz ID wyposażenia:</td>
        <td class="style9">
            <asp:DropDownList ID="DropDownList2" runat="server" Width="340px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style10">
            <asp:Button ID="Button1" runat="server" Text="Dodaj" Width="110px" 
                onclick="Button1_Click" />
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
