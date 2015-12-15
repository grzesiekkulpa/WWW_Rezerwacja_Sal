<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="user_moje_rez.aspx.cs" Inherits="projekt.user_moje_rez" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .style4
        {
            width: 100%;
        }
        .style7
        {
            width: 1013px;
            color: #FFFFFF;
        }
        .style6
        {
            text-align: right;
        }
        .style9
        {
            color: #FFFFFF;
        }
        .style8
        {
            width: 1013px;
            color: #FFFFFF;
        }
        .style10
        {
            color: #FFFFFF;
            text-align: right;
            width: 383px;
        }
        .style11
        {
            width: 383px;
        }
        .style12
        {
            width: 330px;
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
    <span class="style7">Podaj numer rezerwacji w celu anulowania:</span><table 
        class="style4">
        <tr>
            <td class="style10">
                Numer rezerwacji:</td>
            <td class="style12">
                <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                Powtórz numer:</td>
            <td class="style12">
                <asp:TextBox ID="TextBox2" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                    ErrorMessage="Wprowadzono różne numery rezerwacji!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style12">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Anuluj" 
                    Width="110px" style="text-align: center" />
            </td>
            <td>
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="#009900"></asp:Label>
            </td>
        </tr>
    </table>
    <br class="style9" />
<span class="style8">Lista rezerwacji użytkownika:</span><br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
