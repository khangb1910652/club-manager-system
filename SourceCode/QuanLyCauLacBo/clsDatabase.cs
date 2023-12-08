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
                con = new SqlConnection("Server=KHANGEACE\\SQLEXPRESS; Database=QuanLyCLB; uid=sa; pwd=b1910652");
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
