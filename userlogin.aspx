<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="PirateBook.userlogin" %>
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
                                <img width="150px" src="imgs/userlogo.png" style="margin-bottom:10px" />
                            </center>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Uname" runat="server" placeholder="User ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator id="R1" runat="server" ForeColor="Red" ErrorMessage="Field is Required!" ControlToValidate="Uname"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator  id="R2" runat="server" ForeColor="Red" ErrorMessage="Unvalid format!" ControlToValidate="Uname" ValidationExpression="[A-Za-z0-9]{6,18}"></asp:RegularExpressionValidator>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Pswrd" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator id="R3" runat="server" ForeColor="Red" ErrorMessage="Field is Required!" ControlToValidate="Pswrd"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator  id="R4" runat="server" ForeColor="Red" ErrorMessage="Password must be at least 8 symbols !" ControlToValidate="Pswrd" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success col-12 mt-3 btn-lg" Text="Login" OnClick="Button1_Click" />
                                </div>

                                <div class="form-group">
                                    <a href="usersignup.aspx"><input id="Button2" class="btn btn-info col-12 mt-3 btn-lg" type="button" value="Sign Up"/></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
