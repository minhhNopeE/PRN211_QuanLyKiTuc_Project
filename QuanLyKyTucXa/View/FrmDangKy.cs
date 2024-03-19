using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKyTucXa
{
    public partial class FrmDangKy : Form
    {
        public FrmDangKy()
        {
            InitializeComponent();
        }
        DAO.DAO_SinhVien DAO = new DAO.DAO_SinhVien();
        DAO.DAO_SvDangKy DAO_SvDangKy = new DAO.DAO_SvDangKy();

        private void DangKyO__Load(object sender, EventArgs e)
        {
            cbMaphong.DataSource = DAO.SelectMaPhong();
            cbMaphong.DisplayMember = "Chọn";
            cbMaphong.ValueMember = "maphong";
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnDangky_Click(object sender, EventArgs e)
        {
            if (txtMasv.Text.Trim() == "")
            {
                MessageBox.Show("Vui lòng nhập mã sinh viên!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtTensv.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập tên sinh viên!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (cbGioitinh.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn giới tính!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtQuequan.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập quê quán!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (cbKhoa.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn khóa!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtLop.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập lớp!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (cbMaphong.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn mã phòng!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (cbLoaiuutien.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn loại ưu tiên!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DAO_SvDangKy.InsertSinhVienDangKy(txtMasv.Text, txtTensv.Text, cbGioitinh.Text, dtpNgaysinh.Value, txtQuequan.Text, cbKhoa.Text, txtLop.Text, cbMaphong.Text, cbLoaiuutien.Text);
            this.Close();
        }
    }
}
