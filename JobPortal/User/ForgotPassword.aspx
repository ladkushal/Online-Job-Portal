<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="JobPortal.User.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pt-50 pb-40">
            <div class="row">

                <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
                </div>

                <div class="col-12">
                    <h2 class="contact-title text-center">Sign-In</h2>
                </div>
                <div class="col-lg-8 mx-auto">
                    <div class="row">

                        <div class="col-12">
                            <div class="form-group">
                                <label>Username</label>
                                <%-- username --%>
                                <asp:TextBox ID="txtFpUserName" runat="server" CssClass="form-control" placeholder="Enter your username." required></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label>Email</label>
                                <%-- username --%>
                                <asp:TextBox ID="txtFpEmail" runat="server" CssClass="form-control" placeholder="Enter your email id which you given during registration." required></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <%-- password --%>
                                <label>Password</label>
                                <asp:TextBox ID="txtFpCnfPassword" runat="server" CssClass="form-control" placeholder="Enter your password." required></asp:TextBox>
                            </div>
                        </div>

                        

                        <div class="form-group mt-3">
                            <asp:Button ID="btnLogin" runat="server" Text="Change Password" CssClass="button button-contactForm boxed-btn mr-4" onclick="btnLogin_Click"/>
                            <%--<span class="clickLink"><a href="../User/Register.aspx">Not Register Yet Register? Register Now</a> </span>--%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
