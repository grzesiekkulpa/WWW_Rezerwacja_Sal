<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="user_rezerwuj.aspx.cs" Inherits="projekt.user_rezerwuj" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="obout_Calendar2_Net" namespace="OboutInc.Calendar2" tagprefix="obout" %>
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
            text-align: right;
            color: #FFFFFF;
            width: 395px;
        }
        .style9
        {
            width: 341px;
        }
        .style10
        {
            width: 338px;
            text-align: center;
        }
        .style11
        {
            width: 395px;
        }
        .style12
        {
            width: 340px;
        }
        .style13
        {
            width: 398px;
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
    <table class="style4">
        <tr>
            <td class="style8">
                Wybierz salę:</td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="340px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Sprawdź obciążenie" 
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    <table class="style4">
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td>
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
            </td>
        </tr>
    </table>
    <table class="style4">
        <tr>
            <td class="style8">
                Rezerwacja od:</td>
            <td class="style12">
                <obout:Calendar ID="Calendar1" runat="server" DatePickerMode="True">
                </obout:Calendar>
                <obout:Calendar ID="Calendar2" runat="server" CultureName="" 
                    DatePickerImageTooltip="Wybierz..." DatePickerMode="True" 
                    DatePickerSynchronize="True">
                </obout:Calendar>
                <eo:DatePicker ID="DatePicker1" runat="server" ControlSkinID="None" 
                    DayCellHeight="16" DayCellWidth="19" DayHeaderFormat="FirstLetter" 
                    DisabledDates="" OtherMonthDayVisible="True" PickerFormat="yyyy/MM/dd" 
                    SelectedDates="" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" 
                    TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2015-06-01" 
                    FirstMonth="2015-06-01">
                    <PickerStyle CssText="font-family:Courier New; padding-left:5px; padding-right: 5px;" />
                    <CalendarStyle CssText="background-color: white; border-right: #7f9db9 1px solid; padding-right: 4px; border-top: #7f9db9 1px solid; padding-left: 4px; font-size: 9px; padding-bottom: 4px; border-left: #7f9db9 1px solid; padding-top: 4px; border-bottom: #7f9db9 1px solid; font-family: tahoma" />
                    <TitleStyle CssText="background-color:#9ebef5;font-family:Tahoma;font-size:12px;padding-bottom:2px;padding-left:6px;padding-right:6px;padding-top:2px;" />
                    <TitleArrowStyle CssText="cursor:hand" />
                    <MonthStyle CssText="font-family: tahoma; font-size: 12px; margin-left: 14px; cursor: hand; margin-right: 14px" />
                    <DayHeaderStyle CssText="font-family: tahoma; font-size: 12px; border-bottom: #aca899 1px solid" />
                    <DayStyle CssText="font-family: tahoma; font-size: 12px; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <DayHoverStyle CssText="font-family: tahoma; font-size: 12px; border-right: #fbe694 1px solid; border-top: #fbe694 1px solid; border-left: #fbe694 1px solid; border-bottom: #fbe694 1px solid" />
                    <TodayStyle CssText="font-family: tahoma; font-size: 12px; border-right: #bb5503 1px solid; border-top: #bb5503 1px solid; border-left: #bb5503 1px solid; border-bottom: #bb5503 1px solid" />
                    <SelectedDayStyle CssText="font-family: tahoma; font-size: 12px; background-color: #fbe694; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <DisabledDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <OtherMonthDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                </eo:DatePicker>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Time"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DatePicker1" ErrorMessage="Wprowadź datę!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Wprowadź poprawną godzinę!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Rezerwacja do:</td>
            <td class="style12">
                <eo:DatePicker ID="DatePicker2" runat="server" ControlSkinID="None" 
                    DayCellHeight="16" DayCellWidth="19" DayHeaderFormat="FirstLetter" 
                    DisabledDates="" OtherMonthDayVisible="True" PickerFormat="yyyy/MM/dd" 
                    SelectedDates="" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" 
                    TitleRightArrowImageUrl="DefaultSubMenuIcon" VisibleDate="2015-06-01">
                    <PickerStyle CssText="font-family:Courier New; padding-left:5px; padding-right: 5px;" />
                    <CalendarStyle CssText="background-color: white; border-right: #7f9db9 1px solid; padding-right: 4px; border-top: #7f9db9 1px solid; padding-left: 4px; font-size: 9px; padding-bottom: 4px; border-left: #7f9db9 1px solid; padding-top: 4px; border-bottom: #7f9db9 1px solid; font-family: tahoma" />
                    <TitleStyle CssText="background-color:#9ebef5;font-family:Tahoma;font-size:12px;padding-bottom:2px;padding-left:6px;padding-right:6px;padding-top:2px;" />
                    <TitleArrowStyle CssText="cursor:hand" />
                    <MonthStyle CssText="font-family: tahoma; font-size: 12px; margin-left: 14px; cursor: hand; margin-right: 14px" />
                    <DayHeaderStyle CssText="font-family: tahoma; font-size: 12px; border-bottom: #aca899 1px solid" />
                    <DayStyle CssText="font-family: tahoma; font-size: 12px; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <DayHoverStyle CssText="font-family: tahoma; font-size: 12px; border-right: #fbe694 1px solid; border-top: #fbe694 1px solid; border-left: #fbe694 1px solid; border-bottom: #fbe694 1px solid" />
                    <TodayStyle CssText="font-family: tahoma; font-size: 12px; border-right: #bb5503 1px solid; border-top: #bb5503 1px solid; border-left: #bb5503 1px solid; border-bottom: #bb5503 1px solid" />
                    <SelectedDayStyle CssText="font-family: tahoma; font-size: 12px; background-color: #fbe694; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <DisabledDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                    <OtherMonthDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                </eo:DatePicker>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Time"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DatePicker2" ErrorMessage="Wprowadź datę!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Wprowadź poprawną godzinę!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <table class="style4">
        <tr>
            <td class="style8">
                Cel rezerwacji:</td>
            <td class="style10">
                <asp:TextBox ID="TextBox3" runat="server" Height="59px" TextMode="MultiLine" 
                    Width="340px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Wprowadź cel rezerwacji!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Rezerwuj" 
                    Width="110px" />
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label3" runat="server" ForeColor="#00CC00"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
