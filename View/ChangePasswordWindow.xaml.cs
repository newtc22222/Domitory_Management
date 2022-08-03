using System.Windows;
using System.Windows.Input;
using QuanLySinhVien.Connection;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for ChangePasswordWindow.xaml
    /// </summary>
    public partial class ChangePasswordWindow : Window
    {
        private int tenTaiKhoan;
        private string matKhau;

        public ChangePasswordWindow(int tenTaiKhoan, string matKhau)
        {
            InitializeComponent();
            this.tenTaiKhoan = tenTaiKhoan;
            this.matKhau = matKhau;
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void btnXacNhan_Click(object sender, RoutedEventArgs e)
        {
            if (KiemTra())
            {
                Funcions.Instance().DoiMatKhau(tenTaiKhoan, txtMatKhauMoiXacNhan.Password);
                MessageBox.Show("Đổi mật khẩu thành công!", "Đổi mật khẩu");
                this.Hide();
            }
            else
            {
                if (txtMatKhauCu.Password.Trim() == "")
                {
                    MessageBox.Show("Vui lòng nhập mật khẩu cũ", "Lỗi");
                    txtMatKhauCu.Focus();
                    return;
                }
                if (txtNhapMatKhauMoi.Password.Trim() == "")
                {
                    MessageBox.Show("Vui lòng nhập mật khẩu mới", "Lỗi");
                    txtNhapMatKhauMoi.Focus();
                    return;
                }
                if(txtMatKhauMoiXacNhan.Password.Trim() == "")
                {
                    MessageBox.Show("Vui lòng nhập mật khẩu xác nhận", "Lỗi");
                    txtMatKhauMoiXacNhan.Focus();
                    return;
                }
                if(txtMatKhauCu.Password != matKhau)
                {
                    MessageBox.Show("Mật khẩu cũ không đúng", "Lỗi");
                    txtMatKhauCu.Focus();
                    return;
                }
                if(txtMatKhauCu.Password.Trim() == txtNhapMatKhauMoi.Password.Trim())
                {
                    MessageBox.Show("Mật khẩu mới không được giống mật khẩu cũ", "Lỗi");
                    txtNhapMatKhauMoi.Focus();
                    return;
                }
                if(txtNhapMatKhauMoi.Password.Trim() != txtMatKhauMoiXacNhan.Password.Trim())
                {
                    MessageBox.Show("Mật khẩu xác nhận không đúng", "Lỗi");
                    txtMatKhauMoiXacNhan.Focus();
                    return;
                }
            }
        }
        private bool KiemTra()
        {
            if (txtMatKhauCu.Password != matKhau)
            {
                return false;
            }
            if (txtMatKhauCu.Password.Trim() == "" || 
                txtNhapMatKhauMoi.Password.Trim() == ""|| 
                txtMatKhauMoiXacNhan.Password.Trim() == "")
            {
                return false;
            }
            if (txtMatKhauCu.Password.Trim() == txtNhapMatKhauMoi.Password.Trim())
            {
                return false;
            }
            if (txtNhapMatKhauMoi.Password.Trim() != txtMatKhauMoiXacNhan.Password.Trim())
            {
                return false;
            }
            return true;
        }

        private void btnDong_Click(object sender, RoutedEventArgs e)
        {
            Hide();
        }
    }
}
