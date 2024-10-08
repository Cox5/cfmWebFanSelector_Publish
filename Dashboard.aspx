﻿<%@ Page Title="CFM Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CFM_Web.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div class="content-wrapper">
        <span class="welcome-text">Welcome back,  <asp:Label class="bold" ID="lbl_logged_user" runat="server"></asp:Label>!</span>
        <h3>Your level: <asp:Label class="bold" ID="lbl_user_level" runat="server"></asp:Label></h3>
        <hr/>


        <div class="dashboard-panel">
                <a id="projectsLink" href="/Projects/ProjectsDashboard.aspx" class="dashboard-icon-link"  runat="server">
                    <i class="fas fa-tasks icon"></i>
                    <div class="highlighted">
                        Projects
                    </div>
                </a>

                <a id="userInfo" href="/Users/Usergrid.aspx" class="dashboard-icon-link"  runat="server">
                    <i class="fas fa-users icon"></i>
                    <div class="highlighted">
                        User Accounts
                    </div>
                </a>

                <a id="companyInfo" href="/Company/Companygrid.aspx" class="dashboard-icon-link"  runat="server">
                    <i class="fas fa-building icon"></i>
                    <div class="highlighted">
                        Company Info
                    </div>
                </a>

                <!-- <a href="/projects" class="dashboard-icon-link">
                    <i class="fas fa-quote-left icon"></i>
                    <div class="highlighted">
                        Quotations
                    </div>
                </a> -->

                <a id="browseFans" href="/FanSelection.aspx" class="dashboard-icon-link"  runat="server">
                    <i class="fab fa-centercode icon"></i>
                    <div class="highlighted">
                        Browse Fans
                    </div>
                </a>
                
                <a id="importPricesLink" class="dashboard-icon-link" href="/ImportDashboard.aspx" runat="server">
                    <i class="fas fa-wrench icon"></i>
                    <div class="highlighted">
                        Admin Tools
                    </div>
                </a>


        </div>


        <!-- <a class="dashboard-link" href="/Projects/ProjectsDashboard.aspx">Projects</a>
        <a class="dashboard-link" href="/Users/AccountsDashboard.aspx">User accounts</a>
        <a class="dashboard-link" href="/projects">Company info</a>
        <a class="dashboard-link" href="/projects">Quotations</a>
        <a class="dashboard-link" href="/FanSelection.aspx">Browse fans</a>-->
    </div>
</asp:Content>
