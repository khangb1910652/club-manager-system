using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
namespace QuanLyCauLacBo
{
    class clsDatabase
    {
        public static SqlConnection con;
        public static bool OpenConnection()
        {
            try
            {
                con = new SqlConnection("Data Source=QUOCBAO;Initial Catalog=QuanLyCLB;Integrated Security=True");
                con.Open();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        public static bool CloseConnection()
        {
            try
            {
                con.Close();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
