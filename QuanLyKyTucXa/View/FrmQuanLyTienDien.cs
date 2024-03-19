using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKyTucXa
{
    public partial class FrmQuanLyTienDien : Form
    {
        public FrmQuanLyTienDien()
        {
            InitializeComponent();
        }
        //Methods
        private float tinhTienDien(int sodien)
        {
            float tongTien = 0;
            float chiSo = 3000;

            tongTien += chiSo * sodien;

            return tongTien;
        }

        DAO.DAO_TienDien DAO = new DAO.DAO_TienDien();
        DAO.DAO_Phong DAOPhong = new DAO.DAO_Phong();

        private void FrmQuanLyTienDien_Load(object sender, EventArgs e)
        {
            cbMaphong.DataSource = DAOPhong.SelectMaPhong();
            cbMaphong.DisplayMember = "Chọn";
            cbMaphong.ValueMember = "maphong";
            dgvTiendien.DataSource = DAO.SelectTienDien();
        }

        private void btnCapnhat_Click(object sender, EventArgs e)
        {
            FrmQuanLyTienDien_Load(sender, e);
            ClearBox();
            cbMaphong.Enabled = true;
            dtpNgaylap.Enabled = true;
            txtChisomoi.Enabled = true;
            cbTrangthai.Enabled = true;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                int soluong = int.Parse(txtChisomoi.Text);
                if (soluong < 0) throw new FormatException();
            }
            catch (FormatException)
            {
                MessageBox.Show("Chỉ số điện phải là số lớn hơn 0", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (cbMaphong.Text == "")
            {
                MessageBox.Show("Vui lòng chọn mã phòng!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (cbTrangthai.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn trạng thái!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int chiSoCu = int.Parse(DAO.SelectChiSoCu(cbMaphong.Text).Rows[0][0].ToString());
            if (int.Parse(txtChisomoi.Text) < chiSoCu)
            {
                MessageBox.Show("Chỉ số mới phải lớn hơn chỉ số cũ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int sodien = int.Parse(txtChisomoi.Text) - chiSoCu;
            DAO.UpdateChiSoCuTang(cbMaphong.Text, int.Parse(txtChisomoi.Text));
            DAO.InsertTienDien(cbMaphong.Text, dtpNgaylap.Value, sodien, tinhTienDien(sodien), cbTrangthai.Text);
            btnCapnhat_Click(sender, e); ;
        }

        private void dgvTiendien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int vitri = e.RowIndex;
            if (vitri >= 0)
            {
                txtMahoadon.Text = dgvTiendien.Rows[vitri].Cells[0].Value.ToString();
                cbMaphong.Text = dgvTiendien.Rows[vitri].Cells[1].Value.ToString();
                dtpNgaylap.Text = dgvTiendien.Rows[vitri].Cells[2].Value.ToString();
                cbTrangthai.Text = dgvTiendien.Rows[vitri].Cells[5].Value.ToString();
               
            }
        }

        private void ClearBox()
        {
            txtMahoadon.Clear();
            cbMaphong.Text = "";
            dtpNgaylap.Value = DateTime.Now;
            txtChisomoi.Clear();
            cbTrangthai.Text = "";
            rbTktheoma.Checked = false;
            rbTktheott.Checked = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMahoadon.Text == "")
            {
                MessageBox.Show("Vui lòng chọn 1 dòng để sửa",
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (cbMaphong.Text == "")
            {
                MessageBox.Show("Vui lòng chọn mã phòng!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (cbTrangthai.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn trạng thái!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            int sodien = int.Parse(DAO.SelectSoDien(txtMahoadon.Text).Rows[0][0].ToString());
            if (txtChisomoi.Text.Trim() != "")
            {
                DAO.UpdateChiSoCuGiam(cbMaphong.Text, sodien);
                int chiSoCu = int.Parse(DAO.SelectChiSoCu(cbMaphong.Text).Rows[0][0].ToString());
                if (int.Parse(txtChisomoi.Text) < chiSoCu)
                {
                    MessageBox.Show("Chỉ số mới phải lớn hơn chỉ số cũ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                int sodientieuthu = int.Parse(txtChisomoi.Text) - chiSoCu;
                DAO.UpdateChiSoCuTang(cbMaphong.Text, sodientieuthu);
                //int sodiencu = int.Parse(DAO.SelectChiSoCu(cbMaphong.Text).ToString());
                //if(sodien > sodiencu)
                //{
                //DAO.UpdateChiSoCuTang(cbMaphong.Text,)
                //}
                DAO.UpdateTienDien(txtMahoadon.Text, cbMaphong.Text, dtpNgaylap.Value, sodientieuthu, tinhTienDien(sodientieuthu), cbTrangthai.Text);
            }
            else
            {
                DAO.UpdateTienDien(txtMahoadon.Text, cbMaphong.Text, dtpNgaylap.Value, sodien, tinhTienDien(sodien), cbTrangthai.Text);
            }

            btnCapnhat_Click(sender, e);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtMahoadon.Text == "")
            {
                MessageBox.Show("Vui lòng chọn 1 dòng để xóa",
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DialogResult dlr = MessageBox.Show("Bạn có chắc chắn xóa", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.Yes)
            {
                int sodien = int.Parse(DAO.SelectSoDien(txtMahoadon.Text).Rows[0][0].ToString());
                DAO.UpdateChiSoCuGiam(cbMaphong.Text, sodien);
                DAO.DeleteTienDien(txtMahoadon.Text);
                btnCapnhat_Click(sender, e);
            }
            else if (dlr == DialogResult.No)
                return;
        }

        private void rbTktheoma_CheckedChanged(object sender, EventArgs e)
        {
            cbMaphong.Enabled = true;
            dtpNgaylap.Enabled = false;
            txtChisomoi.Enabled = false;
            cbTrangthai.Enabled = false;
        }

        private void rbTktheott_CheckedChanged(object sender, EventArgs e)
        {
            cbMaphong.Enabled = false;
            dtpNgaylap.Enabled = false;
            txtChisomoi.Enabled = false;
            cbTrangthai.Enabled = true;
        }

        private void btnInhoadon_Click(object sender, EventArgs e)
        {
            DAO.UpdateTrangThai(txtMahoadon.Text, "Hoàn thành");
        }

        private void btnTimkiem_Click(object sender, EventArgs e)
        {
            if (rbTktheoma.Checked)
            {
                if (cbMaphong.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập mã phòng", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                dgvTiendien.DataSource = DAO.SearchTienDien(cbMaphong.Text, "maphong");
            }
            else if (rbTktheott.Checked)
            {
                if (cbTrangthai.Text == "")
                {
                    MessageBox.Show("Bạn chưa chọn trạng thái tìm kiếm", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                dgvTiendien.DataSource = DAO.SearchTienDien(cbTrangthai.Text, "trangthai");
            }
            else
            {
                MessageBox.Show("Vui lòng chọn 1 trường để tìm kiếm", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        private void btnThanhtoan_Click(object sender, EventArgs e)
        {
            DAO.UpdateTrangThai(txtMahoadon.Text, "Đã thanh toán");
            FrmQuanLyTienDien_Load(sender, e);
        }
    }
}
