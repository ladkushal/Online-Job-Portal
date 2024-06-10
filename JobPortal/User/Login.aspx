<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobPortal.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container pt-50 pb-40">
            <div class="row">

                <div class="col-12 pb-20">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
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
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter a unique username." required></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <%-- password --%>
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password." required></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                
                                <label>Login Type</label>
                                <asp:DropDownList ID="ddlLoginType" CssClass="form-control w-100" runat="server">
                                    <asp:ListItem Value="0">Select Login Type</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>User</asp:ListItem>
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User type is must required" ForeColor="Red" Display="Dynamic"
                                    SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlLoginType"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group mt-3">
                            <asp:Button ID="btnLogin" runat="server" Text="Log-In" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnLogin_Click" />
                            <span class="clickLink"><a href="../User/Register.aspx">Not Register Yet? Register Now</a> </span>
                            &nbsp
                            <span class="clickLink"><a href="../User/ForgotPassword.aspx"> Forgot password?</a> </span>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
