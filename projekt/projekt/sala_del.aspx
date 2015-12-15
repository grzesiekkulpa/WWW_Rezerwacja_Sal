<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="sala_del.aspx.cs" Inherits="projekt.sala_del" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        text-align: right;
    }
    .style6
    {
        width: 1054px;
    }
    .style7
    {
        color: #FFFFFF;
    }
    .style8
    {
        text-align: right;
        color: #FFFFFF;
        width: 340px;
    }
    .style9
    {
        width: 340px;
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
            &nbsp;</td>
        <td class="style5">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" CausesValidation="False" />
                </td>
    </tr>
</table>
<br />
<br />
<span class="style7">Podaj ID sali aby usunąć:<br />
<br />
<br />
</span>
<table class="style4">
    <tr>
        <td class="style8">
            ID sali:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox1" runat="server" Width="340px" MaxLength="8"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            Powtórz ID:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox2" runat="server" Width="340px" MaxLength="8"></asp:TextBox>
        </td>
        <td>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox2" ControlToValidate="TextBox1" 
                ErrorMessage="Wprowadzone ID są różne!" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style10">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Usuń" 
                Width="100px" />
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="#009900"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
