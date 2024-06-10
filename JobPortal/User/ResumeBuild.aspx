<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ResumeBuild.aspx.cs" Inherits="JobPortal.User.ResumeBuild" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container pt-50 pb-40">
            <div class="row">

                <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>

                <div class="col-12">
                    <h2 class="contact-title text-center">Build-Resume</h2>
                </div>
                <div class="col-lg-8 mx-auto">
                    <div class="row">
                        <div class="col-12">
                            <h6><b>Personal Details </b></h6>
                        </div>
                        <%--<div class="col-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                         username 
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter a unique username." required></asp:TextBox>
                                    </div>
                                </div>--%>
                        <div class="col-12">
                            <div class="form-group">
                                <label>UserName</label>
                                <%-- full name --%>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter a unique username."></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in character" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                    Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Full Name</label>
                                <%-- address --%>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your Full Name."></asp:TextBox>

                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Address</label>
                                <%-- address --%>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address." TextMode="MultiLine"></asp:TextBox>

                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Mobile Number</label>
                                <%-- mobile number --%>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter your mobile number."></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="mobile number must contain 10 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                    Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                            </div>
                        </div>


                        <div class="col-12">
                            <div class="form-group">
                                <label>Email</label>
                                <%-- Email --%>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your Email-address"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <h6><b>Educational Details </b></h6>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>10 Percentage</label>
                                <%-- 10 --%>
                                <asp:TextBox ID="txtTenth" runat="server" CssClass="form-control" placeholder="Enter Your 10th Result"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>12 Percentage</label>
                                <%-- 12 --%>
                                <asp:TextBox ID="txtTwelfth" runat="server" CssClass="form-control" placeholder="Enter Your 12th Result"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Bachlore degree Result </label>
                                <%-- b --%>
                                <asp:TextBox ID="txtBachlore" runat="server" CssClass="form-control" placeholder="Enter Your Bachlore Result ex:- Be/Btech/Bsc/Bca..."></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Masters degree Result </label>
                                <%-- m --%>
                                <asp:TextBox ID="txtMaster" runat="server" CssClass="form-control" placeholder="Enter Your Master Degree Result ex:- Me/Mtech/Msc/Mca..."></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Phd Result </label>
                                <%-- m --%>
                                <asp:TextBox ID="txtPhd" runat="server" CssClass="form-control" placeholder="Enter Your phd Result "></asp:TextBox>
                            </div>
                        </div>

                        <%--<div class="col-12">
                            <div class="form-group">
                                <label>Work Experience </label>
                                 work experience 
                                <asp:TextBox ID="txtExp" runat="server" CssClass="form-control" placeholder=" How time you work and description about it" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>--%>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Work's On </label>
                                <%-- work experience --%>
                                <asp:TextBox ID="txtWorksOn" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                            </div>
                        </div>

                        <%--  --%>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Skills </label>
                                <%-- skill --%>
                                <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" placeholder="Skills" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Resume </label>
                                <%-- resume --%>
                                <asp:FileUpload ID="txtResume" runat="server" CssClass="form-control pt-2" ToolTip="File must be in .pdf Extention" />
                            </div>

                            <%--  --%>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button ID="btnUpload" runat="server" Text="Update" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnUpload_Click" />

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
