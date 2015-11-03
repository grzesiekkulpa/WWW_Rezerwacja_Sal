<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="projekt.user1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style4
        {
            width: 100%;
        }
        .style7
        {
            width: 1013px;
        }
        .style6
        {
            text-align: right;
        }
        .style8
    {
        color: #FFFFFF;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style4">
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
            <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" CausesValidation="False" />
        </td>
    </tr>
</table>
<br class="style8" />
<br class="style8" />
<span class="style8">Witamy w internetowym systemie rezerwacji sal, wybierz 
rządaną czynność z menu powyżej aby kontynuować.</span><br />
</asp:Content>
