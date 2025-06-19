﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace SinglifeProject
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        }

        protected void cvDOB_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            DateTime dob;
            if (DateTime.TryParse(txtDOB.Text, out dob))
            {
                int age = DateTime.Now.Year - dob.Year;
                if (dob > DateTime.Now.AddYears(-age)) age--;
                args.IsValid = age >= 21;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string dob = txtDOB.Text;
            string nric = txtNRIC.Text.Trim();
            string password = txtPassword.Text;

            string connStr = ConfigurationManager.ConnectionStrings["Singlife"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 1. Check if email or NRIC already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email OR NRIC = @NRIC";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    checkCmd.Parameters.AddWithValue("@NRIC", nric);

                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        lblError.Text = "An account with this email or NRIC already exists.";
                        return;
                    }
                }

                // 2. Insert into Users table
                string insertQuery = "INSERT INTO Users (Name, Email, DOB, NRIC, PasswordHash) VALUES (@Name, @Email, @DOB, @NRIC, @Password)";
                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                {
                    insertCmd.Parameters.AddWithValue("@Name", name);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@DOB", DateTime.Parse(dob));
                    insertCmd.Parameters.AddWithValue("@NRIC", nric);
                    insertCmd.Parameters.AddWithValue("@Password", password);

                    insertCmd.ExecuteNonQuery();
                }

                // 3. Redirect to Login page
                Response.Redirect("Login.aspx");
            }
        }
    }
}

