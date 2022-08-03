using System.Windows;
using System.Windows.Input;
using QuanLySinhVien.Connection;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for DanhSachTaiKhoan.xaml
    /// </summary>
    public partial class DanhSachTaiKhoan : Window
    {
        public DanhSachTaiKhoan()
        {
            InitializeComponent();
            dgvDanhSachTaiKhoan.ItemsSource = Funcions.Instance().ThongTinDangNhap().DefaultView;
        }

        private void btnThoat_Click(object sender, RoutedEventArgs e)
        {
            Hide();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                DragMove();
            }
            catch
            {
                return;
            }
        }
    }
}
