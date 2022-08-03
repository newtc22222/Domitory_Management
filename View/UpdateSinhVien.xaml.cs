using System.Collections.Generic;
using System.Data;
using System.Windows;
using System.Windows.Input;
using QuanLySinhVien.Connection;
using QuanLySinhVien.Models;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for UpdateSinhVien.xaml
    /// </summary>
    public partial class UpdateSinhVien : Window
    {
        List<string> lstPhongTrong;
        DataTable dtPhongTrong;
        DataTable dtPhongConChoTrong;

        View.AdminWindow.CapNhatSinhVien capNhatSinhVien;
        public UpdateSinhVien(SinhVien sv, View.AdminWindow.CapNhatSinhVien sender)
        {
            InitializeComponent();
            dtPhongTrong = Funcions.Instance().DanhSachPhongTrong();
            dtPhongConChoTrong = Funcions.Instance().DanhSachPhongConChoTrong();
            lstPhongTrong = new List<string>();

            foreach (DataRow x in dtPhongConChoTrong.Rows)
            {
                lstPhongTrong.Add(x[0].ToString());
            }
            foreach (DataRow x in dtPhongTrong.Rows)
            {
                lstPhongTrong.Add(x[0].ToString());
            }
            foreach (string x in lstPhongTrong)
            {
                cbbPhongTrong.Items.Add(x);
            }

            txtMaNhanVien.Text = sv.MaSV+ "";
            txtHoTen.Text = sv.HoTen;
            txtCMND.Text = sv.Cmnd;
            txtTonGiao.Text = sv.TonGiao;
            txtSDT.Text = sv.SoDT;
            txtGioiTinh.Text = sv.GioiTinh;
            cbbPhongTrong.Text = sv.SoPhong+ "";
            txtQuocTich.Text = sv.QuocTich;
            txtNamHoc.Text = sv.NamHoc+ "";
            this.capNhatSinhVien = sender;
        }

        private void btnLuu_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                capNhatSinhVien(int.Parse(txtMaNhanVien.Text),
                txtHoTen.Text,
                txtSDT.Text,
                txtGioiTinh.Text,
                txtTonGiao.Text,
                txtQuocTich.Text,
                txtCMND.Text,
                int.Parse(cbbPhongTrong.Text),
                int.Parse(txtNamHoc.Text));
            }
            catch
            {
                MessageBox.Show("Sinh viên đã tồn tại hoặc nhập sai ràng buộc dữ liệu" +
                    "\nVui lòng nhập lại!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
        }

        private void btnHuy_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if(Mouse.RightButton == MouseButtonState.Pressed)
            {
                return;
            }
            DragMove();
        }
    }
}
