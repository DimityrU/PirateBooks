<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="bookdetail.aspx.cs" Inherits="PIrateBook.bookdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PirateBooksConnectionString %>" SelectCommand="SELECT * FROM [review_tbl] WHERE ([book_id] = @book_id)">
                      <SelectParameters>
                          <asp:SessionParameter Name="book_id" SessionField="BookID" Type="String" />
                      </SelectParameters>
                   </asp:SqlDataSource>
                  <div class="row">
                     <div class="col">
                        <center>
                            <asp:Label ID="Name" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                            <asp:Image ID="Cover" runat="server" class="rounded" ImageURL="posters/logo2.jpg"/>
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
                               Author -
                               <asp:Label ID="Author" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                 </div>
                <div class="row">
                      <div class="col-md-12">
                               Genre -
                               <asp:Label ID="Genre" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                 </div>
                <div class="row">
                      <div class="col-md-12">
                               Language -
                               <asp:Label ID="Language" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                   </div>
                <div class="row">
                      <div class="col-md-12">
                               Description -
                               <asp:Label ID="Description" runat="server" Font-Bold="True"></asp:Label>
                      </div>
                   </div>
                <div class="row">
                      <div class="col-md-6">                        
                        <asp:Button ID="Dwnld" class="btn btn-lg mb-1 mt-3 ms-2 col-12  btn-outline-secondary" runat="server" Text="Download"/>
                     </div>
                     <div class="col-md-6">                        
                        <asp:Button ID="Read" class="btn btn-lg mb-1 mt-3 me-2 col-12  btn-outline-secondary" runat="server" Text="Read"/>
                     </div>
                  </div>
               </div>
             <a href="findbooks.aspx"><< Go Back</a><br>
            <br>

            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Reviews</h4>
                        </center>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                           <asp:TextBox CssClass="form-control" ID="Reviews" runat="server" placeholder="Review" TextMode="MultiLine" Rows="2"></asp:TextBox>                        
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                         <center>
                            <asp:Button CssClass="btn btn-lg mb-1 mt-3 col-4  btn-outline-secondary" ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />          
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="review_id" 
                            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnSelectedIndexChanged="Delete_Click">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" >
                                </asp:BoundField>
                                <asp:BoundField DataField="review" HeaderText="Review" SortExpression="review" />
                                <asp:CommandField ControlStyle-CssClass="btn btn-outline-danger" SelectText="Delete" ButtonType="Button" ShowSelectButton="true"/>
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

