<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="PIrateBook.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <<link href="css/StyleSheet.css" rel="stylesheet" />
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
                                    <h4>Sign Up</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Uname" runat="server" placeholder="Username"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Pswrd" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CPswrd" CssClass="form-control" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
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
                                    <asp:DropDownList ID="DropDownList1" runat="server">
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

                         <div class="form-group">
                                <a href="usersignup.aspx"><input id="Button2" class="btn btn-info col-12 mt-5 btn-lg" type="button" value="Sign Up" /></a>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
