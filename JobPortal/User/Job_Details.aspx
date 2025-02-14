﻿
<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Job_Details.aspx.cs" Inherits="JobPortal.User.Job_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Web Devloper</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- Hero Area End -->

        <div>
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">

                    <ItemTemplate>
                        <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#">
                                        <%--<img width="80" src="<%# GetImageUrl(Eval("CompneyLogo"))%>" alt="">--%>
                                    </a>

                                </div>
                                <div class="job-tittle">
                                    <a href="#">
                                        <h4> <%# Eval("JobTitle") %> </h4>
                                    </a>
                                    <ul>
                                        <li><%# Eval("CompneyName") %></li>
                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("State") %></li>
                                        <li><%# Eval("Salary") %></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                          <!-- job single End -->
                       
                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4> Description </h4>
                                    <p><%# Eval("Description") %></p>
                                </div>
                                <%--<p>It is a long established fact that a reader will beff distracted by vbthe creadable content of a page when looking at its layout. The pointf of using Lorem Ipsum is that it has ahf mcore or-lgess normal distribution of letters, as opposed to using, Content here content here making it look like readable.</p>--%>
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Skills Required</h4>
                                </div>
                               <ul>
                                   <li><%# Eval("Skills") %></li>
                                   <%--<li><%# Eval("Experience") %> of experience</li>--%>
                                   
                               </ul>
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Education Required</h4>
                                </div>
                               <ul>
                                   <li> <%# Eval("Qualification") %> </li>
                                   
                               </ul>
                                <br />
                                <div class="small-section-tittle">
                                    <h4>Experience Required</h4>
                                </div>
                               <ul>
                                   <li> <%# Eval("Experience") %> Years</li>
                                   
                               </ul>

                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h4>Job Overview</h4>
                           </div>
                          <ul>
                              <li>Posted date : <span> <%# Eval("CreateDate", "{0:d}" ) %></span></li>
                              <li>Location : <span><%# Eval("State") %>,India</span></li>
                              <li>Vacancy : <span><%# Eval("NoOfPost") %></span></li>
                              <li>Job nature : <span><%# Eval("JobType") %></span></li>
                              <li>Salary :  <span><%# Eval("Salary") %></span></li>
                              <li>Application last date : <span><%# Eval("LastDateToApply" , "{0:d}") %></span></li>
                          </ul>
                         <div class="apply-btn2">
                            <%--<a href="#" class="btn">Apply Now</a>--%>
                             <asp:LinkButton ID="lbApplyJob" runat="server" CssClass="btn" Text="Apply Now" CommandName="ApplyJob"></asp:LinkButton>
                         </div>
                       </div>
                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h2>Company Information</h2>
                           </div>
                              <span><%# Eval("CompneyName") %></span>
                              <p><%# Eval("Address") %></p>
                            <ul>
                                <li>Name: <span><%# Eval("CompneyName") %></span></li>
                                <li>Web : <span><%# Eval("Website") %></span></li>
                                <li>Email: <span><%# Eval("Email") %></span></li>
                            </ul>
                       </div>
                    </div>
                </div>
                    </ItemTemplate>

                </asp:DataList>
            </div>
        </div>
        <!-- job post company End -->

    </main>
</asp:Content>
