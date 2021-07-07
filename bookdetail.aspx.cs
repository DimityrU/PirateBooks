using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIrateBook
{
    public partial class bookdetail : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Write("<script>alert('You must be logged in to view this page');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                displayBook();
                GridView1.DataBind();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Session["status"] == null || Session["status"].ToString() == "Pending" 
                || Session["status"].ToString() == "Inactive")
            {

                Response.Write("<script>alert('Your Account status must be ACTIVE!');</script>");
               
            }
            else
            {
                addNewReview();
            }
            GridView1.DataBind();

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (checkAdmin())
            {
                getReviewId();
                deleteReview();
            }
            else
            {
                getReviewId();
                if (checkUser())
                {
                    deleteReview();
                }
                else
                {
                    Response.Write("<script>alert('You can only delete your reviews!');</script>");

                }
            }
            GridView1.DataBind();

        }

        protected void Read_Click(object sender, EventArgs e)
        {
            getBookLink();
            string FilePath = Server.MapPath(Session["PDF"].ToString());
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
        }

        protected void Dwnld_Click(object sender, EventArgs e)
        {
            getBookLink();
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename= " + Name.Text + ".pdf ");
            Response.TransmitFile(Server.MapPath(Session["PDF"].ToString()));
            Response.End();
        }

        void displayBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from books_tbl where book_id='" + Session["BookID"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Name.Text = dr.GetValue(1).ToString();
                        Author.Text = dr.GetValue(2).ToString();
                        Genre.Text = dr.GetValue(3).ToString();
                        Language.Text = dr.GetValue(4).ToString();
                        Description.Text = dr.GetValue(5).ToString();
                        Cover.ImageUrl = dr.GetValue(6).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewReview()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO review_tbl (book_id, user_id, review)" +
                    " values(@book_id, @user_id, @review)", con);
                cmd.Parameters.AddWithValue("@book_id", Session["BookID"].ToString());
                cmd.Parameters.AddWithValue("@user_id", Session["username"].ToString());
                cmd.Parameters.AddWithValue("@review", Reviews.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Review added Successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getReviewId()
        {
            GridViewRow row = GridView1.SelectedRow;
            int Id = (int)GridView1.DataKeys[row.RowIndex].Values["review_id"];
            Session["ReviewID"] = Id;
        }

        void deleteReview()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from review_tbl WHERE review_id='" + Session["ReviewID"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Review Deleted Successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        bool checkUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from review_tbl where review_id= '" + 
                    Session["ReviewID"].ToString() +"' AND user_id= '" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool checkAdmin()
        {
            if (Session["role"].ToString() == "admin")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        void getBookLink()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from books_tbl where book_id= '" +
                    Session["BookID"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Session["PDF"] = dt.Rows[0]["book_link"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}