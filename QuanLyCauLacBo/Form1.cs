using System.Data.SqlClient;
using System.Data;
using System.Drawing.Drawing2D;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace QuanLyCauLacBo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void set_background(Object sender, PaintEventArgs e)
        {
            Graphics graphics = e.Graphics;

            //the rectangle, the same size as our Form
            Rectangle gradient_rectangle = new Rectangle(0, 0, Width, Height);

            //define gradient's properties
            Brush b = new LinearGradientBrush(gradient_rectangle, Color.FromArgb(0, 0, 0), Color.FromArgb(57, 128, 227), 65f);

            //apply gradient         
            graphics.FillRectangle(b, gradient_rectangle);
        }

        private void btnDangnhap_Click(object sender, EventArgs e)
        {
            clsDatabase.OpenConnection();
            string query = "Select * from taiKhoan where tenDangNhap = '" + txtTendangnhap.Text.Trim() + "' and matKhau = '" + txtMatkhau.Text.Trim() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            if (dtbl.Rows.Count == 1)
            {
                Form frm = new Form2(Convert.ToString(txtTendangnhap.Text), Convert.ToString(dtbl.Rows[0]["quyen"].ToString()));
                frm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Vui lòng kiểm tra lại tên đăng nhập hoặc mật khẩu!");
                txtTendangnhap.Text = "";
                txtMatkhau.Text = "";
                txtTendangnhap.Focus();
            }

        }

        private void txtTendangnhap_TextChanged(object sender, EventArgs e)
        {
            txtTendangnhap.ForeColor = Color.LightGray;

        }
    }
}