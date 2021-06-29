<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="PIrateBook.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/StyleSheet.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body form-horizontal">

                        <div class="row">
                        <div class="col">
                            <center>
                                <img width="150px" src="img/userlogo.png" style="margin-bottom:40px" />
                            </center>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>My Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label CssClass="badge badge-pill mb-2 bg-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>First Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Name" runat="server" placeholder="First Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Surname</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Surname" runat="server" placeholder="Surname"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="DoB" runat="server" placeholder="Date of birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Country</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" CssClass="btn col-12 btn-light dropdown-toggle" runat="server">
                                        <asp:ListItem Text="Choose a country" Value="Choose a country" />
                                        <asp:ListItem Text="Bulgaria" Value="Bulgaria" />
                                        <asp:ListItem Text="England" Value="England" />
                                        <asp:ListItem Text="Spain" Value="Spain" />
                                        <asp:ListItem Text="France" Value="France" />
                                        <asp:ListItem Text="USA" Value="USA" />
                                        <asp:ListItem Text="Germany" Value="Germany" />
                                        <asp:ListItem Text="Sweden" Value="Sweden" />
                                        <asp:ListItem Text="Turkey" Value="Turkey" />
                                        <asp:ListItem Text="Hungary" Value="Hungary" />
                                        <asp:ListItem Text="Netherlands" Value="Netherlands" />
                                        <asp:ListItem Text="Russia" Value="Russia" />
                                    </asp:DropDownList>
                                   
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label CssClass="badge mt-3 mb-2 badge-pill bg-info" ID="Label2" 
                                        runat="server" Text="Login Credentials"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Old Password" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                         <div class="form-group m-auto">
                             <center>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary col-8 mt-3 btn-lg" Text="Update" />
                            </center>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>

</asp:Content>
