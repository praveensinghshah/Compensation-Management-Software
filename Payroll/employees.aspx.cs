using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employees : System.Web.UI.Page
{
    
    private string connectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Employee_CRUD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "SELECT");

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    gridEmployees.DataSource = dt;
                    gridEmployees.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }

    protected void gridEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int employeeID = Convert.ToInt32(gridEmployees.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Employee_CRUD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "DELETE");
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

           
            BindGrid();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }

    protected void gridEmployees_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridEmployees.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gridEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridEmployees.EditIndex = -1;
        BindGrid();
    }

    protected void gridEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = gridEmployees.Rows[e.RowIndex];
            int employeeID = Convert.ToInt32(gridEmployees.DataKeys[e.RowIndex].Value);

            TextBox txtEmpName = row.FindControl("txtEmpName") as TextBox;
            TextBox txtPhone = row.FindControl("txtPhone") as TextBox;
            TextBox txtEmail = row.FindControl("txtEmail") as TextBox;
            TextBox txtDesignation = row.FindControl("txtDesignation") as TextBox;
            TextBox txtLevelId = row.FindControl("txtLevelId") as TextBox;
            TextBox txtUsername = row.FindControl("txtUsername") as TextBox;
            TextBox txtPasswordd = row.FindControl("txtPasswordd") as TextBox;

            if (txtEmpName == null || txtPhone == null || txtEmail == null || txtDesignation == null ||
                txtLevelId == null || txtUsername == null || txtPasswordd == null)
            {
                lblError.Text = "Error: One or more controls are missing.";
                return;
            }

            string empName = txtEmpName.Text;
            long phone;
            if (!long.TryParse(txtPhone.Text, out phone))
            {
                lblError.Text = "Error: Invalid phone number.";
                return;
            }

            string email = txtEmail.Text;
            string designation = txtDesignation.Text;
            int levelId;
            if (!int.TryParse(txtLevelId.Text, out levelId))
            {
                lblError.Text = "Error: Invalid level ID.";
                return;
            }

            string username = txtUsername.Text;
            string passwordd = txtPasswordd.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Employee_CRUD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "UPDATE");
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                    cmd.Parameters.AddWithValue("@EmpName", empName);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Designation", designation);
                    cmd.Parameters.AddWithValue("@LevelId", levelId);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Passwordd", passwordd);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            gridEmployees.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }
}
