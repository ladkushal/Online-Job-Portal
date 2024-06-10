<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="JobPortal.Admin.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4 pb-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">Add Job</h3>

        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtComName" style="font-weight:600">Company Name</label>
                <asp:TextBox ID="txtComName" runat="server" CssClass="form-control" placeholder="Enter Your Compney Name" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtComLogo" style="font-weight:600">Company Logo</label>
                <asp:FileUpload ID="txtComLogo" CssClass="form-control" ToolTip=".jpg .jpeg .png Extention Only" runat="server" />
            </div>
        </div>


        <%--  --%>
        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtJobTitle" style="font-weight:600">Job Title</label>
                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex:- WebDevloper,Mobile app devloper, ios devloper" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtNoPost" style="font-weight:600">Number Of Posting</label>
                <asp:TextBox ID="txtNoPost" runat="server" CssClass="form-control" placeholder="Number Of Posting" TextMode="Number" required></asp:TextBox>
            </div>
        </div>
        <%--  --%>
        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtJobTitle" style="font-weight:600">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Job Description" TextMode="MultiLine" required></asp:TextBox>
            </div>

        </div>
        <%--  --%>
        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtQulification" style="font-weight:600">Job Qulification Required</label>
                <asp:TextBox ID="txtQulification" runat="server" CssClass="form-control" placeholder="Ex:- B.tech/M.tech/Bca/Mca" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtExpReq" style="font-weight:600">Experience Required</label>
                <asp:TextBox ID="txtExpReq" runat="server" CssClass="form-control" placeholder="Ex:- 1 Year , 2 Year , 5 Year" TextMode="Number" required></asp:TextBox>
            </div>
        </div>
        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtSalary" style="font-weight:600">Expected salary</label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Ex:- 25k/month " required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtLastDate" style="font-weight:600">Last Date To Apply</label>
                <asp:TextBox ID="txtLastDate" runat="server" CssClass="form-control" placeholder="Last Date For Apply" TextMode="Date" required></asp:TextBox>
            </div>
        </div>

        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtJobType" style="font-weight:600">Job Type</label>
                <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Select Job Type</asp:ListItem>
                    <asp:ListItem>Full Time</asp:ListItem>
                    <asp:ListItem>Part Time</asp:ListItem>
                    <asp:ListItem>Remote</asp:ListItem>
                    <asp:ListItem>Intenship</asp:ListItem>
                    <asp:ListItem>Freelance</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Job Type Required" ForeColor="Red" ControlToValidate="ddlJobType" InitialValue="0"
                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtWebsite" style="font-weight:600">Website</label>
                <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" placeholder="Enter your Website" TextMode="Url" required></asp:TextBox>
            </div>
        </div>
        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtEmail" style="font-weight:600">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Id" TextMode="Email" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtSkills" style="font-weight:600">Skills Required</label>
                <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" placeholder="Skills Required"  required></asp:TextBox>
            </div>
        </div>

        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <label for="txtAdd" style="font-weight:600">Company Address</label>
                <asp:TextBox ID="txtAdd" runat="server" CssClass="form-control" placeholder="Enter Company Address" TextMode="MultiLine" required></asp:TextBox>
            </div>

        </div>
        <%--  --%>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtState" style="font-weight:600">State</label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtCity" style="font-weight:600">City</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City"  required></asp:TextBox>
            </div>
        </div>

        <%--  --%>


        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <label for="txtPinCode" style="font-weight:600">Pin-Code</label>
                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" placeholder="Enter Company Address Pin-Code" TextMode="Number" required></asp:TextBox>
            </div>

            <div class="col-md-6 pt-3">
                <label for="txtWorkHours" style="font-weight:600">Working Hours</label>
                <asp:TextBox ID="txtWorkHours" runat="server" CssClass="form-control" placeholder="Working Hours"  required></asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-5 pt-4">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAddJob" runat="server" Text="Add Job" cssClass="btn btn-primary btn-block" BackColor="#343a40" OnClick="btnAddJob_Click" />
            </div>
        </div>

        <%--  --%>
    </div>

</asp:Content>
