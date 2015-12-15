<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="user_szukaj_sali.aspx.cs" Inherits="projekt.user_szukaj_sali" %>
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
            text-align: right;
            width: 313px;
        }
        .style9
        {
            width: 313px;
        }
        .style10
        {
            width: 343px;
        }
        .style11
        {
            width: 343px;
            text-align: center;
        }
        .style12
        {
            width: 312px;
        }
        .style13
        {
            width: 344px;
        }
        .style14
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
    <br />
    <br />
    <table class="style4">
        <tr>
            <td class="style8">
                Wybierz typ sali:</td>
            <td class="style11">
                <asp:DropDownList ID="DropDownList1" runat="server" style="text-align: center" 
                    Width="340px">
                </asp:DropDownList>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Podaj pojemność sali:</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Wybierz dodatkowe wyposażenie:</td>
            <td class="style10">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" ForeColor="White" 
                    style="text-align: left">
                </asp:CheckBoxList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style4">
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style13" style="text-align: center">
                <asp:Button ID="Button1" runat="server" 
                    style="text-align: center; margin-left: 0px" Text="Wyszukaj" Width="110px" 
                    onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br class="style14" />
    <span class="style14">Sale spełniające wymagania:</span><asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
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
    <br />
</asp:Content>
