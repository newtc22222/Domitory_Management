using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using QuanLySinhVien.Connection;
namespace QuanLySinhVien
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string vaiTro;
        public static string dataSource;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void TextBox_DragEnter(object sender, DragEventArgs e)
        {
            if (txtUsername.Text == "Tên đăng nhập")
            {
                txtUsername.Text = "";
                txtUsername.Foreground = Brushes.White;
            }
        }

        private void txtUsername_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (txtUsername.Text == "Tên đăng nhập")
            {
                txtUsername.Text = "";
                txtUsername.Foreground = Brushes.White;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            // Lấy thông tin và kiểm tra
            dataSource = txtDataSource.Text.Trim();
            if (rdbQuanTriVien.IsChecked == false && rdbQuanLy.IsChecked == false)
            {
                MessageBox.Show("Vui lòng chọn quyền đăng nhập", "Lỗi");
                return;
            }
            if (rdbQuanTriVien.IsChecked == true)
            {
                vaiTro = "QuanTriVien";
            }
            if (rdbQuanLy.IsChecked == true)
            {
                vaiTro = "NhanVien";
            }
            if (txtPassword.Password.Trim() == "" || txtUsername.Text.Trim() == "")
            {
                MessageBox.Show("Vui lòng nhập thông tin đăng nhập", "Lỗi");
                return;
            }

            bool checkDangNhap = false;
            try
            {
                checkDangNhap = Funcions.Instance().KiemTraThongTinDangNhap(int.Parse(txtUsername.Text.Trim()), txtPassword.Password.Trim(), vaiTro);
            }
            catch
            {
                MessageBox.Show("Không tìm thấy Server!\nHãy nhập lại Data source");
                return;
            }
            if (checkDangNhap)
            {
                if (vaiTro == "QuanTriVien")
                {
                    View.AdminWindow a = new View.AdminWindow(int.Parse(txtUsername.Text.Trim()), txtPassword.Password.Trim());
                    this.Hide();
                    a.ShowDialog();
                    this.Show();
                }
                if (vaiTro == "NhanVien")
                {
                    View.AdminWindow a = new View.AdminWindow(int.Parse(txtUsername.Text.Trim()), txtPassword.Password.Trim());
                    this.Hide();
                    a.btnNhanVien.IsEnabled = false;
                    a.btnDanhSachDangNhap.IsEnabled = false;
                    a.ShowDialog();
                    this.Show();
                }
            }
            else
            {
                MessageBox.Show("Sai thông tin hoặc vai trò!\nVui lòng kiểm tra lại!", "Thông báo");
                return;
            }
        }

        private void btnThoat_Click(object sender, RoutedEventArgs e)
        {
            if(MessageBox.Show("Bạn có muốn thóat", "Thoát", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                System.Windows.Application.Current.Shutdown();
            }
        }
    }
}
