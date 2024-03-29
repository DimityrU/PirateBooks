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
            if (Session["role"] == null)
            {
                Response.Write("<script>alert('You must be logged in to view this page');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                GridView1.DataBind();

            }

        }

        protected void Detail_Click(object sender, EventArgs e)
        {
            getBookId();
            Response.Redirect("bookdetail.aspx");
        }

        void getBookId()
        {
            GridViewRow row = GridView1.SelectedRow;
            string Id = (string)GridView1.DataKeys[row.RowIndex].Values["book_id"];
            Session["BookID"] = Id;
        }
    }
}