<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="bookdetail.aspx.cs" Inherits="PIrateBook.bookdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PirateBooksConnectionString %>" SelectCommand="SELECT * FROM [books_tbl]"></asp:SqlDataSource>
                  <div class="row">
                     <div class="col">
                        <center style="height: 133px">
                            <asp:Label ID="Name" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center style="height: 101px">
                           &nbsp;<asp:Image ID="Image1" runat="server" Height="96px" Width="133px" />
                        </center>
                     </div>
                  </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                    </div>
                  </div>

                  <div class="row">
                      <div class="col-md-12">
                               <h6>Author -</h6>
                               <asp:Label ID="Author" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                 </div>
                <div class="row">
                      <div class="col-md-12">
                               <h6>Genre -</h6>
                               <asp:Label ID="Genre" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                 </div>
                <div class="row">
                      <div class="col-md-12">
                               <h6>Language -</h6>
                               <asp:Label ID="Language" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                   </div>
                <div class="row">
                      <div class="col-md-12">
                               <h6>Description -</h6>
                               <asp:Label ID="Description" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                   </div>
                <div class="row">
                      <div class="col-md-6">                        
                        <asp:Button ID="Dwnld" class="btn btn-lg mb-1 mt-3 ms-2 col-12  btn-outline-dark" runat="server" Text="Download"/>
                     </div>
                     <div class="col-md-6">                        
                        <asp:Button ID="Read" class="btn btn-lg mb-1 mt-3 me-2 col-12  btn-outline-dark" runat="server" Text="Read"/>
                     </div>
                  </div>
               </div>
             <a href="findbooks.aspx"><< Go Back</a><br>
            <br>
            </div>
         </div>
      </div>
</asp:Content>

