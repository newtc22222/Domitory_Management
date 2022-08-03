using System.Collections.Generic;
using System.Data;
using System.Windows;
using System.Windows.Input;
using QuanLySinhVien.Connection;

namespace QuanLySinhVien.View
{
    /// <summary>
    /// Interaction logic for AddStudentWindow.xaml
    /// </summary>
    public partial class AddStudentWindow : Window
    {
        List<string> lstPhongTrong;
        DataTable dtPhongTrong;
        DataTable dtPhongConChoTrong;

        View.AdminWindow.ThemSinhVien themSV;

        public AddStudentWindow(View.AdminWindow.ThemSinhVien sender)
        {
            InitializeComponent();
            this.themSV = sender;
            dtPhongTrong = Funcions.Instance().DanhSachPhongTrong();
            dtPhongConChoTrong = Funcions.Instance().DanhSachPhongConChoTrong();
            lstPhongTrong = new List<string>();

            foreach(DataRow x in dtPhongConChoTrong.Rows)
            {
                lstPhongTrong.Add(x[0].ToString());
            }
            foreach(DataRow x in dtPhongTrong.Rows)
            {
                lstPhongTrong.Add(x[0].ToString());
            }
            foreach(string x in lstPhongTrong)
            {
                cbbPhongTrong.Items.Add(x);
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                themSV(int.Parse(txtMaNhanVien.Text), txtHoTen.Text, txtSDT.Text, txtGioiTinh.Text
                    , txtTonGiao.Text, txtQuocTich.Text, txtCMND.Text, int.Parse(cbbPhongTrong.Text), int.Parse(txtNamHoc.Text));
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
    }
}
