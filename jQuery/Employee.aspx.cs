using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using Newtonsoft.Json;

namespace jQuery
{
    public partial class Employee : Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetALLCountry()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string Data = JsonConvert.SerializeObject(dt);
            return Data;
        }

        [WebMethod]
        public static string GetALLState(int A)
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 7);
            cmd.Parameters.AddWithValue("@cid", A);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string Data = JsonConvert.SerializeObject(dt);
            return Data;
        }

        [WebMethod]
        public static void Insert(string A, string B, int C, int D, int E)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@name", A);
            cmd.Parameters.AddWithValue("@address", B);
            cmd.Parameters.AddWithValue("@age", C);
            cmd.Parameters.AddWithValue("@country", D);
            cmd.Parameters.AddWithValue("@state", E);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        [WebMethod]
        public static string GetALLData()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string Data = JsonConvert.SerializeObject(dt);
            return Data;
        }

        [WebMethod]
        public static void Delete(int A)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 3);
            cmd.Parameters.AddWithValue("@id", A);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        [WebMethod]
        public static string Edit(int ID)
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 4);
            cmd.Parameters.AddWithValue("@id", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string Data = JsonConvert.SerializeObject(dt);
            return Data;
        }

        [WebMethod]
        public static void Update(int ID, string A, string B, int C, int D, int E)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 5);
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@name", A);
            cmd.Parameters.AddWithValue("@address", B);
            cmd.Parameters.AddWithValue("@age", C);
            cmd.Parameters.AddWithValue("@country", D);
            cmd.Parameters.AddWithValue("@state", E);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}