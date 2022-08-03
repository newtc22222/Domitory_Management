using System.Windows;
using System.Windows.Input;
using QuanLySinhVien.Models;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for UpdateStaffWindow.xaml
    /// </summary>
    public partial class UpdateStaffWindow : Window
    {
        private View.AdminWindow.CapNhatNhanVien capNhatNhanVien;
        NhanVien nv;
        public UpdateStaffWindow(NhanVien nv, 
            View.AdminWindow.CapNhatNhanVien sender)
        {
            InitializeComponent();
            this.nv = nv;
            capNhatNhanVien = sender;
            Load();
        }
        private void Load()
        {
            txtMaNhanVien.Text = nv.MaNV + "";
            txtHoTen.Text = nv.HoTen;
            txtCMND.Text = nv.Cmnd;
            txtTonGiao.Text = nv.TonGiao;
            txtSDT.Text = nv.SoDT;
            txtGioiTinh.Text = nv.GioiTinh;
            txtChucVu.Text = nv.ChucVu;
            txtQuocTich.Text = nv.QuocTich;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int maNhanVien = int.Parse(txtMaNhanVien.Text.Trim());
            string hoTen = txtHoTen.Text.Trim();
            string soDienThoai = txtSDT.Text.Trim();
            string gioiTinh = txtGioiTinh.Text.Trim();
            string tonGiao = txtTonGiao.Text.Trim();
            string quocTich = txtQuocTich.Text.Trim();
            string cmnd = txtCMND.Text.Trim();
            string chucVu = txtChucVu.Text.Trim();
            //CapNhatNhanVien(int maNhanVien, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu);
            this.capNhatNhanVien(maNhanVien, hoTen, soDienThoai, gioiTinh, tonGiao, quocTich, cmnd, chucVu);
            this.Close();
        }

        private void btnHuy_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (Mouse.RightButton == MouseButtonState.Pressed)
            {
                return;
            }
            DragMove();
        }
    }
}
