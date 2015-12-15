<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="rez_del.aspx.cs" Inherits="projekt.rez_del" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        text-align: right;
        color: #FFFFFF;
        font-size: xx-large;
        height: 34px;
    }
    .style6
    {
        width: 1009px;
        height: 34px;
    }
        .style7
        {
            color: #FFFFFF;
        }
        .style8
        {
            color: #FFFFFF;
            text-align: right;
            width: 330px;
        }
        .style9
        {
            width: 330px;
            text-align: center;
        }
        .style10
        {
            width: 341px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style4">
    <tr>
        <td class="style6">
        </td>
        <td class="style5">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" />
                </td>
    </tr>
</table>
    <br />
    <br />
    <span class="style7">Podaj numer rezerwacji w celu anulowania:<br />
    </span>
    <table class="style4">
        <tr>
            <td class="style8">
                Numer rezerwacji:</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Powtórz numer:</td>
            <td class="style10">
                <asp:TextBox ID="TextBox2" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                    ErrorMessage="Wprowadzono różne numery rezerwacji!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Anuluj" 
                    Width="110px" />
            </td>
            <td class="style3" style="text-align: left">
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="#009900"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
