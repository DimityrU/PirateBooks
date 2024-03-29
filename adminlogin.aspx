﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="PirateBook.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body form-horizontal">

                        <div class="row">
                        <div class="col">
                            <center>
                                <img width="150px" src="imgs/adminlogo.png" />
                            </center>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
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
                                <label>Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Uname" runat="server" placeholder="Admin ID"></asp:TextBox>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Pswrd" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success col-12 mt-2 btn-lg" Text="Login" OnClick="Button1_Click" />
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
