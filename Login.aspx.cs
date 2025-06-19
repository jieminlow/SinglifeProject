using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace SinglifeProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text; // Compare against stored hash in real use

            string connStr = ConfigurationManager.ConnectionStrings["Singlife"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT PasswordHash FROM Users WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    object result = cmd.ExecuteScalar();

                    if (result == null)
                    {
                        lblError.Text = "Email not found.";
                    }
                    else
                    {
                        string storedPassword = result.ToString();
                        if (password == storedPassword)
                        {
                            Session["UserEmail"] = email;
                            Response.Redirect("HomePage.aspx"); // Replace with your post-login page
                        }
                        else
                        {
                            lblError.Text = "Incorrect password.";
                        }
                    }
                }
            }
        }
    }
}

