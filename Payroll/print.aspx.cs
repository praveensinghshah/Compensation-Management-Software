using System;
using System.Web.UI;

public partial class print : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string htmlcode = Convert.ToString(Session["htmlcodetoprint"]);
            Session["htmlcodetoprint"] = null;
            Response.Write(htmlcode);
            Response.Write("<script language='javascript'>window.print();</script>");
        }
    }
}