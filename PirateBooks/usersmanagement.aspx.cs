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
    public partial class membermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() == "username")
            {
                Response.Write("<script>alert('You must be logged in as ADMIN to view this page!');</script>");
                Response.Redirect("adminlogin.aspx");
            }
            else if(Session["role"].ToString() == "admin")
            {
                GridView1.DataBind();

            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getUserById();
        }

        protected void Activate_Click(object sender, EventArgs e)
        {
            AccStatus("Active");
        }
        protected void Dact_Click(object sender, EventArgs e)
        {
            AccStatus("Inactive");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            deleteUserByID();
        }
        


        void getUserById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from users_tbl where user_id='" + Uname.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Name.Text = dr.GetValue(0).ToString();
                        Surname.Text = dr.GetValue(1).ToString();
                        Email.Text = dr.GetValue(2).ToString();
                        Date.Text = dr.GetValue(3).ToString();
                        Country.Text = dr.GetValue(4).ToString();
                        Astatus.Text = dr.GetValue(8).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void AccStatus(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE users_tbl SET account_status='" + status + "'WHERE user_id='"+Uname.Text.Trim()+"'", con);
                Astatus.Text = status;
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Status updated');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from users_tbl where user_id='" + Uname.Text.Trim() + "';", con);
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

        void deleteUserByID()
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from users_tbl WHERE user_id='" + Uname.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }
        }

        void clearForm()
        {
            Uname.Text = "";
            Name.Text = "";
            Surname.Text = "";
            Email.Text = "";
            Date.Text = "";
            Country.Text = "";
            Astatus.Text = "";
        }
    }
}