<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ScheduleSelect.aspx.cs" Inherits="CFM_Web.ScheduleSelect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table>
        <tr>
            <th>Name</th>
            <th>Customer</th>
            <th>Date Created</th>
        </tr>

        <% foreach (var schedule in ScheduleList)
           { %>
        <tr>
            <td><a href="<%= getReturnURL(schedule)  %>"><%= schedule.name %></a></td>
            <td><%= schedule.customer %></td>
            <td><%= schedule.dateCreated.ToString("dd/MM/yyyy") %></td>
        </tr>

        <% } %>
    </table>
</asp:Content>
