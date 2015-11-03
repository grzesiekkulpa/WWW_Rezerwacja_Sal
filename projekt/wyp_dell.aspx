<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="wyp_dell.aspx.cs" Inherits="projekt.wyp_dell" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 993px;
        }
        .style6
        {
            color: #FFFFFF;
        }
        .style7
        {
            text-align: right;
            color: #FFFFFF;
            width: 339px;
        }
        .style8
        {
            width: 339px;
        }
        .style9
        {
            width: 341px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style4">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: right">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" CausesValidation="False" />
                </td>
        </tr>
    </table>
    <br class="style6" />
    <br class="style6" />
    <span class="style6">Podaj ID wyposażenia aby usunąć:<br />
    <br />
    <br />
    </span>
    <table class="style4">
        <tr>
            <td class="style7">
                ID wyposażenia:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Podaj ID wyposażenia!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Powtórz ID:</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                    ErrorMessage="Podane ID są różne!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
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
