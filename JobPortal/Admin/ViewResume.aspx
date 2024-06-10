<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewResume.aspx.cs" Inherits="JobPortal.Admin.ViewResume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4 pb-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">View Resumes</h3>

        <div class="row mb-3 pt-sm-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" EmptyDataText="No Record To Display" AutoGenrationColumns="false"
                    AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="AppliedJobId" OnRowDeleting="GridView1_RowDeleting"
                      OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <Columns>

                        <%--<asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CompneyName" HeaderText="CompanyName">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Username" HeaderText="User Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:BoundField DataField="Email" HeaderText="Email">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Mobile" HeaderText="Mobile Number">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>

                        <asp:TemplateField HeaderText="Resume">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" style="color:black" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.Resume","../{0}") %>'><i class="fas fa-download" ></i> Download</asp:HyperLink>
                                <asp:HiddenField ID="hdnJobId" runat="server" Value='<%# Eval("JobId") %>' Visible="false" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>

                        <asp:CommandField CausesValidation="false" HeaderText="delete" ShowDeleteButton="true" DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                            <ControlStyle Height="25px" Width="25px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#343a40" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
