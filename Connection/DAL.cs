using System;
using System.Data;
using System.Data.SqlClient;

namespace QuanLySinhVien.Connection
{
    public class DAL
    {
        public string connectionString;
        public SqlConnection connection;
        public SqlCommand cmd;

        public DAL(string dataSource)
        {
            connectionString = $"Data Source={dataSource};Initial Catalog=KTX_DBMS;Integrated Security=True;MultipleActiveResultSets=true";
            try
            {
                connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                connection.Open();
                cmd = connection.CreateCommand();
                if(cmd is null)
                {
                    throw new Exception();
                }
            }
            catch
            {
                throw new Exception();
            }
        }

        public int? ExecuteScalar(string sql, CommandType type) // Hàm trả về số liệu
        {
            int? result = 0;
            cmd.CommandType = type;
            cmd.CommandText = sql;
            try
            {
                result = (int?)cmd.ExecuteScalar(); // cột đầu tiên của dòng đầu tiên
            }
            catch (SqlException)
            {

            }
            return result;
        }

        public DataTable GetDataToDataTable(string sqlExpess, CommandType type) // Hàm trả về bảng
        {
            DataTable table = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlExpess, connection);
            dataAdapter.Fill(table);
            return table;
        }

        public void ExcuteNonQuery(string sqlExpess, CommandType type, params SqlParameter[] pm) // Hàm thực thi lệnh 
        {
            cmd = connection.CreateCommand();
            cmd.CommandType = type;
            cmd.CommandText = sqlExpess;
            cmd.Parameters.Clear();
            foreach(SqlParameter a in pm)
            {
                cmd.Parameters.Add(a);
            }
            cmd.ExecuteNonQuery();
        }
    }
}
