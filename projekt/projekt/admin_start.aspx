<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_start.aspx.cs" Inherits="projekt.admin_start" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style4
    {
        color: #FFFFFF;
    }
        .style5
        {
            width: 100%;
        }
        .style6
        {
            text-align: right;
        }
        .style7
        {
            width: 645px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style5">
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style6">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" />
                </td>
        </tr>
    </table>
    <p class="style4">
        &nbsp;</p>
    <p class="style4">
        Witamy w panelu administracyjnym Internetowego Systemu rezerwacji sal. Wybierz 
        żądaną czynność aby rozpocząć.</p>
</asp:Content>
