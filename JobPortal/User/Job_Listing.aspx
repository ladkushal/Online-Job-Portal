<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Job_Listing.aspx.cs" Inherits="JobPortal.User.Job_Listing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* Main container */



        .container {
            width: 100%;
            max-width: 1200px; /* Adjust as needed */
            margin: 0 auto;
        }

        /* Job listing area */
        .job-listing-area {
            padding-top: 50px;
            padding-bottom: 120px;
        }

        /* Small section title */
        .small-section-tittle2 {
            margin-bottom: 45px;
        }

        /* Job category listing */
        .job-category-listing {
            margin-bottom: 50px;
        }

        /* Single listing */
        .single-listing {
            margin-bottom: 30px;
        }

        /* Select job items */
        .select-job-items2 {
            /* Add styles as needed */
        }

        /* Select categories */
        .select-Categories {
            padding-top: 80px;
            padding-bottom: 50px;
        }

        /* Radio button container */
        .radiobutton {
            /* Add styles as needed */
        }

        /* Featured job area */
        .featured-job-area {
            /* Add styles as needed */
        }

        /* Single job item */
        /*.single-job-item {
    margin-bottom: 30px;
}
*/
        /* Move items-link styles to the end of the container */
        .single-job-item {
            display: flex;
            justify-content: space-between; /* Ensure items are spaced apart */
            border: 2px solid #ededed;
            padding: 5px;
            width:800px;
        }

        /* Keep items-link styles contained to the right side */
        .items-link {
            text-align: right;
        }

        /* Optional: adjust spacing or other styles as needed */
        .items-link {
            margin-top: auto; /* Ensure it aligns to the bottom */
            /* Add any other styling as needed */
        }


        /* Company image */
        .company-img {
            margin-right: 15px; /* Adjust spacing */
            display: inline-block; /* Ensures image and text align properly */
        }

        /* Job title */
        .job-title {
            display: inline-block; /* Ensures job title and details align properly */
        }

        /* Job items */
        .job-items {
            display: flex;
            align-items: center;
        }

        /* Items link */
        /*.items-link {
    display: flex;
    justify-content: space-between;
    align-items: center;
}*/

        /* Items link on the right side */
        .items-link2f-right {
            justify-content: flex-end;
        }

        /* Text secondary */
        .text-secondary {
            color: #888; /* Adjust color as needed */
        }

        /* Responsive adjustments */
        @media (max-width: 767px) {
            /* Adjustments for smaller screens */
            .col-x1-2,
            .col-x1-10 {
                width: 100%;
            }
        }

        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <div class="job-listing-area pt-50 pb-120">
            <div class="container">
                <div class="row">

                    <div class="col-x1-2 col-lg-3 col-md-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="small-section-tittle2 mb-45">
                                    <div class="ion">
                                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" fill="rgb(27, 207, 107)" xmlns="http://www.w3.org/2000/svg" width="20px" height="12px">
                                            <path fill-rule="evenodd" fill="rgb(27,207,107)"
                                                d="M7.778,12.000 L12.222,12.000 L12.222, 10.000 L7.778,10.000 L7.778, 12.000 ZM-0.000, -0.000 L-0.000, 2.000 L20.000,2.000 L20.000,-0.000 L-0.000, -0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.eee L3.333,7.000 Z" />
                                        </svg>
                                    </div>
                                    <h4>Filter Jobs</h4>
                                </div>
                            </div>
                        </div>
                        <div class="job-category-listing mb-50 pb-0">
                            <div class="single-listing">
                                <%-- <div class="small-section-tittle2">
                                    <h4>Job Location</h4>
                                </div>--%>

                                <div class="select-job-items2">
                                    <%--<asp:DropDownList ID="ddlCountry" runat="server" name="select" CssClass="form-control w-100" AppendDataBoundItems="True" DataTextField="CountryName" DataSourceID="SqlDataSource1" DataValueField="CountryName" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0"> Country</asp:ListItem>
                                </asp:DropDownList>--%>
                                    <%--                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:cs%>"--%>

                                    <%--SelectCommand ="SELECT [CountryName] from [Country]"></asp:SqlDataSource>--%>
                                </div>
                                <div class="select-Categories pt-80 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Job Type</h4>
                                    </div>
                                    <div class="checkbox checkbox-primary">
                                        <asp:CheckBoxList ID="CheckBoxList1" RepeatDirection="Vertical" runat="server" AutoPostBack="True" RepeatLayout="Flow" CssClass="styled" TextAlign="Right" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                            <asp:ListItem>Full Time</asp:ListItem>
                                            <asp:ListItem>Part Time</asp:ListItem>
                                            <asp:ListItem>Freelance</asp:ListItem>
                                            <asp:ListItem>Remote</asp:ListItem>
                                            <asp:ListItem>Intenship</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>
                            <div class="single-listing">
                                <div class="select-Categories pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Posted Within</h4>
                                    </div>
                                    <div class="radiobutton container">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="radiobuttonlist" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                                            <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                            <asp:ListItem Value="1"> Today</asp:ListItem>
                                            <asp:ListItem Value="2">Last 2 days</asp:ListItem>
                                            <asp:ListItem Value="3">Last 3 days</asp:ListItem>
                                            <asp:ListItem Value="4">Last 5 days</asp:ListItem>
                                            <asp:ListItem Value="5">Last 10 days</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <%--<div class="mb-1">
                                    <asp:LinkButton ID="lbFilter" runat="server" CssClass="btn btn-sm" Width="100%" OnClick="lbFilter_Click">Filter</asp:LinkButton>
                                </div>--%>
                                <div class="mb-4">
                                    <asp:LinkButton ID="lblReset" runat="server" CssClass="btn btn-sm" Width="100%" OnClick="lblReset_Click">Reset</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-x1-10 col-lg-9 col-md-8">
                        <section class="featured-job-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <asp:Label ID="lbljobCount" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                        <div class="single-job-item mb-30">
                                            <div class="job-items">
                                                <div class="company-img">
                                                    <a href="Job_Details.aspx?id=<%# Eval("JobId") %>">
                                                        <img width="80" src="<%# GetImageUrl(Eval("CompneyLogo")) %>" alt="" />
                                                    </a>
                                                    &nbsp;
                                                </div>
                                                <div class="job-title job-tittle2">
                                                    <a href="Job_Details.aspx?id=<%# Eval("JobId") %>">

                                                        <h5><%# Eval("JobTitle") %></h5>

                                                    </a>
                                                    <ul>
                                                        <li><%#Eval("CompneyName") %></li>
                                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("State") %></li>
                                                        <li><%# Eval("Salary") %></li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="items-link items-link2f-right">
                                                <a href="Job_Details.aspx?id=<%#Eval("JobId") %>"><%# Eval("JobType") %></a>
                                                <span class="text-secondary">
                                                    <i class="fa fa-clockpr-1"></i>
                                                    <%#RelativeDate(Convert.ToDateTime(Eval("CreateDate"))) %>
                                                </span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
