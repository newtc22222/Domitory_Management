using System.Windows;
using System.Windows.Input;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for AddStaffWindow.xaml
    /// </summary>
    public partial class AddStaffWindow : Window
    {
        public AdminWindow.ThemNhanVien themNV;
        
        public AddStaffWindow(AdminWindow.ThemNhanVien sender)
        {
            InitializeComponent();
            this.themNV = sender;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int maNhanVien = int.Parse(txtMaNhanVien.Text.Trim());
                string hoTen = txtHoTen.Text.Trim();
                string soDienThoai = txtSDT.Text.Trim();
                string gioiTinh = txtGioiTinh.Text.Trim();
                string tonGiao = txtTonGiao.Text.Trim();
                string quocTich = txtQuocTich.Text.Trim();
                string cmnd = txtCMND.Text.Trim();
                string chucVu = txtChucVu.Text.Trim();

                this.themNV(maNhanVien, hoTen, soDienThoai, gioiTinh, tonGiao, quocTich, cmnd, chucVu);
                this.Close();
            }
            catch
            {
                MessageBox.Show("Sai ràng buộc dữ liệu", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }            

        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (Mouse.RightButton == MouseButtonState.Pressed)
            {
                return;
            }
            DragMove();
        }

        private void btnHuy_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
