<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="JobPortal.Admin.JobList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4 pb-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">Job List</h3>

        <div class="row mb-3 pt-sm-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" EmptyDataText="No Record To Display" AutoGenrationColumns="false"
                    AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="JobId" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
                    <Columns>

                      <%--<asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CompneyName" HeaderText="CompanyName">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                        
                         <%--<asp:BoundField DataField="JobId" HeaderText="JobId">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                       <asp:BoundField DataField="JobTitle" HeaderText="Job Title">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="NoOfPost" HeaderText="No. Of Post">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Experience" HeaderText="Experience Required">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Salary" HeaderText="Salary">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="JobType" HeaderText="Job Type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Website" HeaderText="Website">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Email" HeaderText="Email">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Address" HeaderText="Address">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="LastDateToApply" HeaderText="Valid Till" DataFormatString="{0:dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:BoundField DataField="State" HeaderText="State">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="City" HeaderText="City">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="PinCode" HeaderText="PinCode">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" DataFormatString="{0:dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>

                        <%--<asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton id="btnEditJob" CommandName="EditJob" CommandArgument='<%# Eval("JobId") %>''>
                                    <asp:Image id="Image" runat="server" ImageUrl="../assets/img/icon/Edit.jpg" Height="25px" />
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>--%>

                        <asp:CommandField CausesValidation="false" HeaderText="delete" ShowDeleteButton="true" DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                            <ControlStyle  Height="25px" Width="25px"/>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField >
                    </Columns>
                    <HeaderStyle BackColor="#343a40" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
