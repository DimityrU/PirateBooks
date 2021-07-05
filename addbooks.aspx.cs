using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PirateBook
{
    public partial class addbooks : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book already exist, try other ID!');</script>");

            }
            else
            {
                addNewBook();
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {

            if (checkIfBookExists())
            {
                updateBook();
            }
            else
            {
                Response.Write("<script>alert('Book doesn't exist, try other ID!');</script>");
            }
            updateBook();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                deleteBook();
            }
            else
            {
                Response.Write("<script>alert('Book doesn't exist, try other ID!');</script>");
            }
        }

        protected void Go_Click(object sender, EventArgs e)
        {
                getBookByID();
        }
        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from books_tbl where book_id= '" + BookID.Text.Trim() + "' OR book_name= '" + Name.Text.Trim() + "';", con);
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

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in Genre.GetSelectedIndices())
                {
                    genres = genres + Genre.Items[i] + ", ";
                }

                genres = genres.Remove(genres.Length - 2);

                string filepath = "~/posters/logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("posters/" + filename));
                filepath = "~/posters/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO books_tbl (book_id, book_name, " +
                    "genre, author, language, book_description, book_img_link) values(@book_id, @book_name, " +
                    "@genre, @author, @language, @book_description, @book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author", Author.Text.Trim());
                cmd.Parameters.AddWithValue("@language", Language.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@book_description", BookDes.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added Successfully');</script>");
                //clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from books_tbl where book_id='" + BookID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Name.Text = dt.Rows[0]["book_name"].ToString();
                    Author.Text = dt.Rows[0]["author"].ToString();
                    Genre.ClearSelection();
                    string[] genres = dt.Rows[0]["genre"].ToString().Trim().Replace(", ", "|").Split('|');
                    for (int i = 0; i < genres.Length; i++)
                    {
                        for (int j = 0; j < Genre.Items.Count; j++)
                        {
                            if (Genre.Items[j].ToString() == genres[i])
                            {
                                Genre.Items[j].Selected = true;
                            }
                        }
                    }
                    Language.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    BookDes.Text = dt.Rows[0]["book_description"].ToString();
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateBook()
        {

                try
                {
                    string genres = "";
                    foreach (int i in Genre.GetSelectedIndices())
                    {
                        genres = genres + Genre.Items[i] + ", ";
                    }

                    genres = genres.Remove(genres.Length - 2);

                    string filepath = "~/posters/logo.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("posters/" + filename));
                        filepath = "~/posters/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE books_tbl set book_name=@book_name, genre=@genre, author=@author," +
                        "language=@language, book_description=@book_description, book_img_link=@book_img_link where book_id='" +
                        BookID.Text.Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@book_name", Name.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author", Author.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", Language.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", BookDes.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
        }

        void deleteBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from books_tbl WHERE book_id='" + BookID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Deleted Successfully');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }        

}