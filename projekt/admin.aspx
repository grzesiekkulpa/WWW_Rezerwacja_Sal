<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="projekt.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            color: #FFFFFF;
            font-size: xx-large;
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 533px;
            text-align: right;
        }
        .style6
        {
            width: 530px;
            text-align: left;
        }
    </style>
</head>
<body background="Images/background.jpg">
    <form id="form1" runat="server">
    <div class="style3">
    
        <br />
        <span class="style2"><strong style="text-align: center">
        Internetowy System Rezerwacji Sal<br />
        <br />
        <br />
        Panel administracyjny<br />
        <br />
        </strong>
        <table class="style4">
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td style="text-align: right">
        <span class="style2">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
        </span>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" />
                </td>
            </tr>
        </table>
        <br />
        </span>
    
    </div>
    </form>
</body>
</html>
