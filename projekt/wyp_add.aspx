﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="wyp_add.aspx.cs" Inherits="projekt.wyp_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        text-align: right;
    }
    .style6
    {
        width: 1100px;
    }
    .style7
    {
        color: #FFFFFF;
    }
    .style8
    {
        color: #FFFFFF;
        text-align: right;
        width: 338px;
    }
    .style9
    {
        width: 338px;
    }
    .style10
    {
        width: 342px;
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
<br class="style7" />
<br class="style7" />
<span class="style7">Uzupełnij aby wprowadzić nowe wyposażenie:<br />
<br />
</span>
<table class="style4">
    <tr>
        <td class="style8">
            ID wyposażenia:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="8" Width="340px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Podaj ID wyposażenia!" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            Nazwa:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox2" runat="server" MaxLength="16" Width="340px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Podaj nazwę wyposażenia!" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            Opis:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox3" runat="server" Height="72px" MaxLength="64" 
                TextMode="MultiLine" Width="340px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style10">
            <asp:Button ID="Button1" runat="server" style="text-align: center" Text="Dodaj" 
                Width="100px" onclick="Button1_Click" />
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            </td>
    </tr>
</table>
</asp:Content>
