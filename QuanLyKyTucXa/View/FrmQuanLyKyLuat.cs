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
    public partial class FrmQuanLyKyLuat : Form
    {
        public FrmQuanLyKyLuat()
        {
            InitializeComponent();
        }
        DAO.DAO_KyLuat DAO = new DAO.DAO_KyLuat();
        DAO.DAO_SinhVien DAOSv = new DAO.DAO_SinhVien();
        private void QuanLyKyLuat_Load(object sender, EventArgs e)
        {
        
            dgvKyluat.DataSource = DAO.SelectKyLuat();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                int soluong = int.Parse(txtTienphat.Text);
                if (soluong < 0) throw new FormatException();
            }
            catch (FormatException)
            {
                MessageBox.Show("Tiền phạt phải là số lớn hơn 0", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (txtMasv.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập mã sinh viên!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (txtKyluat.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập nội dung kỷ luật!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            DAO.InsertKyLuat(txtMasv.Text, txtKyluat.Text, dtpNgaykyluat.Value, float.Parse(txtTienphat.Text));
            btnCapnhat_Click(sender, e);
        }

        private void dgvKyluat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int vitri = e.RowIndex;
            if (vitri >= 0)
            {
                txtId.Text = dgvKyluat.Rows[vitri].Cells[0].Value.ToString();
                txtMasv.Text = dgvKyluat.Rows[vitri].Cells[1].Value.ToString();
                txtKyluat.Text = dgvKyluat.Rows[vitri].Cells[2].Value.ToString();
                dtpNgaykyluat.Text = dgvKyluat.Rows[vitri].Cells[3].Value.ToString();
                txtTienphat.Text = dgvKyluat.Rows[vitri].Cells[4].Value.ToString();
            }
        }

        private void ClearBox()
        {
            txtId.Clear();
            txtMasv.Text = "";
            txtKyluat.Clear();
            dtpNgaykyluat.Value = DateTime.Now;
            txtTienphat.Clear();
            rbMasv.Checked = false;
            rbKyluat.Checked = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                int soluong = int.Parse(txtTienphat.Text);
                if (soluong < 0) throw new FormatException();
            }
            catch (FormatException)
            {
                MessageBox.Show("Tiền phạt phải là số lớn hơn 0", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (txtId.Text == "")
            {
                MessageBox.Show("Vui lòng chọn 1 dòng để sửa",
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtMasv.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập mã sinh viên!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtKyluat.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập nội dung kỷ luật!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            DAO.UpdateKyLuat(txtId.Text, txtMasv.Text, txtKyluat.Text, dtpNgaykyluat.Value, float.Parse(txtTienphat.Text));
            btnCapnhat_Click(sender, e);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                MessageBox.Show("Vui lòng chọn 1 dòng để xóa",
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            DialogResult dlr = MessageBox.Show("Bạn có chắc chắn xóa", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.Yes)
            {
                DAO.DeleteKyLuat(txtId.Text);
                btnCapnhat_Click(sender, e);
            }
            else if (dlr == DialogResult.No)
                return;
        }

        private void btnCapnhat_Click(object sender, EventArgs e)
        {
            QuanLyKyLuat_Load(sender, e);
            ClearBox();
            txtMasv.Enabled = true;
            txtKyluat.Enabled = true;
            dtpNgaykyluat.Enabled = true;
            txtTienphat.Enabled = true;
        }

        private void btnTimkiem_Click(object sender, EventArgs e)
        {
            if (rbMasv.Checked)
            {
                if (txtMasv.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập mã sinh viên", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                dgvKyluat.DataSource = DAO.SearchKyLuat(txtMasv.Text, "masv");
            }
            else if (rbKyluat.Checked)
            {
                if (txtKyluat.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập nội dung kỷ luật", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                dgvKyluat.DataSource = DAO.SearchKyLuat(txtKyluat.Text, "kyluat");
            }
            else
            {
                MessageBox.Show("Vui lòng chọn 1 trường để tìm kiếm", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void rbMasv_CheckedChanged(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            txtMasv.Enabled = true;
            txtKyluat.Enabled = false;
            dtpNgaykyluat.Enabled = false;
            txtTienphat.Enabled = false;
        }

        private void rbKyluat_CheckedChanged(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            txtMasv.Enabled = false;
            txtKyluat.Enabled = true;
            dtpNgaykyluat.Enabled = false;
            txtTienphat.Enabled = false;
        }
    }
}
