<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="wyp_sali_del.aspx.cs" Inherits="projekt.wyp_sali_del" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        width: 1044px;
    }
    .style6
    {
        text-align: right;
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
        <td class="style6">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="White" 
                        style="text-align: right"></asp:Label>
                    <asp:Button ID="btlogout" runat="server" onclick="btlogout_Click" 
                        Text="Wyloguj" />
                </td>
    </tr>
</table>
<br />
<br />
<br class="style7" />
<span class="style7">Uzupełnij pola aby usunąć wyposażenie sali:</span><table 
    class="style4">
    <tr>
        <td class="style8">
            ID sali:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            ID wyposażenia:</td>
        <td class="style10">
            <asp:TextBox ID="TextBox2" runat="server" Width="340px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style10">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Usuń" 
                Width="110px" />
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
<br />
<span class="style7">Lista wyposażeń sal:</span><asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
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
