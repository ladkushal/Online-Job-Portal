    <%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="JobPortal.User.Profile" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>--%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList id="dlProfile" runat="server" width="100%" OnItemCommand="dlProfile_ItemCommand">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4-mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-item-center text-center">
                                        <img src="../assets/img/logo/UserImage.png" alt="userpic" class="rounded-circle" width="150" />
                                        <div class="mt-3">
                                            <h4 class="text-capitalize"> <%#Eval("Name") %> </h4>
                                            <p class="text-secondary mb-1"> <%#Eval("Username") %> </p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name:-</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Name") %>
                                        </div>
                                    </div>
                                    <hr />



                                    <%--  --%>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email:-</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Email") %>
                                        </div>
                                    </div>
                                    <hr />

                                    <%--  --%>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Mobile:-</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Mobile") %>
                                        </div>
                                    </div>
                                    <hr />

                                    <%--  --%>


                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address:-</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Address") %>
                                        </div>
                                    </div>
                                    <hr />

                                    <%--  --%>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Resume Uploaded:-</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                           <%#Eval("Resume") == DBNull.Value ? "Not Uploaded" : "Uploaded" %>
                                        </div>
                                    </div>
                                    <hr />

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button id="btnEdit" runat="server" Text="Edit" CssClass="button button-contactForm boxed-btn" CommandName="EditUserProfile"
                                                CommandArgument='<%#Eval("UserId") %>' />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>
