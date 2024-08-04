using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class payslips : System.Web.UI.Page
{
    private void Show()
    {
        try
        {
            lnkGeneratePayslip.Visible = false;
            gridPayslips.DataSource = null;
            gridPayslips.DataBind();
            lblMessage.Text = "";
            if (dropEmployee.SelectedIndex > 0)
            {
                lnkGeneratePayslip.Visible = true;
                string empname = dropEmployee.SelectedItem.Text;
                int employeesid = Convert.ToInt32(BusinessAccessLayer.Query("select employeesid from employee where empname='" + empname + "'").Rows[0]["employeesid"]);
                DataTable dt = BusinessAccessLayer.Query("select payslipid,monthname + ' ' + convert(varchar,year) 'MonthAndYear',generatedon,basicsalary,noofleaves,salaryperday,deductionforleaves,netsalary from payslipss ps where employeesid=" + employeesid + " order by year desc,ps.month desc");
                if (dt.Rows.Count > 0)
                {
                    gridPayslips.DataSource = dt;
                    gridPayslips.DataBind();
                }
                else
                    lblMessage.Text = "No payslips found.";
            }
            dropEmployee.Focus();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Session["currentusertype"]) != "Manager")
                Response.Redirect("welcome.aspx");
            if (Page.IsPostBack == false)
            {
                dropEmployee.Focus();
                dropEmployee.Items.Clear();
                dropEmployee.Items.Add("---Select---");
                DataTable dt = BusinessAccessLayer.Query("select * from employee order by empname");
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                        dropEmployee.Items.Add(Convert.ToString(dt.Rows[i]["empname"]));
                    dropEmployee.SelectedIndex = 0;
                    if (Session["currentpayslipemployeeid"] != null && Convert.ToString(Session["currentpayslipemployeeid"]) != "")
                    {
                        int employeesid = Convert.ToInt32(Session["currentpayslipemployeeid"]);
                        string empname = Convert.ToString(BusinessAccessLayer.Query("select empname from employee where employeesid=" + employeesid).Rows[0]["empname"]);
                        dropEmployee.SelectedIndex = dropEmployee.Items.IndexOf(new ListItem(empname));
                        Session["currentpayslipemployeeid"] = null;
                        Show();
                    }
                }
                else
                    Response.Redirect("welcome.aspx", false);
            }
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }
    protected void dropEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        Show();
    }
    protected void gridPayslips_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int payslipid = Convert.ToInt32(gridPayslips.Rows[e.RowIndex].Cells[0].Text);
            string sqlstr = "delete from payslipss where payslipid=" + payslipid;
            BusinessAccessLayer.NonQuery(sqlstr);
            Show();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }
    protected void lnkGeneratePayslip_Click(object sender, EventArgs e)
    {
        try
        {
            if (dropEmployee.SelectedIndex > 0)
            {
                string empname = dropEmployee.SelectedItem.Text;
                DataTable resultTable = BusinessAccessLayer.Query("SELECT employeesid FROM employee WHERE empname = '" + empname + "'");

                if (resultTable.Rows.Count > 0)
                {
                    int employeesid = Convert.ToInt32(resultTable.Rows[0]["employeesid"]);
                    Session["currentpayslipemployeeid"] = employeesid;
                    Response.Redirect("generatepayslip.aspx", false);
                }
                else
                {
                    lblError.Text = "No employee found with the selected name.";
                }
            }
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }

    }
    protected void gridPayslips_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Print")
        {
            int rowindex = Convert.ToInt32(e.CommandArgument);
            string monthandyear = gridPayslips.Rows[rowindex].Cells[1].Text;
            int payslipid = Convert.ToInt32(gridPayslips.Rows[rowindex].Cells[0].Text);
            DataTable dt1 = BusinessAccessLayer.Query("select * from payslipss where payslipid=" + payslipid);
            if (dt1.Rows.Count > 0)
            {
                DataTable dt2 = BusinessAccessLayer.Query("select * from employee where employeesid=" + dt1.Rows[0]["employeesid"]);
                string htmlcode = "";
                htmlcode += "<h1 align=center class='mylabel' style='font-family:Monotype Corsiva;font-size:30px;color:white;background-color:black;'>" + ConfigurationManager.AppSettings["CompanyName"] + "</h1>";
                htmlcode += "<h2 align=center class='mylabel' style='font-family:Tahoma;font-size:16px;'>" + ConfigurationManager.AppSettings["City"] + "</h2>";
                htmlcode += "<h2 align=center class='mylabel' style='font-family:Comic Sans MS;font-size:15px;'>Payslip for the Month of " + monthandyear + "</h2>";
                htmlcode += "<table width=97% class='mylabel' cellpadding=10 align=center>";
                htmlcode += "<tr><td colspan=2><hr></tr>";
                htmlcode += "<tr><td align=right>Employee ID:</td><td>" + dt1.Rows[0]["employeesid"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Employee Name:</td><td>" + dt2.Rows[0]["empname"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Phone:</td><td>" + dt2.Rows[0]["phone"] + "</td></tr>";
                htmlcode += "<tr><td align=right>E-Mail:</td><td>" + dt2.Rows[0]["email"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Designation:</td><td>" + dt2.Rows[0]["designation"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Level:</td><td>" + dt2.Rows[0]["levelid"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Generated On:</td><td>" + dt1.Rows[0]["generatedon"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Basic Salary:</td><td>" + dt1.Rows[0]["basicsalary"] + "</td></tr>";
                htmlcode += "<tr><td align=right>No. of Leaves:</td><td>" + dt1.Rows[0]["noofleaves"] + "</td></tr>";
                htmlcode += "<tr><td align=right>Deduction for Leaves:</td><td>" + dt1.Rows[0]["deductionforleaves"] + "</td></tr>";
                htmlcode += "<tr><td align=right style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>Net Salary</td><td style='font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-top-color:black;border-bottom-color:black;'>" + dt1.Rows[0]["netsalary"] + "</td></tr>";
                htmlcode += "<tr><td align=right></td><td>&nbsp;</td></tr>";
                htmlcode += "<tr><td align=right></td><td align=center style='font-weight:bold'>Signature of the<br>Payroll Manager</td>";
                htmlcode += "</table>";
                Session["htmlcodetoprint"] = htmlcode;
                Response.Write("<script language='javascript'>window.open('print.aspx','prn','toolbar=no,menubar=no,scrollbars=yes,location=no');</script>");
            }
        }
        else if (e.CommandName == "Open")
        {
        }
    }
}