using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PirateBook
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    ULogin.Visible = true;
                    Signup.Visible = true;

                    HelloUser.Visible = false;
                    Logout.Visible = false;

                    FBooks.Visible = false;

                    ALogin.Visible = true;
                    Upload.Visible = false;
                    UserM.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    ULogin.Visible = false;
                    Signup.Visible = false;

                    HelloUser.Visible = true;
                    HelloUser.Text = "Hello " + Session["username"].ToString();
                    Logout.Visible = true;

                    FBooks.Visible = true;

                    ALogin.Visible = true;
                    Upload.Visible = false;
                    UserM.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    ULogin.Visible = false;
                    Signup.Visible = false;

                    HelloUser.Visible = true;
                    HelloUser.Text = "Hello Admin";
                    Logout.Visible = true;

                    FBooks.Visible = true;

                    ALogin.Visible = false;
                    Upload.Visible = true;
                    UserM.Visible = true;
                }
            }
            catch (Exception ex)
            {
            }
            
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("addbooks.aspx");

        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersmanagement.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("findbooks.aspx");

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["name"] = "";
            Session["role"] = "";
            Session["status"] = "";

            ULogin.Visible = true;
            Signup.Visible = true;

            HelloUser.Visible = false;
            Logout.Visible = false;

            FBooks.Visible = false;

            ALogin.Visible = true;
            Upload.Visible = false;
            UserM.Visible = false;
        }
    }
}