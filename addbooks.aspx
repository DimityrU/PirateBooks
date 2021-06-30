<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="addbooks.aspx.cs" Inherits="PIrateBook.addbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                           <h4>Add Book</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" class="rounded" src="imgs/logo2.jpg" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                    </div>
                  </div>

                   <div class="row">
                       <div class="col-md-12">
                           <label>Choose Poster</label>
                           <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                       </div>
                   </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control rounded" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary rounded ms-1" Text="Go" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <label>Book Name</label>
                            <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Book Name"></asp:TextBox>
                            </div>
                        </div>
                   </div>

                  <div class="row">

                    <div class="col-md-8">
                        <label>Author</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                               placeholder="Author"></asp:TextBox>
                        </div>
                        <label>Language</label>
                        <div class="form-group">
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Bulgarian" Value="Bulgarian" />
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Spanish" Value="Spanish" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Russian" Value="Russian" />
                            </asp:DropDownList>
                        </div>
                    </div>

                       <div class="col-md-4">
                        <label>Genre</label>
                        <div class="form-group">
                            <asp:ListBox ID="ListBox1" runat="server" CssClass="form-control" SelectionMode="Multiple">
                                <asp:ListItem Text="Action" Value="Action" />
                                <asp:ListItem Text="Adventure" Value="Adventure" />
                                <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                <asp:ListItem Text="Self Help" Value="Self Help" />
                                <asp:ListItem Text="Motivation" Value="Motivation" />
                                <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                <asp:ListItem Text="Wellness" Value="Wellness" />
                                <asp:ListItem Text="Crime" Value="Crime" />
                                <asp:ListItem Text="Drama" Value="Drama" />
                                <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                <asp:ListItem Text="Horror" Value="Horror" />
                                <asp:ListItem Text="Poetry" Value="Poetry" />
                                <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                <asp:ListItem Text="Romance" Value="Romance" />
                                <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                <asp:ListItem Text="Suspense" Value="Suspense" />
                                <asp:ListItem Text="Thriller" Value="Thriller" />
                                <asp:ListItem Text="Art" Value="Art" />
                                <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                <asp:ListItem Text="Health" Value="Health" />
                                <asp:ListItem Text="History" Value="History" />
                                <asp:ListItem Text="Math" Value="Math" />
                                <asp:ListItem Text="Textbook" Value="Textbook" />
                                <asp:ListItem Text="Science" Value="Science" />
                                <asp:ListItem Text="Travel" Value="Travel" />
                            </asp:ListBox>
                        </div>
                    </div>

                  </div>

                  <div class="row">
                     <div class="col-12">
                        <label>Book Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                      <div class="col-md-4">                        
                        <asp:Button ID="Button4" class="btn btn-lg mt-3 col-12 btn-success" runat="server" Text="Add" />
                     </div>
                      <div class="col-md-4">                        
                        <asp:Button ID="Button3" class="btn btn-lg mt-3 col-12 btn-primary" runat="server" Text="Update" />
                     </div>
                     <div class="col-md-4">                        
                        <asp:Button ID="Button2" class="btn btn-lg mt-3 col-12 btn-danger" runat="server" Text="Delete" />
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
                           <h4>Our Books</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                     </div>
                  </div>

               </div>
            </div>
         </div>

      </div>
   </div>

</asp:Content>
