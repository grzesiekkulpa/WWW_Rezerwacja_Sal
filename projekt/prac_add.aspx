<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="prac_add.aspx.cs" Inherits="projekt.prac_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        color: #FFFFFF;
    }
        .style6
        {
            text-align: right;
        }
        .style7
        {
            width: 1013px;
        }
        .style8
        {
            width: 344px;
            color: #FFFFFF;
            text-align: right;
        }
        .style9
        {
            width: 335px;
        }
        .style10
        {
            width: 344px;
        }
        .style11
        {
            width: 341px;
            text-align: center;
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
    <br />
    <p class="style5">
        Wypełnij formularz aby dodać pracownika:</p>
    <table class="style4">
        <tr>
            <td class="style8">
                ID pracownika:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px" 
                    Width="340px" MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Wprowadź ID użytkownika!" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Hasło:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="340px" 
                    MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Wprowadź hasło!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Powtórz hasło:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="340px" 
                    MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
                    ErrorMessage="Wprowadzone hasła są różne!" ForeColor="#CC0000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Imię:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox4" runat="server" Width="340px" MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="Podaj imię!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Nazwisko:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox5" runat="server" Width="340px" MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="Podaj nazwisko!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Katedra:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox6" runat="server" Width="340px" MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="Podaj katedrę!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                E-mail:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox7" runat="server" Width="340px" MaxLength="32"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="Błędny adres e-mail!" 
                    ForeColor="#CC0000" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Nr telefonu:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox8" runat="server" Width="340px" MaxLength="12" 
                    TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox8" ErrorMessage="Podaj nr telefonu!" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox1" runat="server" ForeColor="White" 
                    Text="Uprawnienia administratora" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style4">
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Dodaj" 
                    Width="110px" />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Wyczyść" 
                    Width="110px" />
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label3" runat="server" ForeColor="#009900"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
