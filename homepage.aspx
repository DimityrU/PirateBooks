<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="PirateBook.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/banner1.jpg" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our 2 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="imgs/search.png" width="150px" />
                        <h4>Search Books online</h4>
                        <p>You can search for your favourite books</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="imgs/reading.png" width="150px" />
                        <h4>Reading Books online</h4>
                        <p>You can read the first pages of the book you like</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="imgs/download.png" width="150px" />
                        <h4>Download Digital Books</h4>
                        <p>You can download your favourite books in pdf format for free</p>
                    </center>
                </div>
            </div>
        </div>
    </section>

    <section>
        <img src="imgs/banner2.jpg" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Future Features</h2>
                        <p><b>Our Goals</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <center>
                        <img src="imgs/edit.png" width="150px" />
                        <h4>Edit Description in our site</h4>
                        <p>You will be able to upgrade, add or change our descriptions </p>
                    </center>
                </div>

                <div class="col-md-6">
                    <center>
                        <img src="imgs/add2.png" width="150px" />
                        <h4>Add Books in our site</h4>
                        <p>Soon you will be able to add books to our collection</p>
                    </center>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
