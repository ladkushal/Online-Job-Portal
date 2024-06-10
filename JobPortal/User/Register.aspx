<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JobPortal.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container pt-50 pb-40">
            <div class="row">

                    <div class="col-12 pb-20">
                        <asp:Label ID="lblMsg" runat="server" visible="false"></asp:Label>
                    </div>

                    <div class="col-12">
                        <h2 class="contact-title text-center">Sign-Up</h2>
                    </div>
                    <div class="col-lg-8 mx-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h6><b>Registration </b></h6>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <%-- username --%>
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter a unique username." required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <%-- password --%>
                                        <label>Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password." required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <%-- confirm password --%>
                                        <label>Confirm Password</label>
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Enter your conformation password." required></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your password and confirm password are not same" 
                                           ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic"  SetFocusOnError="true"
                                             Font-Size="Small"></asp:CompareValidator>
                                        
                                    </div>
                                </div>
                                <div class="col-12">
                                <h6><b>Personal Information</b></h6>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <%-- full name --%>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name." required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in character" ForeColor="Red" Display="Dynamic"  SetFocusOnError="true"
                                             Font-Size="Small"  ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <%-- address --%>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address." TextMode="MultiLine" required></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <%-- mobile number --%>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter your mobile number."  required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="mobile number must contain 10 digits" ForeColor="Red" Display="Dynamic"  SetFocusOnError="true"
                                             Font-Size="Small"  ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <%-- email --%>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email." TextMode="Email" required></asp:TextBox>
                                    </div>
                                </div>

                                <%--<div class="col-12">
                                    <div class="form-group">
                                        <label>Country</label>
                                         country --
                                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100" AppendDataBoundItems="true"
                                             DataTextField="CountryName" DataValueField="CountryName">
                                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country is required" ForeColor="Red" Display="Dynamic"  SetFocusOnError="true"
                                             Font-Size="Small" InitialValue="0" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                                    </div>
                                </div>--%>

                            </div>
                            <div class="form-group mt-3">
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnRegister_Click"/>
                                <span class="clickLink"> <a href="../User/Login.aspx">Already Register?</a> </span>
                            </div>
                    </div>
                </div>
        </div>
    </section>
</asp:Content>
