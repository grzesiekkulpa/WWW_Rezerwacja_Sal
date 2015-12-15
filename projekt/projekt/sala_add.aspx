<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="sala_add.aspx.cs" Inherits="projekt.sala_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        text-align: right;
    }
    .style6
    {
        width: 1076px;
    }
    .style7
    {
        color: #FFFFFF;
    }
    .style8
    {
        color: #FFFFFF;
        text-align: right;
        width: 333px;
    }
    .style9
    {
        width: 333px;
        height: 30px;
        text-align: center;
    }
    .style10
    {
        width: 340px;
    }
    .style11
    {
        width: 340px;
        height: 30px;
        text-align: center;
    }
    .style12
    {
        height: 30px;
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
<span class="style7">Uzupełnij aby dodać salę:</span><br />
<br />
<table class="style4">
    <tr>
        <td class="style8">
            ID sali:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox1" runat="server" Width="340px" MaxLength="8"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Podaj ID sali!" ForeColor="Red" 
                ViewStateMode="Disabled"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style8">
            Typ sali:</td>
        <td class="style10">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="340px">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            Pojemność:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox2" runat="server" Width="340px" MaxLength="4"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Podaj pojemność sali!" 
                ForeColor="Red" ViewStateMode="Disabled"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style9">
        </td>
        <td class="style11">
            <asp:Button ID="Button1" runat="server" style="text-align: center" Text="Dodaj" 
                Width="110px" onclick="Button1_Click" />
        </td>
        <td class="style12">
            <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
