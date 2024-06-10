<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="JobPortal.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" />

    <style>
        /* Define custom card colors */
        .l-bg-cherry {
            background-color: #c43782; /* Cherry color */
            color: #fff; /* White text color */
        }

        .l-bg-blue {
            background-color: #8956e8; /* Cherry color */
            color: #fff; /* White text color */
        }

        .l-bg-orange {
            background-color: #e0764c; /* Cherry color */
            color: #fff; /* White text color */
        }

        .l-bg-green {
            background-color: #37c43e; /* Cherry color */
            color: #fff; /* White text color */
        }

        /* Style the card title */
        .card-title {
            font-size: 18px;
        }

        /* Style the card statistics */
        .card-statistic-3 {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Style the card icons */
        .card-icon {
            font-size: 36px;
            color: #fff;
        }

        /* Center align text inside the card */
        .text-center {
            text-align: center;
        }

        /* Add space between rows */
        .row {
            margin-bottom: 20px;
        }

        /* Center the columns */
        .col-8 {
            margin: 0 auto;
        }

        /* Add padding to the top */
        .pt-4 {
            padding-top: 1.5rem;
        }

        /* Add padding to the bottom */
        .pb-3 {
            padding-bottom: 1rem;
        }

        /* Add margin to the bottom */
        .mb-2,
        .mb-4 {
            margin-bottom: 0.5rem;
        }

        /* Align items in the center */
        .align-items-center {
            align-items: center;
        }

        /* Center align text */
        .d-flex {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Add margin to the bottom */
        .mb-0 {
            margin-bottom: 0;
        }

        /* Style the h2 elements */
        h2 {
            font-size: 28px;
            margin: 0;
        }

        /* Style the card */
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4">
        <div class="row">
            <div class="col-12 pb-3">
                <h2 class="text-center">Dashboard</h2>
            </div>

            <div class="col-md-10 mx-auto">
                <div class="row">


                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-cherry">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-users pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Users</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <% Response.Write(Session["User"]); %>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-blue">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-briefcase pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Jobs</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <% Response.Write(Session["Job"]); %>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-orange">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-check-square pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Applied Jobs</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <% Response.Write(Session["AppliedJobs"]); %>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-green">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-comments pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Contacted Users</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <% Response.Write(Session["Contact"]); %>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
