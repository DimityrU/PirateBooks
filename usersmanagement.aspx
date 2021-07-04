<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="usersmanagement.aspx.cs" Inherits="PirateBook.membermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>User Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/userlogo.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                    </div>
                  </div>

                  <div class="row">

                     <div class="col-md-4">
                        <label>User ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control rounded" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary rounded ms-1" runat="server" OnClick="LinkButton4_Click">
                                <i class="fas fa-check-circle"></i></asp:LinkButton>
                            </div>
                        </div>
                     </div>

                       <div class="col-md-4">
                            <label>First Name</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="First Name" ReadOnly="True"></asp:TextBox>
                            </div>
                     </div>

                       <div class="col-md-4">
                        <label>Surname</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Surname" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                  </div>

                  <div class="row">

                     <div class="col-md-4">
                        <label>Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                               placeholder="Email" ReadOnly="True" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                               TextMode="Date" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                      <div class="col-md-4">
                        <label>Country</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                               placeholder="Country" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                  </div>

                  <div class="row">                                          
                     <div class="col-md-6 m-auto">
                        <label>Account status</label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control rounded" ID="TextBox5" runat="server" placeholder="Account status" ReadOnly="True"></asp:TextBox>
                            <asp:LinkButton ID="Activate" CssClass="btn btn-success ms-1 rounded" runat="server" OnClick="Activate_Click">
                                <i class="fas fa-check-circle"></i></asp:LinkButton>
                            <asp:LinkButton ID="Dact" CssClass="btn btn-danger ms-1 rounded" runat="server" OnClick="Dact_Click">
                                <i class="fas fa-times-circle"></i></asp:LinkButton>                         
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div>
                        <asp:Button ID="Delete" class="btn btn-lg col-12 mt-3 btn-danger" runat="server" Text="Delete User" OnClick="Button2_Click" />
                     </div>
                  </div>

               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>

         <div class="col-md-7">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>User List</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PirateBooksConnectionString %>" SelectCommand="SELECT * FROM [users_tbl]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="UserID" ReadOnly="True" SortExpression="user_id" />
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:DynamicField DataField="first_name" HeaderText="First name" />
                                <asp:DynamicField DataField="surname" HeaderText="Last name" />
                                <asp:DynamicField DataField="country" HeaderText="Country" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>

               </div>
            </div>
         </div>

      </div>
   </div>
</asp:Content>
