using Microsoft.VisualBasic.Logging;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace QuanLyCauLacBo
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        private string _tenDangNhap;
        private string? _quyen;
        public Form2(string tenDangNhap, string? quyen) : this()
        {
            _tenDangNhap = tenDangNhap;
            _quyen = quyen;
            if (_quyen == "Admin")
            {
                lbThongTin.Text = _tenDangNhap + " - Quản lý";
            }
            else
            {
                lbThongTin.Text = _tenDangNhap + " - Thành viên";
                btnThem.Visible = false;
                btnSua.Visible = false;
                btnXoa.Visible = false;

                btnThemsk.Visible = false;
                btnSuask.Visible = false;
                btnXoask.Visible = false;

                btnThemTC.Visible = false;
                btnSuaTC.Visible = false;
                btnXoaTC.Visible = false;
            }

        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            DataGridViewRow row = new DataGridViewRow();
            if (e.RowIndex >= 0)
            {
                row = dgwDanhSachSinhVien.Rows[e.RowIndex];
                txtCCCD.Text = Convert.ToString(row.Cells["cccd"].Value);
                txtHoten.Text = Convert.ToString(row.Cells["hoTen"].Value);
                String? gioiTinh = Convert.ToString(row.Cells["gioiTinh"].Value);
                if (gioiTinh == "Nam")
                {
                    cbxGioitinh.SelectedIndex = 0;
                }
                else
                {
                    cbxGioitinh.SelectedIndex = 1;
                }
                dtpNgaysinh.Text = Convert.ToString(row.Cells["ngaySinh"].Value);
                txtTrinhdo.Text = Convert.ToString(row.Cells["trinhDo"].Value);
                txtDiachi.Text = Convert.ToString(row.Cells["diaChi"].Value);
                txtSodienthoai.Text = Convert.ToString(row.Cells["soDienThoai"].Value);
                txtEmail.Text = Convert.ToString(row.Cells["email"].Value);
                dtpNgaythamgia.Text = Convert.ToString(row.Cells["ngayThamGia"].Value);
                String? chucVu = Convert.ToString(row.Cells["tenCV"].Value);
                switch (chucVu)
                {
                    case "Thành viên":
                        cbxChucvu.SelectedIndex = 0;
                        break;
                    case "Trưởng câu lạc bộ":
                        cbxChucvu.SelectedIndex = 1;
                        break;
                    case "Phó câu lạc bộ":
                        cbxChucvu.SelectedIndex = 2;
                        break;
                    case "Huấn luyện viên câu lạc bộ":
                        cbxChucvu.SelectedIndex = 3;
                        break;
                }
                txtTongtien.Text = Convert.ToString(row.Cells["tongTien"].Value);
            }
        }
        public void showDanhSachThanhVien()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select cccd, hoTen, (CASE WHEN gioiTinh='0' THEN 'Nam' ELSE N'Nữ' END) AS gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, ngayThamGia, tongTien, tenCV from thanhVien join chucVu on thanhVien.maCV = chucVu.maCV order by ngayThamGia DESC;";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            dgwDanhSachSinhVien.DataSource = dttb;
            dgwDanhSachSinhVien.Columns[0].HeaderText = "Căn cước công dân";
            dgwDanhSachSinhVien.Columns[1].HeaderText = "Họ tên";
            dgwDanhSachSinhVien.Columns[2].HeaderText = "Giới tính";
            dgwDanhSachSinhVien.Columns[3].HeaderText = "Ngày sinh";
            dgwDanhSachSinhVien.Columns[3].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgwDanhSachSinhVien.Columns[4].HeaderText = "Email";
            dgwDanhSachSinhVien.Columns[5].HeaderText = "Số điện thoại";
            dgwDanhSachSinhVien.Columns[6].HeaderText = "Địa chỉ";
            dgwDanhSachSinhVien.Columns[7].HeaderText = "Trình độ";
            dgwDanhSachSinhVien.Columns[8].HeaderText = "Ngày tham gia";
            dgwDanhSachSinhVien.Columns[8].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgwDanhSachSinhVien.Columns[9].HeaderText = "Đóng góp";
            dgwDanhSachSinhVien.Columns[10].HeaderText = "Chức vụ";
            dgwDanhSachSinhVien.ReadOnly = true;
        }
        public void showDanhSachSuKien()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi, (select count(*) from danhSachThamGia where danhSachThamGia.maSK = suKien.maSK) as soNguoiThamGia from suKien order by thoiGianBatDau DESC;";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            dgvDanhSachSuKien.DataSource = dttb;
            dgvDanhSachSuKien.Columns[0].HeaderText = "Mã sự kiện";
            dgvDanhSachSuKien.Columns[1].HeaderText = "Tên sự kiện";
            dgvDanhSachSuKien.Columns[2].HeaderText = "Nội dung sự kiện";
            dgvDanhSachSuKien.Columns[3].HeaderText = "Thời gian bắt đầu";
            dgvDanhSachSuKien.Columns[3].DefaultCellStyle.Format = "dd/MM/yyyy hh:mm:ss";
            dgvDanhSachSuKien.Columns[4].HeaderText = "Thời gian kết thúc";
            dgvDanhSachSuKien.Columns[4].DefaultCellStyle.Format = "dd/MM/yyyy hh:mm:ss";
            dgvDanhSachSuKien.Columns[5].HeaderText = "Địa điểm";
            dgvDanhSachSuKien.Columns[6].HeaderText = "Phí";
            dgvDanhSachSuKien.Columns[7].HeaderText = "Số người tham gia";
            dgvDanhSachSuKien.ReadOnly = true;
        }

        public void showDanhSachThamGia()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select thanhVien.cccd, hoTen, (CASE WHEN gioiTinh='0' THEN 'Nam' ELSE N'Nữ' END) AS gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, ngayThamGia, tongTien, tenCV from danhSachThamGia join thanhVien on thanhVien.cccd = danhSachThamGia.cccd join chucVu on thanhVien.maCV = chucVu.maCV join suKien on suKien.maSK = danhSachThamGia.maSK where danhSachThamGia.maSK = '" + txtMasukien.Text + "';";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            dgvDanhSachThamGia.DataSource = dttb;
            dgvDanhSachThamGia.Columns[0].HeaderText = "Căn cước công dân";
            dgvDanhSachThamGia.Columns[1].HeaderText = "Họ tên";
            dgvDanhSachThamGia.Columns[2].HeaderText = "Giới tính";
            dgvDanhSachThamGia.Columns[3].HeaderText = "Ngày sinh";
            dgvDanhSachThamGia.Columns[3].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvDanhSachThamGia.Columns[4].HeaderText = "Email";
            dgvDanhSachThamGia.Columns[5].HeaderText = "Số điện thoại";
            dgvDanhSachThamGia.Columns[6].HeaderText = "Địa chỉ";
            dgvDanhSachThamGia.Columns[7].HeaderText = "Trình độ";
            dgvDanhSachThamGia.Columns[8].HeaderText = "Ngày tham gia";
            dgvDanhSachThamGia.Columns[8].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvDanhSachThamGia.Columns[9].HeaderText = "Đóng góp";
            dgvDanhSachThamGia.Columns[10].HeaderText = "Chức vụ";
            dgvDanhSachThamGia.ReadOnly = true;
        }
        public void showTaiChinh()
        {
            clsDatabase.OpenConnection();
            string query = "select soDu from taiChinh";
            DataTable dttb = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            txtSodu.Text = Convert.ToString(dttb.Rows[0]["soDu"].ToString());

            string query1 = "select SUM(soTien) as tongThu FROM dongGop";
            DataTable dttb1 = new DataTable();
            SqlDataAdapter sda1 = new SqlDataAdapter(query1, clsDatabase.con);
            sda1.Fill(dttb1);
            txtTongthu.Text = Convert.ToString(dttb1.Rows[0]["tongThu"].ToString());

            string query2 = "select SUM(phi) as tongChi FROM suKien";
            DataTable dttb2 = new DataTable();
            SqlDataAdapter sda2 = new SqlDataAdapter(query2, clsDatabase.con);
            sda2.Fill(dttb2);
            txtTongchi.Text = Convert.ToString(dttb2.Rows[0]["tongChi"].ToString());
        }
        public void showDanhSachDongGop()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select thanhVien.cccd, hoTen, email, soDienThoai, diaChi, soTien, ngayDong, tongTien, ngayThamGia, tenCV from dongGop join thanhVien on dongGop.cccd = thanhVien.cccd join chucVu on thanhVien.maCV = chucVu.maCV order by ngayDong DESC;";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            dgvDanhSachDongGop.DataSource = dttb;
            dgvDanhSachDongGop.Columns[0].HeaderText = "Căn cước công dân";
            dgvDanhSachDongGop.Columns[1].HeaderText = "Họ tên";
            dgvDanhSachDongGop.Columns[2].HeaderText = "Email";
            dgvDanhSachDongGop.Columns[3].HeaderText = "Số điện thoại";
            dgvDanhSachDongGop.Columns[4].HeaderText = "Địa chỉ";
            dgvDanhSachDongGop.Columns[5].HeaderText = "Đóng góp";
            dgvDanhSachDongGop.Columns[5].DefaultCellStyle.Format = "dd/MM/yyyy hh:mm:ss";
            dgvDanhSachDongGop.Columns[6].HeaderText = "Ngày đóng";
            dgvDanhSachDongGop.Columns[7].HeaderText = "Tổng số tiền đã đóng";
            dgvDanhSachDongGop.Columns[8].HeaderText = "Ngày tham gia";
            dgvDanhSachDongGop.Columns[8].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvDanhSachDongGop.Columns[9].HeaderText = "Chức vụ";
            dgvDanhSachDongGop.ReadOnly = true;
        }
        private void Form2_Load(object sender, EventArgs e)
        {
            showDanhSachThanhVien();
            showDanhSachSuKien();
            reset();
            showTaiChinh();
            showDanhSachDongGop();
            showDanhSachThamGia();
        }
        private void loadGioiTinh()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select DISTINCT gioiTinh, (CASE WHEN gioiTinh='0' THEN 'Nam' ELSE N'Nữ' END) as displayGioiTinh from thanhVien";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            cbxGioitinh.DataSource = dttb;
            cbxGioitinh.DisplayMember = "displayGioiTinh";
            cbxGioitinh.ValueMember = "gioiTinh";
            clsDatabase.CloseConnection();
        }
        private void loadChucVu()
        {
            DataTable dttb = new DataTable();
            clsDatabase.OpenConnection();
            string query = "select * from chucVu order by maCV DESC";
            SqlDataAdapter sda = new SqlDataAdapter(query, clsDatabase.con);
            sda.Fill(dttb);
            cbxChucvu.DataSource = dttb;
            cbxChucvu.DisplayMember = "tenCV";
            cbxChucvu.ValueMember = "maCV";
            clsDatabase.CloseConnection();
        }

        private void reset()
        {
            txtCCCD.Text = "";
            txtHoten.Text = "";
            loadGioiTinh();
            dtpNgaysinh.Value = DateTime.Now;
            txtTrinhdo.Text = "";
            txtDiachi.Text = "";
            txtSodienthoai.Text = "";
            txtEmail.Text = "";
            dtpNgaythamgia.Value = DateTime.Now;
            loadChucVu();

            txtTensukien.Text = "";
            txtNoidungsk.Text = "";
            txtDiadiem.Text = "";
            txtPhi.Text = "";
            dtpTgbatdau.Value = DateTime.Now;
            dtpTgketthuc.Value = DateTime.Now;
            txtMasukien.Text = "";

            txtCCCDtc.Text = "";
            txtSotien.Text = "";
            dtpNgayDong.Value = DateTime.Now;
        }
        private static bool IsValid(string email)
        {
            string regex = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

            return Regex.IsMatch(email, regex, RegexOptions.IgnoreCase);
        }


        public bool checkThongTin()
        {
            if (txtCCCD.Text == "" || txtCCCD.Text.Length != 12)
            {
                MessageBox.Show("Vui lòng nhập căn cước công dân đủ 12 chữ số!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCD.Focus();
                return false;
            }
            if (txtHoten.Text == "")
            {
                MessageBox.Show("Vui lòng nhập họ tên!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtHoten.Focus();
                return false;
            }
            if (cbxGioitinh.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn giới tính!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbxGioitinh.Focus();
                return false;
            }
            if (dtpNgaysinh.Text == "")
            {
                MessageBox.Show("Vui lòng chọn ngày sinh!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                dtpNgaysinh.Focus();
                return false;
            }
            if (txtTrinhdo.Text == "")
            {
                MessageBox.Show("Vui lòng nhập trình độ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTrinhdo.Focus();
                return false;
            }
            if (txtDiachi.Text == "")
            {
                MessageBox.Show("Vui lòng nhập địa chỉ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDiachi.Focus();
                return false;
            }
            if (txtSodienthoai.Text == "")
            {
                MessageBox.Show("Vui lòng nhập số điện thoại là các số!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSodienthoai.Focus();
                return false;
            }
            if (txtEmail.Text == "" || !IsValid(txtEmail.Text))
            {
                MessageBox.Show("Vui lòng nhập email hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtEmail.Focus();
                return false;
            }
            if (cbxChucvu.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn chức vụ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbxChucvu.Focus();
                return false;
            }
            return true;

        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            if (checkThongTin())
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, maCV) values('" + txtCCCD.Text + "',N'" + txtHoten.Text + "','" + cbxGioitinh.SelectedValue.ToString() + "',CONVERT(date,'" + dtpNgaysinh.Text + "',103),'" + txtEmail.Text + "','" + txtSodienthoai.Text + "',N'" + txtDiachi.Text + "',N'" + txtTrinhdo.Text + "','" + cbxChucvu.SelectedValue.ToString() + "')";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();
                    showDanhSachThanhVien();
                    reset();
                    MessageBox.Show("Đã thêm mới thành viên thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    String str2 = "PRIMARY KEY";
                    String str = ex.ToString();

                    if (str.Contains(txtSodienthoai.Text))
                    {
                        MessageBox.Show("Số điện thoại đã tồn tại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txtSodienthoai.Focus();
                    }
                    else if (str.Contains(txtEmail.Text))
                    {
                        MessageBox.Show("Email đã tồn tại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txtSodienthoai.Focus();
                    }
                    else if (str.Contains(str2))
                    {
                        MessageBox.Show("CCCD đã tồn tại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txtCCCD.Focus();
                    }
                    else
                    {
                        MessageBox.Show("Vui lòng nhập thông tin thành viên cần thêm trước khi nhấn thêm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }

            }
        }
                
        private void dtnNguoithamgia_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtCCCD.Text != "" && txtHoten.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "update thanhVien set cccd ='" + txtCCCD.Text + "',hoTen = N'" + txtHoten.Text + "',gioiTinh = N'" + cbxGioitinh.SelectedValue.ToString() + "',ngaySinh = CONVERT(date, '" + dtpNgaysinh.Text + "', 103),email = '" + txtEmail.Text + "',soDienThoai = '" + txtSodienthoai.Text + "',diaChi = N'" + txtDiachi.Text + "',trinhDo = N'" + txtTrinhdo.Text + "',maCV = '" + cbxChucvu.SelectedValue.ToString() + "' where cccd = '" + txtCCCD.Text + "'";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();
                    showDanhSachThanhVien();
                    reset();
                    MessageBox.Show("Đã sửa thông tin thành viên thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn số CCCD hoặc Họ tên của thành viên cần chỉnh sửa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasukien.Focus();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtCCCD.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "delete from thanhVien where cccd ='" + txtCCCD.Text + "'";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();
                    showDanhSachThanhVien();
                    reset();
                    MessageBox.Show("Đã xóa thành viên thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập hoặc chọn mã thành viên cần xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCD.Focus();
            }
        }

        private void btnDon_Click(object sender, EventArgs e)
        {
            showDanhSachThanhVien();
            reset();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Form frm = new Form1();
            frm.Show();
            this.Close();
        }

        private void txtSodienthoai_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtpNgaysinh_ValueChanged(object sender, EventArgs e)
        {

        }

        private void txtTimthanhvien_TextChanged(object sender, EventArgs e)
        {

            string rowFilter = string.Format("{0} like '{1}'", "CCCD", "*" + txtTimthanhvien.Text + "*");
            (dgwDanhSachSinhVien.DataSource as DataTable).DefaultView.RowFilter = rowFilter;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
        public bool checkThongTinsk()
        {
            if (txtTensukien.Text == "")
            {
                MessageBox.Show("Vui lòng nhập tên sự kiện!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTensukien.Focus();
                return false;
            }
            if (txtDiadiem.Text == "")
            {
                MessageBox.Show("Vui lòng nhập địa điểm!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDiadiem.Focus();
                return false;
            }
            if (txtNoidungsk.Text == "")
            {
                MessageBox.Show("Vui lòng nhập nội dung sự kiện!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtNoidungsk.Focus();
                return false;
            }
            if (txtPhi.Text == "")
            {
                MessageBox.Show("Vui lòng nhập vào phí!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTrinhdo.Focus();
                return false;
            }

            return true;

        }

        private void dgvDanhSachSuKien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            if (e.RowIndex >= 0)
            {
                row = dgvDanhSachSuKien.Rows[e.RowIndex];
                txtMasukien.Text = Convert.ToString(row.Cells["maSK"].Value);
                txtTensukien.Text = Convert.ToString(row.Cells["tenSK"].Value);
                txtDiadiem.Text = Convert.ToString(row.Cells["diaDiem"].Value);
                txtNoidungsk.Text = Convert.ToString(row.Cells["noiDungSK"].Value);
                dtpTgbatdau.Text = Convert.ToString(row.Cells["thoiGianBatDau"].Value);
                dtpTgketthuc.Text = Convert.ToString(row.Cells["thoiGianKetThuc"].Value);
                txtPhi.Text = Convert.ToString(row.Cells["phi"].Value);
                showDanhSachThamGia();
            }
        }

        private void btnThemsk_Click(object sender, EventArgs e)
        {
            if (txtTensukien.Text != "")
            {
                if (checkThongTinsk())
                {
                    try
                    {
                        clsDatabase.OpenConnection();
                        string query = "INSERT INTO suKien (maSK, tenSK, noidungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) values( dbo.generateMaSK(),N'" + txtTensukien.Text + "',N'" + txtNoidungsk.Text + "',CONVERT(datetime,CONVERT(datetime,'" + dtpTgbatdau.Text + "',103),108),CONVERT(datetime,CONVERT(datetime,'" + dtpTgketthuc.Text + "',103),108),N'" + txtDiadiem.Text + "','" + txtPhi.Text + "')";
                        SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                        insertCmd.CommandType = CommandType.Text;
                        insertCmd.ExecuteNonQuery();

                        string query1 = "update taiChinh set soDu = (soDu - '" + txtPhi.Text + "')";
                        SqlCommand updateCmd = new SqlCommand(query1, clsDatabase.con);
                        updateCmd.CommandType = CommandType.Text;
                        updateCmd.ExecuteNonQuery();
                        showTaiChinh();
                        showDanhSachSuKien();
                        reset();
                        MessageBox.Show("Đã thêm mới sự kiện thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập thông tin sự kiện cần thêm trước khi nhấn thêm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTensukien.Focus();
            }
        }

        private void btnSuask_Click(object sender, EventArgs e)
        {
            if (txtMasukien.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "update suKien set tenSK = N'" + txtTensukien.Text + "',noiDungSK = N'" + txtNoidungsk.Text + "',thoiGianBatDau = CONVERT(datetime, CONVERT(datetime, '" + dtpTgbatdau.Text + "', 103), 108),thoiGianKetThuc = CONVERT(datetime,CONVERT(datetime,'" + dtpTgketthuc.Text + "',103),108), diaDiem = N'" + txtDiadiem.Text + "', phi = '" + txtPhi.Text + "' where maSK = '" + txtMasukien.Text + "'";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();
                    showDanhSachSuKien();
                    reset();
                    MessageBox.Show("Đã sửa thông tin sự kiện thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập hoặc chọn số CCCD của thành viên cần chỉnh sửa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasukien.Focus();
            }
        }

        private void btnXoask_Click(object sender, EventArgs e)
        {
            if (txtMasukien.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "delete from suKien where maSK ='" + txtMasukien.Text + "'";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();
                    showDanhSachSuKien();
                    reset();
                    MessageBox.Show("Đã xóa sự kiện thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập hoặc chọn mã sự kiện cần xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasukien.Focus();
            }
        }

        private void btnDonSK_Click(object sender, EventArgs e)
        {
            showDanhSachSuKien();
            reset();
        }

        private void btnThoatsk_Click(object sender, EventArgs e)
        {
            Form frm = new Form1();
            frm.Show();
            this.Close();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            string rowFilter = string.Format("{0} like '{1}'", "maSK", "*" + txtTimKiemSuKien.Text + "*");
            (dgvDanhSachSuKien.DataSource as DataTable).DefaultView.RowFilter = rowFilter;
        }

        private void dgvDanhSachThamGia_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnDiemDanh_Click(object sender, EventArgs e)
        {
            if (txtCCCDDiemDanh.Text != "")
            {
                if (txtMasukien.Text != "")
                {
                    try
                    {
                        clsDatabase.OpenConnection();
                        string query = "INSERT INTO danhSachThamGia (cccd, maSK) values( '" + txtCCCDDiemDanh.Text + "','" + txtMasukien.Text + "')";
                        SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                        insertCmd.CommandType = CommandType.Text;
                        insertCmd.ExecuteNonQuery();
                        showDanhSachThamGia();
                        MessageBox.Show("Đã điểm danh thành viên tham gia sự kiện thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show("Thành viên đã được điểm danh ở sự kiện này rồi !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng chọn Mã sự kiện để điểm danh !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập số CCCD của thành viên để điểm danh !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCDDiemDanh.Focus();
            }
        }

        private void btnXoaDiemDanh_Click(object sender, EventArgs e)
        {
            if (txtCCCDDiemDanh.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "DELETE FROM danhSachThamGia WHERE cccd = '" + txtCCCDDiemDanh.Text + "' AND maSK = '" + txtMasukien.Text + "' ";
                    SqlCommand deleteCmd = new SqlCommand(query, clsDatabase.con);
                    deleteCmd.CommandType = CommandType.Text;
                    int rowsAffected = deleteCmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Đã xoá thông tin điểm danh của thành viên có CCCD là " + txtCCCDDiemDanh.Text, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        showDanhSachThamGia();
                        reset();
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy thông tin điểm danh của thành viên có CCCD là " + txtCCCDDiemDanh.Text, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập số CCCD của thành viên để xoá điểm danh !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCDDiemDanh.Focus();
            }
        }

        public bool checkThongTintc()
        {
            if (txtCCCDtc.Text == "")
            {
                MessageBox.Show("Vui lòng nhập CCCD!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCDtc.Focus();
                return false;
            }
            if (txtSotien.Text == "")
            {
                MessageBox.Show("Vui lòng nhập vào số tiền!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSotien.Focus();
                return false;
            }


            return true;

        }

        private void btnThemTC_Click(object sender, EventArgs e)
        {
            if (txtCCCDtc.Text != "")
            {
                if (checkThongTintc())
                {
                    try
                    {
                        clsDatabase.OpenConnection();
                        string query = "INSERT INTO dongGop (soTien, ngayDong, cccd) values( '" + txtSotien.Text + "', CONVERT(datetime, CONVERT(datetime, '" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss") + "', 103), 108), '" + txtCCCDtc.Text + "')";
                        SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                        insertCmd.CommandType = CommandType.Text;
                        insertCmd.ExecuteNonQuery();

                        string query1 = "update taiChinh set soDu = (soDu + '" + txtSotien.Text + "')";
                        SqlCommand updateCmd = new SqlCommand(query1, clsDatabase.con);
                        updateCmd.CommandType = CommandType.Text;
                        updateCmd.ExecuteNonQuery();

                        string query2 = "update thanhVien set tongTien = (tongTien + '" + txtSotien.Text + "') where cccd = '" + txtCCCDtc.Text + "'";
                        SqlCommand updateCmd2 = new SqlCommand(query2, clsDatabase.con);
                        updateCmd2.CommandType = CommandType.Text;
                        updateCmd2.ExecuteNonQuery();

                        showTaiChinh();
                        showDanhSachDongGop();
                        showDanhSachThanhVien();
                        reset();
                        MessageBox.Show("Đã thêm thông tin đóng góp thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập thông tin đóng góp trước khi nhấn thêm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtCCCDtc.Focus();
            }

        }

        private void btnThoatTC_Click(object sender, EventArgs e)
        {
            Form frm = new Form1();
            frm.Show();
            this.Close();
        }
        static string? Temp;
        private void dgvDanhSachDongGop_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            if (e.RowIndex >= 0)
            {
                row = dgvDanhSachDongGop.Rows[e.RowIndex];
                txtCCCDtc.Text = Convert.ToString(row.Cells["cccd"].Value);
                dtpNgayDong.Text = Convert.ToString(row.Cells["ngayDong"].Value);
                txtSotien.Text = Convert.ToString(row.Cells["soTien"].Value);
                Temp = Convert.ToString(row.Cells["soTien"].Value);
            }     
        }
        private void txtCCCDtimkiemTC_TextChanged(object sender, EventArgs e)
        {
            string rowFilter = string.Format("{0} like '{1}'", "cccd", "*" + txtCCCDtimkiemTC.Text + "*");
            (dgvDanhSachDongGop.DataSource as DataTable).DefaultView.RowFilter = rowFilter;
        }

        private void btnSuaTC_Click(object sender, EventArgs e)
        {
            if (txtCCCDtc.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "update dongGop set soTien = '" + txtSotien.Text + "' where cccd = '" + txtCCCDtc.Text + "' and ngayDong = CONVERT(datetime, CONVERT(datetime, '" + dtpNgayDong.Text + "', 103), 108)";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();

                    string query1 = "update taiChinh set soDu = (soDu + '" + txtSotien.Text + "' - '" + Temp + "')";
                    SqlCommand updateCmd = new SqlCommand(query1, clsDatabase.con);
                    updateCmd.CommandType = CommandType.Text;
                    updateCmd.ExecuteNonQuery();

                    string query2 = "update thanhVien set tongTien = (tongTien + '" + txtSotien.Text + "'  - '" + Temp + "' ) where cccd = '" + txtCCCDtc.Text + "'";
                    SqlCommand updateCmd2 = new SqlCommand(query2, clsDatabase.con);
                    updateCmd2.CommandType = CommandType.Text;
                    updateCmd2.ExecuteNonQuery();

                    showTaiChinh();
                    showDanhSachDongGop();
                    showDanhSachThanhVien();
                    reset();
                    MessageBox.Show("Đã sửa thông tin đóng góp thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập hoặc chọn số CCCD của thành viên cần chỉnh sửa đóng góp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasukien.Focus();
            }
        }


        private void btnLuuTC_Click(object sender, EventArgs e)
        {
            showTaiChinh();
            showDanhSachDongGop();
            showDanhSachThanhVien();
            reset();
        }

        private void btnXoaTC_Click(object sender, EventArgs e)
        {
            if (txtCCCDtc.Text != "")
            {
                try
                {
                    clsDatabase.OpenConnection();
                    string query = "delete from dongGop where cccd ='" + txtCCCDtc.Text + "' and ngayDong = CONVERT(datetime, CONVERT(datetime, '" + dtpNgayDong.Text + "', 103), 108)";
                    SqlCommand insertCmd = new SqlCommand(query, clsDatabase.con);
                    insertCmd.CommandType = CommandType.Text;
                    insertCmd.ExecuteNonQuery();

                    string query1 = "update taiChinh set soDu = (soDu - '" + Temp + "')";
                    SqlCommand updateCmd = new SqlCommand(query1, clsDatabase.con);
                    updateCmd.CommandType = CommandType.Text;
                    updateCmd.ExecuteNonQuery();

                    string query2 = "update thanhVien set tongTien = (tongTien - '" + Temp + "' ) where cccd = '" + txtCCCDtc.Text + "'";
                    SqlCommand updateCmd2 = new SqlCommand(query2, clsDatabase.con);
                    updateCmd2.CommandType = CommandType.Text;
                    updateCmd2.ExecuteNonQuery();

                    showTaiChinh();
                    showDanhSachDongGop();
                    showDanhSachThanhVien();
                    reset();
                    MessageBox.Show("Đã xóa thông tin đóng góp thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập hoặc chọn số CCCD của thành viên cần xoá đóng góp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasukien.Focus();
            }
        }


    }
}
