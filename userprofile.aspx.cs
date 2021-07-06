using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PirateBook
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else if (Session["username"].ToString() == "none" || Session["username"].ToString() == "admin")
                {
                    Response.Write("<script>alert('You must be logged in as USER to view this page');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserDetails();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                        updateUserDetails();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void getUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from users_tbl where user_id='" + Session["username"].ToString() + "';", con);
                //cmd.Parameters.Add(new SqlParameter("@id", BookID.Text.Trim()));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Name.Text = dt.Rows[0]["first_name"].ToString();
                Surname.Text = dt.Rows[0]["surname"].ToString();
                Email.Text = dt.Rows[0]["email"].ToString();
                DoB.Text = dt.Rows[0]["date_of_birth"].ToString();
                Country.SelectedValue = dt.Rows[0]["country"].ToString().Trim();
                Uname.Text = dt.Rows[0]["user_id"].ToString();
                Pswrd.Text = dt.Rows[0]["password"].ToString();

                AccStatus.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "Active")
                {
                    AccStatus.Attributes.Add("class", "badge badge-pill mb-2 bg-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                {
                    AccStatus.Attributes.Add("class", "badge badge-pill mb-2 bg-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Inactive")
                {
                    AccStatus.Attributes.Add("class", "badge badge-pill mb-2 bg-danger");
                }
                else
                {
                    AccStatus.Attributes.Add("class", "badge badge-pill mb-2 bg-info");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

        void updateUserDetails()
        {
            string password = "";
            if (Npswrd.Text.Trim() == "")
            {
                password = Pswrd.Text.Trim();
            }
            else
            {
                password = Npswrd.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update users_tbl set first_name=@first_name, surname=@surname, " +
                    "date_of_birth=@date_of_birth, email=@email, country=@country, password=@password, " +
                    "account_status=@account_status WHERE user_id='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@first_name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@surname", Surname.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@date_of_birth", DoB.Text.Trim());
                cmd.Parameters.AddWithValue("@country", Country.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Your Profile Updated Successfully');</script>");
                    getUserDetails();
                }
                else
                {
                    Response.Write("<script>alert('You Have Made No Changes');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}