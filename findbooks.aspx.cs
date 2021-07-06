﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PirateBook
{
    public partial class findbooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "none")
            {
                Response.Write("<script>alert('You must be logged in to view this page');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                GridView1.DataBind();

            }
        }
    }
}