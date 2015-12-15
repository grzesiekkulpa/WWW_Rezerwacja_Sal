<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="projekt.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
        .style2
        {
            color: #FFFFFF;
            font-size: xx-large;
        }
        .style3
        {
            width: 100%;
            margin-bottom: 0px;
        }
        .style4
        {
            width: 291px;
            text-align: right;
            color: #FFFFFF;
        }
        .style5
        {
            width: 263px;
        }
        .style6
        {
            width: 428px;
            text-align: right;
        }
        .style7
        {
            width: 291px;
            text-align: right;
            color: #FFFFFF;
            font-size: large;
        }
        .style8
        {
            width: 100%;
        }
        .style9
        {
            font-size: large;
            text-align: right;
            width: 520px;
            color: #FFFFFF;
        }
    </style>
</head>
<body background="Images/background.jpg">
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logotyp.gif" />
    
        <span class="style1"><strong>
        <br />
        <span class="style2">Internetowy System Rezerwacji Sal<br />
        <br />
        </span></strong>
    
        </span>
        <table class="style8">
            <tr>
                <td class="style9">
                    <strong>Zaloguj się aby kontynuować</strong></td>
    
        <span class="style1"><strong>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </strong>
    
        </span>
        <table class="style3">
            <tr>
                <td class="style7">
                    Login:</td>
    
                <strong>
    
        <span class="style1">
                <td class="style5" style="text-align: left">
                    <asp:TextBox ID="tbuser" runat="server" 
                        style="text-align: left; margin-left: 0px" Width="261px" MaxLength="32"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbuser" ErrorMessage="Wprowadź nazwę użytkownika!" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Hasło:</td>
                <td class="style5" style="text-align: left">
                    <asp:TextBox ID="tbpass" runat="server" TextMode="Password" Width="261px" 
                        MaxLength="32"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbpass" ErrorMessage="Wprowadź hasło!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        </span></strong>
    
        <span class="style1">
        <table class="style3">
            <tr>
                <td class="style6">
                    <asp:CheckBox ID="cbadmin" runat="server" Font-Size="Large" ForeColor="White" 
                        style="text-align: right" Text="Administrator" />
                </td>
                <td style="text-align: left">
    
        <span class="style1">
                    <asp:Button ID="buttzaloguj" runat="server" Text="Zaloguj" Width="106px" 
                        onclick="buttzaloguj_Click" style="margin-left: 22px" />
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="Red" 
                        Text="Błędne dane logowania i/lub brak odpowiednich uprawnień!" 
                        Visible="False"></asp:Label>
        </span>
                </td>
            </tr>
        </table>
        </span><br />
        <br />
    
    </div>
    </form>
</body>
</html>
