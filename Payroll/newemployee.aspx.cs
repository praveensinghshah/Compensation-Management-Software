using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class newemployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["currentusertype"] == null || Convert.ToString(Session["currentusertype"]) != "Administrator")
            {
                Response.Redirect("welcome.aspx");
                return;
            }

            if (!IsPostBack)
            {
                dropLevel.Items.Clear();
                DataTable dt = GetLevels();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        dropLevel.Items.Add(row["levelid"].ToString());
                    }
                    dropLevel.SelectedIndex = 0;
                }
                else
                {
                    Response.Redirect("welcome.aspx", false);
                }

                int newEmployeeID = GetNextEmployeeID();
                lblEmployeeID.Text = newEmployeeID.ToString();
                txtName.Focus();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }

    private DataTable GetLevels()
    {
        string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM level ORDER BY levelid", conn))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }
    }

    private int GetNextEmployeeID()
    {
        string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(EmployeesID), 0) + 1 FROM employee", conn))
            {
                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text;
            string phone = txtPhone.Text;
            string email = txtEmail.Text;
            string designation = txtDesignation.Text;
            string levelid = dropLevel.SelectedItem.Text;
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            InsertEmployee(name, phone, email, designation, levelid, username, password);

            Response.Redirect("employees.aspx", false);
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }

    private void InsertEmployee(string name, string phone, string email, string designation, string levelid, string username, string password)
    {
        string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("Employee_CRUD", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@EmpName", name);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Designation", designation);
                cmd.Parameters.AddWithValue("@LevelId", levelid);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Passwordd", password);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
