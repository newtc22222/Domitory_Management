using System;
using System.Collections.Generic;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using QuanLySinhVien.Models;
using QuanLySinhVien.Connection;

namespace QuanLySinhVien.View
{
    public partial class AdminWindow : Window
    {
        #region Data_Object_Delegate
        //Các bảng dữ liệu
        private DataTable tbSinhVien;
        private DataTable tbNhanVien;
        private DataTable tbHoaDonLePhi;
        private DataTable tbHoaDonDienNuoc;
        private DataTable tbPhong;

        //Khai báo các đối tượng
        private SinhVien sinhVien = new SinhVien();
        private Phong phong = new Phong();
        private NhanVien nhanVien = new NhanVien();
        private HoaDonLePhi hoaDonLePhi = new HoaDonLePhi();
        private HoaDonDienNuoc hoaDonDienNuoc = new HoaDonDienNuoc();

        //Khai báo thông tin đăng nhập
        private int tenTaiKhoan = 123456;
        private string matKhau = "123456";

        //Khai báo các ủy thác để tái sử dụng các hàm thêm, sửa nhân viên và sinh viên
        public delegate void ThemNhanVien(int maNhanVien, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu);
        public delegate void CapNhatNhanVien(int maNhanVien, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu);
        public delegate void ThemSinhVien(int maSV, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, int soPhong, int namHoc);
        public delegate void CapNhatSinhVien(int maSV, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, int soPhong, int namHoc);
        #endregion

        public AdminWindow(int tenTaiKhoan, string matKhau)
        {
            InitializeComponent();

            // Khởi tạo các tab
            LoadTabHoaDonDienNuoc();
            LoadTabHoaDonLePhi();
            LoadTabPhong();
            LoadTabSinhVien();
            LoadTabNhanVien();
            LoadTabThongTin();

            HideAllTab();
            tabIntro.Visibility = Visibility.Visible;

            // Tắt chức năng button
            btnLuuHoaDon.IsEnabled = false;
            btnXoaHoaDon.IsEnabled = false;
            btnHuyHoaDon.IsEnabled = false;

            btnSuaHoaDonLePhi.IsEnabled = false;
            btnXoaHoaDonLePhi_copy.IsEnabled = false;
            btnXoaHoaDonLePhi.IsEnabled = false;

            btnLuuPhong.IsEnabled = false;
            btnXoaPhong.IsEnabled = false;

            btnSuaSV.IsEnabled = false;
            btnXoaSV.IsEnabled = false;

            btnSuaNV.IsEnabled = false;
            btnXoaNV.IsEnabled = false;

            this.tenTaiKhoan = tenTaiKhoan;
            this.matKhau = matKhau;
        }

        #region ThietLapGiaoDien_va_LayThongTinDong
        private void HideAllTab()
        {
            tabHoaDonDienNuoc.Visibility = Visibility.Hidden;
            tabHoaDonLePhi.Visibility = Visibility.Hidden;
            tabIntro.Visibility = Visibility.Hidden; ;
            tabPhong.Visibility = Visibility.Hidden;
            tabSinhVien.Visibility = Visibility.Hidden;
            tabThongTin.Visibility = Visibility.Hidden;
            tabNhanVien.Visibility = Visibility.Hidden;
        }
        private void SetBackgroundButton()
        {
            Color color = Color.FromRgb(30, 61, 89);
            btnThongTin.Background = new SolidColorBrush(color);
            btnHoaDonLePhi.Background = new SolidColorBrush(color);
            btnSaoKe.Background = new SolidColorBrush(color);
            btnPhong.Background = new SolidColorBrush(color);
            btnSinhVien.Background = new SolidColorBrush(color);
            btnThoat.Background = new SolidColorBrush(color);
            btnNhanVien.Background = new SolidColorBrush(color);
        }
        private string GetCellContent(DataGrid dgv, int index)
        {
            var cellInfos = dgv.SelectedCells;
            var listUse = new List<string>();
            foreach (DataGridCellInfo cellInfo in cellInfos)
            {
                if (cellInfo.IsValid)
                {
                    try
                    {
                        if (cellInfo.Equals(null))
                        {
                            return null;
                        }
                        //Lấy giá trị của ô dữ liệu trả về giá trị loại FrameworkElement
                        var content = cellInfo.Column.GetCellContent(cellInfo.Item);
                        if (content==null)
                        {
                            return null;
                        }
                        //Lấy dữ liệu datacontext từ FrameworkElement và ép kiểu về DataRowView
                        var row = (DataRowView)content.DataContext;

                        //ItemArray trả về một đối tượng mảng đơn giá trị
                        object[] obj = row.Row.ItemArray;

                        //Lưu trữ giá trị vào một mảng để tiến hành sử dụng
                        listUse.Add(obj[index].ToString());
                    }
                    catch
                    {
                        return null;
                    }
                }
            }
            return listUse[0].ToString();
        }
        #endregion

        #region DiChuyenCuaSo
        private void StackPanel_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (Mouse.RightButton == MouseButtonState.Pressed)
            {
                return;
            }
            DragMove();
        }
        private void movePanel_MouseDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }
        #endregion

        #region Button_Tab
        private void btnThongTin_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabThongTin.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnThongTin.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));
            SettingTabThongTin();
        }
        private void btnSaoKe_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabHoaDonDienNuoc.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnSaoKe.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));

        }
        private void btnHoaDonLePhi_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabHoaDonLePhi.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnHoaDonLePhi.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));
        }
        private void btnPhong_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabPhong.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnPhong.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));
        }
        private void btnSinhVien_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabSinhVien.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnSinhVien.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));
        }
        private void btnThoat_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn đăng xuất?", "Đăng xuất", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Close();
            }
        }
        #endregion

        #region TrangChu
        private void LoadTabThongTin()
        {
            lblSoLuongSinhVien.Content = tbSinhVien.Rows.Count;
            lblSoLuongPhong.Content = tbPhong.Rows.Count;
            lblSoLuongNhanVien.Content = tbNhanVien.Rows.Count;
            lblSoLuongSinhVienNam.Content = Funcions.Instance().SoLuongSinhVienTheoGioiTinh("nam");
            lblSoLuongSinhVienNu.Content = Funcions.Instance().SoLuongSinhVienTheoGioiTinh("nữ");

            dgvDanhSachHoaDonDienNuocChuaThanhToan.ItemsSource = Funcions.Instance().DanhSachHoaDonDienNuocChuaThanhToan().DefaultView;
            dgvDanhSachPhongTrong.ItemsSource = Funcions.Instance().DanhSachPhongTrong().DefaultView;
            dgvDanhSachPhongThieuSinhVien.ItemsSource = Funcions.Instance().DanhSachPhongConChoTrong().DefaultView;
            dgvDanhSachHoaDonLePhiChuaThanhToan.ItemsSource = Funcions.Instance().DanhSachHoaDonLePhiChuaThanhToan().DefaultView;
        }

        private void SettingTabThongTin()
        {
            //Setting dgvDanhSachHoaDonDienNuocChuaThanhToan
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[0].Header = "Mã biên lai";
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[1].Header = "Tiền điện (VNĐ)";
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[2].Header = "Tiền nước (VNĐ)";
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[3].Header = "Ngày tạo hóa đơn";
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[4].Header = "Tình trạng thanh toán";
            //dgvDanhSachHoaDonDienNuocChuaThanhToan.Columns[5].Header = "Số phòng";
            dgvDanhSachHoaDonDienNuocChuaThanhToan.IsReadOnly = true;

            //Setting dgvDanhSahcHoaDonLePhiChuaThanhToan
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[0].Header = "Mã biên lai";
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[1].Header = "Tổng tiền (VNĐ)";
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[2].Header = "Ngày ở";
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[3].Header = "Ngày tạo";
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[4].Header = "Thanh Toán";
            //dgvDanhSachHoaDonLePhiChuaThanhToan.Columns[5].Header = "Mã SV";

            //Setting dgvDanhSachPhongTrong
            dgvDanhSachPhongTrong.IsReadOnly = true;
            //dgvDanhSachPhongTrong.Columns[0].Header = "Số phòng";
            //dgvDanhSachPhongTrong.Columns[1].Header = "Tầng";
            //dgvDanhSachPhongTrong.Columns[2].Header = "Số lượng sinh viên hiện tại";
            //dgvDanhSachPhongTrong.Columns[3].Header = "Số lượng sinh viên tối đa";
            //dgvDanhSachPhongTrong.Columns[4].Header = "Mã người quản lý";

            //Setting dgvDanhSachPhongConThieuSinhVien
            dgvDanhSachPhongThieuSinhVien.IsReadOnly = true;
            //dgvDanhSachPhongThieuSinhVien.Columns[0].Header = "Số phòng";
            //dgvDanhSachPhongThieuSinhVien.Columns[1].Header = "Tầng";
            //dgvDanhSachPhongThieuSinhVien.Columns[2].Header = "Số lượng sinh viên hiện tại";
            //dgvDanhSachPhongThieuSinhVien.Columns[3].Header = "Số lượng sinh viên tối đa";
            //dgvDanhSachPhongThieuSinhVien.Columns[4].Header = "Mã người quản lý";
        }
        private void txtDanhSachSinhVienTheoNam_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                int namHoc = int.Parse(txtDanhSachSinhVienTheoNam.Text.Trim());
                dgvDanhSachSinhVienTheoNam.ItemsSource = Funcions.Instance().DanhSachSinhVienTheoNamHoc(namHoc).DefaultView;
            }
            catch
            {
                return;
            }
        }
        private void txtDanhSachHoaDonTheoTang_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                int tang = int.Parse(txtDanhSachHoaDonTheoTang.Text.Trim());
                dgvDanhSachHoaDonTheoTang.ItemsSource = Funcions.Instance().DanhSachHoaDonDienNuocTheoTang(tang).DefaultView;
            }
            catch
            {
                return;
            }

        }
        private void dtpDanhSachHoaDonDienNuocTheoThang_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                DateTime now = dtpDanhSachHoaDonDienNuocTheoThang.SelectedDate.Value;
                dgvDanhSachHoaDonDienNuocTheoThang.ItemsSource = Funcions.Instance().DanhSachHoaDonDienNuocTheoThang(now).DefaultView;
            }
            catch
            {
                return;
            }
        }
        private void btnDoiMatKhau_Click(object sender, RoutedEventArgs e)
        {
            ChangePasswordWindow form = new ChangePasswordWindow(tenTaiKhoan, matKhau);
            form.ShowDialog();
        }
        private void btnDanhSachDangNhap_Click(object sender, RoutedEventArgs e)
        {
            DanhSachTaiKhoan form = new DanhSachTaiKhoan();
            form.ShowDialog();
        }
        #endregion

        #region NhanVien

        private void btnNhanVien_Click(object sender, RoutedEventArgs e)
        {
            HideAllTab();
            tabNhanVien.Visibility = Visibility.Visible;
            SetBackgroundButton();
            btnNhanVien.Background = new SolidColorBrush(Color.FromRgb(101, 101, 101));
        }
        private void btnThemNV_Click(object sender, RoutedEventArgs e)
        {
            View.AddStaffWindow a = new AddStaffWindow(themNhanVien);
            a.ShowDialog();
        }
        private void btnSuaNV_Click(object sender, RoutedEventArgs e)
        {
            View.UpdateStaffWindow update = new View.UpdateStaffWindow(nhanVien, capNhatNhanVien);
            update.ShowDialog();
            dgvNhanVien.UnselectAllCells();
            btnSuaNV.IsEnabled = false;
            btnXoaNV.IsEnabled = false;
        }
        private void btnXoaNV_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa nhân viên\n" + nhanVien.HoTen + "?", "Xóa nhân viên", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                Funcions.Instance().XoaNhanVien(nhanVien.MaNV);
                LoadTabNhanVien();
                LoadTabThongTin();
            }
        }
        private void dgvNhanVien_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                nhanVien.MaNV = int.Parse(GetCellContent(dgvNhanVien, 0));
                nhanVien.HoTen = GetCellContent(dgvNhanVien, 1);
                nhanVien.SoDT = GetCellContent(dgvNhanVien, 2);
                nhanVien.GioiTinh = GetCellContent(dgvNhanVien, 3);
                nhanVien.TonGiao = GetCellContent(dgvNhanVien, 4);
                nhanVien.QuocTich = GetCellContent(dgvNhanVien, 5);
                nhanVien.Cmnd = GetCellContent(dgvNhanVien, 6);
                nhanVien.ChucVu = GetCellContent(dgvNhanVien, 7);
            }
            catch
            {
                return;
            }
            btnXoaNV.IsEnabled = true;
            btnSuaNV.IsEnabled = true;
        }
        private void LoadTabNhanVien()
        {
            tbNhanVien = Funcions.Instance().DanhSachNhanVien();
            dgvNhanVien.ItemsSource = tbNhanVien.DefaultView;
            dgvNhanVien.IsReadOnly = true;
        }
        private void capNhatNhanVien(int maNhanVien, string hoTen, string soDienThoai,
            string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu)
        {
            //CapNhatNhanVien(int maNhanVien, string hoTen, string soDienThoai, string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu);
            Funcions.Instance().CapNhatNhanVien(maNhanVien, hoTen, soDienThoai, gioiTinh, tonGiao, quocTich, cmnd, chucVu);
            MessageBox.Show("Cập nhật thông tin\nnhân viên thành công!");
            LoadTabNhanVien();
            LoadTabThongTin();
            LoadTabPhong();
        }

        private void themNhanVien(int maNhanVien, string hoTen, string soDienThoai,
            string gioiTinh, string tonGiao, string quocTich, string cmnd, string chucVu)
        {
            Funcions.Instance().ThemNhanVien(maNhanVien, hoTen, soDienThoai, gioiTinh, tonGiao, quocTich, cmnd, chucVu);
            MessageBox.Show("Thêm mới thông tin\nnhân viên thành công!");
            LoadTabNhanVien();
            LoadTabThongTin();
            LoadTabPhong();
        }

        #endregion

        #region SinhVien
        private void LoadTabSinhVien()
        {
            tbSinhVien = Funcions.Instance().DanhSachSinhVien();
            dgvSinhVien.ItemsSource = tbSinhVien.DefaultView;
            dgvSinhVien.IsReadOnly = true;
        }

        private void themSinhVien(int maSV, string hoTen, string soDienThoai,
            string gioiTinh, string tonGiao, string quocTich, string cmnd, int soPhong, int namHoc)
        {
            Funcions.Instance().ThemSinhVien(maSV, hoTen, soDienThoai, gioiTinh, namHoc, tonGiao, quocTich, cmnd, soPhong);
            MessageBox.Show("Thêm mới thông tin\nsinh viên viên thành công!");
            LoadTabSinhVien();
            LoadTabThongTin();
            LoadTabPhong();
        }

        private void capNhatSinhVien(int maSV, string hoTen, string soDienThoai,
            string gioiTinh, string tonGiao, string quocTich, string cmnd, int soPhong, int namHoc)
        {
            Funcions.Instance().CapNhatSinhVien(maSV, hoTen, soDienThoai, gioiTinh, namHoc, tonGiao, quocTich, cmnd, soPhong);
            MessageBox.Show("Cập nhật thông tin\nsinh viên thành công!");
            LoadTabSinhVien();
            LoadTabThongTin();
            LoadTabPhong();
        }

        private void btnThemSV_Click(object sender, RoutedEventArgs e)
        {
            View.AddStudentWindow add = new AddStudentWindow(themSinhVien);
            add.ShowDialog();
        }

        private void btnSuaSV_Click(object sender, RoutedEventArgs e)
        {
            View.UpdateSinhVien update = new UpdateSinhVien(sinhVien, capNhatSinhVien);
            update.ShowDialog();
        }

        private void btnXoaSV_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa sinh viên\n" + sinhVien.HoTen + "?", "Xóa sinh viên", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                Funcions.Instance().XoaSinhVien(sinhVien.MaSV);
                LoadTabSinhVien();
                LoadTabThongTin();
            }
        }

        private void dgvSinhVien_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                sinhVien.MaSV = int.Parse(GetCellContent(dgvSinhVien, 0));
                sinhVien.HoTen = GetCellContent(dgvSinhVien, 1);
                sinhVien.SoDT = GetCellContent(dgvSinhVien, 2);
                sinhVien.GioiTinh = GetCellContent(dgvSinhVien, 3);
                sinhVien.NamHoc = int.Parse(GetCellContent(dgvSinhVien, 4));
                sinhVien.TonGiao = GetCellContent(dgvSinhVien, 5);
                sinhVien.QuocTich = GetCellContent(dgvSinhVien, 6);
                sinhVien.Cmnd = GetCellContent(dgvSinhVien, 7);
                sinhVien.SoPhong = int.Parse(GetCellContent(dgvSinhVien, 8));
            }
            catch
            {
                return;
            }
            btnXoaSV.IsEnabled = true;
            btnSuaSV.IsEnabled = true;
        }
        #endregion

        #region Phong
        private void dgvPhong_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            txtSoLuongSinhVienHienTai.IsReadOnly = false;
            cbbNQL.IsReadOnly = false;
            try
            {
                txtSoPhong.Text = GetCellContent(dgvPhong, 0);
                txtTang.Text = GetCellContent(dgvPhong, 1);
                txtSoLuongSinhVienHienTai.Text = GetCellContent(dgvPhong, 2);
                txtSoLuongSinhVienToiDa.Text = GetCellContent(dgvPhong, 3);
                cbbNQL.Text = GetCellContent(dgvPhong, 4);

                btnLuuPhong.IsEnabled = true;
                btnXoaPhong.IsEnabled = true;

                txtTang.IsEnabled = true;
                txtTang.IsReadOnly = false;
                cbbNQL.IsEnabled = true;
                txtSoLuongSinhVienHienTai.IsEnabled = true;
                txtSoLuongSinhVienToiDa.IsEnabled = true;
            }
            catch
            {
                return;
            }
        }
        private void KhoiTaoDoiTuong()
        {
            phong.SoPhong = int.Parse(txtSoPhong.Text.Trim());
            phong.SoLuongSinhVienHienTai = int.Parse(txtSoLuongSinhVienHienTai.Text.Trim());
            phong.SoLuongSinhVienToiDa = int.Parse(txtSoLuongSinhVienToiDa.Text.Trim());
            phong.MaNhanVien = int.Parse(cbbNQL.Text.Trim());
        }
        private void btnThemPhong_Click(object sender, RoutedEventArgs e)
        {
            ClearContentTabPhong();

            btnLuuPhong.IsEnabled = true;
            btnXoaPhong.IsEnabled = true;

            txtSoPhong.IsReadOnly = false;
            txtTang.IsReadOnly = false;
            cbbNQL.IsReadOnly = false;
            txtSoLuongSinhVienHienTai.IsReadOnly = false;
            txtSoLuongSinhVienToiDa.IsReadOnly = false;
        }
        private void btnLuuPhong_Click(object sender, RoutedEventArgs e)
        {
            if (txtSoPhong.IsReadOnly == false)
            {
                try
                {
                    KhoiTaoDoiTuong();
                    Funcions.Instance().ThemPhong(int.Parse(txtSoPhong.Text.Trim()),
                    int.Parse(txtTang.Text.Trim()),
                    int.Parse(txtSoLuongSinhVienHienTai.Text.Trim()),
                    int.Parse(txtSoLuongSinhVienToiDa.Text.Trim()),
                    int.Parse(cbbNQL.Text.Trim()));
                    MessageBox.Show("Thêm phòng " + txtSoPhong.Text + "\nthành công.", "Thêm phòng");
                    LoadTabPhong();
                    LoadTabThongTin();
                }
                catch
                {
                    MessageBox.Show("Nhập sai ràng buộc dữ liệu.\nVui lòng kiểm tra thông tin\nhoặc chức vụ của nhân viên!", "Lỗi");
                    return;
                }
            }
            else
            {
                try
                {
                    KhoiTaoDoiTuong();
                    Funcions.Instance().CapNhatPhongPhong(int.Parse(txtSoPhong.Text.Trim()),
                        int.Parse(txtSoLuongSinhVienToiDa.Text.Trim()),
                        int.Parse(cbbNQL.Text.Trim()));
                    MessageBox.Show("Lưu phòng " + txtSoPhong.Text + "\nthành công.", "Cập nhật phòng");
                    LoadTabPhong();
                    LoadTabThongTin();
                }
                catch
                {
                    MessageBox.Show("Nhập sai ràng buộc dữ liệu.\nVui lòng kiểm tra thông tin\nhoặc chức vụ của nhân viên!", "Lỗi");
                    return;
                }
            }
            txtSoPhong.IsReadOnly = true;
            txtTang.IsReadOnly = true;
            btnXoaPhong.IsEnabled = false;
            btnLuuPhong.IsEnabled = false;
        }
        private void btnXoaPhong_Click(object sender, RoutedEventArgs e)
        {
            ClearContentTabPhong();

            dgvPhong.UnselectAll();

            btnXoaPhong.IsEnabled = false;
            btnLuuPhong.IsEnabled = false;
            txtSoPhong.IsReadOnly = true;
            txtTang.IsReadOnly = true;
            cbbNQL.IsReadOnly = true;
            txtSoLuongSinhVienHienTai.IsReadOnly = true;
            txtSoLuongSinhVienToiDa.IsReadOnly = true;
        }
        private void ClearContentTabPhong()
        {
            txtSoPhong.Clear();
            txtTang.Clear();
            txtSoLuongSinhVienHienTai.Clear();
            txtSoLuongSinhVienToiDa.Clear();
            cbbNQL.Text = "";
        }
        private void LoadTabPhong()
        {
            tbPhong = Funcions.Instance().DanhSachPhong();
            dgvPhong.ItemsSource = tbPhong.DefaultView;
            dgvPhong.IsReadOnly = true;
            cbbNQL.Items.Clear();
            foreach(DataRow a in Funcions.Instance().DanhSachNhanVien().Rows)
            {
                cbbNQL.Items.Add(a[0].ToString());
            }
            ClearContentTabPhong();
        }
        #endregion

        #region HoaDon_LePhi
        // Chỉnh sửa control khi hủy bỏ lệnh xóa
        private void btnXoaHoaDonLePhi_Click(object sender, RoutedEventArgs e)
        {
            btnSuaHoaDonLePhi.IsEnabled = false;
            btnXoaHoaDonLePhi_copy.IsEnabled = false;
            btnXoaHoaDonLePhi.IsEnabled = false;
            txtMaBienLaiLP.IsReadOnly = true;
            btnHuyHoaDon.IsEnabled = false;
            txtMaSVLP.IsReadOnly = true;
            txtTongChiPhiLP.IsReadOnly = true;
            dgvHoaDonLePhi.UnselectAll();
            txtMaBienLaiLP.Clear();
            txtMaSVLP.Clear();
            txtTongChiPhiLP.Clear();
            btnTinhTrangThanhToan.IsChecked = false;
            dtpNgayBatDauO.Text = "";
            dgvHoaDonLePhi.UnselectAll();
            btnXoaHoaDonLePhi_copy.IsEnabled = false;
        }
        private void btnSuaHoaDonLePhi_Click(object sender, RoutedEventArgs e)
        {
            string tinhTrang = "";
            if (btnTinhTrangThanhToan.IsChecked == true)
            {
                tinhTrang = "Yes";
            }
            else
            {
                tinhTrang = "No";
            }

            try
            {
                if (txtMaBienLaiLP.IsReadOnly == false)
                {

                    Funcions.Instance().ThemHoaDonLePhi(int.Parse(txtMaBienLaiLP.Text.Trim()),
                        float.Parse(txtTongChiPhiLP.Text.Trim()),
                        DateTime.Parse(dtpNgayBatDauO.Text),
                        DateTime.Parse(dtpNgayTaoHoaDon.Text),
                        tinhTrang,
                        int.Parse(txtMaSVLP.Text.Trim()));
                    LoadTabHoaDonLePhi();
                    LoadTabThongTin();
                    txtMaBienLaiLP.IsReadOnly = true;
                    MessageBox.Show("Thêm mới hóa đơn thành công", "Thêm hóa đơn");
                }
                else
                {
                    Funcions.Instance().CapNhatHoaDonLePhi(int.Parse(txtMaBienLaiLP.Text.Trim()),
                        float.Parse(txtTongChiPhiLP.Text.Trim()),
                        DateTime.Parse(dtpNgayBatDauO.Text),
                        DateTime.Parse(dtpNgayTaoHoaDon.Text),
                        tinhTrang,
                        int.Parse(txtMaSVLP.Text.Trim()));
                    LoadTabHoaDonLePhi();
                    LoadTabThongTin();
                    txtMaBienLaiLP.IsReadOnly = true;
                    MessageBox.Show("Cập nhật hóa đơn thành công", "Cập nhật hóa đơn");
                }
            }
            catch
            {
                MessageBox.Show("Lỗi ràng buộc dữ liệu", "Lỗi");
                return;
            }
        }
        private void btnThemHoaDonLePhi_Click(object sender, RoutedEventArgs e)
        {
            btnSuaHoaDonLePhi.IsEnabled = true;
            btnXoaHoaDonLePhi_copy.IsEnabled = true;
            txtMaBienLaiLP.IsReadOnly = false;
            txtMaSVLP.IsReadOnly = false;
            txtTongChiPhiLP.IsReadOnly = false;
            dtpNgayTaoHoaDon.SelectedDate = DateTime.Now;
            txtMaBienLaiLP.Clear();
            txtMaSVLP.Clear();
            txtTongChiPhiLP.Clear();
            btnTinhTrangThanhToan.IsChecked = false;
            dtpNgayBatDauO.Text = "";
            dgvHoaDonLePhi.UnselectAll();
            txtMaBienLaiLP.Focus();
        }

        private void dgvHoaDonLePhi_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                hoaDonLePhi.MaBienLai = int.Parse(GetCellContent(dgvHoaDonLePhi, 0));
                hoaDonLePhi.TongTien = float.Parse(GetCellContent(dgvHoaDonLePhi, 1));
                hoaDonLePhi.NgayBatDauO = DateTime.Parse(GetCellContent(dgvHoaDonLePhi, 2));
                hoaDonLePhi.NgayTaoHoaDon = DateTime.Parse(GetCellContent(dgvHoaDonLePhi, 3));
                hoaDonLePhi.TinhTrangThanhToan = GetCellContent(dgvHoaDonLePhi, 4);
                hoaDonLePhi.MaSinhVien = int.Parse(GetCellContent(dgvHoaDonLePhi, 5));
                btnXoaHoaDonLePhi_copy.IsEnabled = true;
                btnXoaHoaDonLePhi.IsEnabled = true;
                btnSuaHoaDonLePhi.IsEnabled = true;
                txtMaSVLP.IsReadOnly = false;
                txtTongChiPhiLP.IsReadOnly = false;


                txtMaBienLaiLP.Text = hoaDonLePhi.MaBienLai + "";
                txtMaSVLP.Text = hoaDonLePhi.MaSinhVien + "";
                txtTongChiPhiLP.Text = hoaDonLePhi.TongTien + "";
                if (hoaDonLePhi.TinhTrangThanhToan.Trim() == "Yes")
                {
                    btnTinhTrangThanhToan.IsChecked = true;
                }
                else
                {
                    btnTinhTrangThanhToan.IsChecked = false;
                }
                dtpNgayBatDauO.SelectedDate = hoaDonLePhi.NgayBatDauO;
                dtpNgayTaoHoaDon.SelectedDate = hoaDonLePhi.NgayTaoHoaDon;
            }
            catch
            {
                return;
            }
        }

        // Thực hiện xóa
        private void btnXoaHoaDonLePhi_Copy_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có muốn xóa hóa đơn của phòng " +
                    txtMaSVLP.Text + "\n" + DateTime.Parse(dtpNgayTaoHoaDon.Text).ToString("dd/MM/yyyy"),
                    "Xóa hóa đơn", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    Funcions.Instance().XoaHoaDonLePhi(hoaDonLePhi.MaBienLai);
                    LoadTabHoaDonLePhi();
                    LoadTabThongTin();
                    txtMaBienLaiLP.IsReadOnly = true;

                    LoadTabHoaDonLePhi();
                    LoadTabThongTin();
                    txtMaBienLaiLP.IsReadOnly = true;
                    MessageBox.Show("Xóa hóa đơn thành công", "Xóa hóa đơn", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Hãy chọn hóa đơn cần xóa!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            finally
            {
                btnSuaHoaDonLePhi.IsEnabled = false;
                btnXoaHoaDonLePhi_copy.IsEnabled = false;
                txtMaBienLaiLP.IsReadOnly = true;
                txtMaSVLP.IsReadOnly = true;
                txtTongChiPhiLP.IsReadOnly = true;
                dgvHoaDonLePhi.UnselectAll();
                txtMaBienLaiLP.Clear();
                txtMaSVLP.Clear();
                txtTongChiPhiLP.Clear();
                btnTinhTrangThanhToan.IsChecked = false;
                dtpNgayBatDauO.Text = "";
                dgvHoaDonLePhi.UnselectAll();
            }
        }
        private void LoadTabHoaDonLePhi()
        {
            tbHoaDonLePhi = Funcions.Instance().DanhSachHoaDonLePhi();
            dgvHoaDonLePhi.ItemsSource = tbHoaDonLePhi.DefaultView;
            dgvHoaDonLePhi.IsReadOnly = true;
        }
        #endregion

        #region HoaDon_DienNuoc

        private void btnThemHoaDon_Click(object sender, RoutedEventArgs e)
        {
            txtMaBienLaiDienNuoc.IsReadOnly = false;
            txtSoPhongDienNuoc.IsReadOnly = false;
            txtTienDien.IsReadOnly = false;
            txtTienNuoc.IsReadOnly = false;

            btnLuuHoaDon.IsEnabled = true;
            btnHuyHoaDon.IsEnabled = true;
            dtpNgayTaoHoaDonDienNuoc.SelectedDate = DateTime.Now;
            txtMaBienLaiDienNuoc.Focus();
        }
        private void btnLuuHoaDon_Click(object sender, RoutedEventArgs e)
        {

            string tinhTrang = "No";
            if (btnTinhTrangThanhToanDienNuoc.IsChecked == true)
            {
                tinhTrang = "Yes";
            }

            if (txtMaBienLaiDienNuoc.IsReadOnly == false)
            {
                try
                {
                    Funcions.Instance().ThemHoaDonDienNuoc(int.Parse(txtMaBienLaiDienNuoc.Text.Trim()),
                    float.Parse(txtTienDien.Text.Trim()),
                    float.Parse(txtTienNuoc.Text.Trim()),
                    DateTime.Parse(dtpNgayTaoHoaDonDienNuoc.Text),
                    tinhTrang,
                    int.Parse(txtSoPhongDienNuoc.Text.Trim()));
                    MessageBox.Show("Thêm mới hóa đơn phòng " + txtSoPhongDienNuoc.Text + "\nThành công!", "Thêm hóa đơn", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch
                {
                    MessageBox.Show("Lỗi ràng buộc dữ liệu \nXin mời nhập lại", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            else
            {
                try
                {
                    Funcions.Instance().CapNhatHoaDonDienNuoc(int.Parse(txtMaBienLaiDienNuoc.Text.Trim()),
                    float.Parse(txtTienDien.Text.Trim()),
                    float.Parse(txtTienNuoc.Text.Trim()),
                    DateTime.Parse(dtpNgayTaoHoaDonDienNuoc.Text),
                    tinhTrang,
                    int.Parse(txtSoPhongDienNuoc.Text.Trim()));
                    MessageBox.Show("Cập nhật hóa đơn phòng " + txtSoPhongDienNuoc.Text + "\nThành công!", "Thêm hóa đơn", MessageBoxButton.OK, MessageBoxImage.Information);

                }
                catch
                {
                    MessageBox.Show("Lỗi ràng buộc dữ liệu \nXin mời nhập lại", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            txtMaBienLaiDienNuoc.IsReadOnly = true;
            txtSoPhongDienNuoc.IsReadOnly = true;
            txtTienDien.IsReadOnly = true;
            txtTienNuoc.IsReadOnly = true;

            txtMaBienLaiDienNuoc.Clear();
            txtSoPhongDienNuoc.Clear();
            txtTienDien.Clear();
            txtTienNuoc.Clear();

            btnLuuHoaDon.IsEnabled = false;
            btnHuyHoaDon.IsEnabled = false;
            btnXoaHoaDon.IsEnabled = false;
            dgvHoaDonDienNuoc.UnselectAll();
            LoadTabHoaDonDienNuoc();
            LoadTabThongTin();
            dtpNgayTaoHoaDonDienNuoc.Text = "";
        }
        private void btnHuyHoaDon_Click(object sender, RoutedEventArgs e)
        {
            txtMaBienLaiDienNuoc.IsReadOnly = true;
            txtSoPhongDienNuoc.IsReadOnly = true;
            txtTienDien.IsReadOnly = true;
            txtTienNuoc.IsReadOnly = true;

            txtMaBienLaiDienNuoc.Clear();
            txtSoPhongDienNuoc.Clear();
            txtTienDien.Clear();
            txtTienNuoc.Clear();

            btnLuuHoaDon.IsEnabled = false;
            btnHuyHoaDon.IsEnabled = false;
            btnXoaHoaDon.IsEnabled = false;
            dgvHoaDonDienNuoc.UnselectAll();
            dtpNgayTaoHoaDonDienNuoc.Text = "";
        }
        private void btnXoaHoaDon_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có muốn xóa hóa đơn của phòng " + txtSoPhongDienNuoc.Text + "\n" + DateTime.Parse(dtpNgayTaoHoaDonDienNuoc.Text).ToString("dd/MM/yyyy"), "Xóa hóa đơn", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    Funcions.Instance().XoaHoaDonDienNuoc(hoaDonDienNuoc.MaBienLai);
                    MessageBox.Show("Xóa hóa đơn phòng " + txtSoPhongDienNuoc.Text + "\nThành công!", "Xóa hóa đơn", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Hãy chọn hóa đơn để xóa", "Xóa hóa đơn", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            txtMaBienLaiDienNuoc.IsReadOnly = true;
            txtSoPhongDienNuoc.IsReadOnly = true;
            txtTienDien.IsReadOnly = true;
            txtTienNuoc.IsReadOnly = true;

            txtMaBienLaiDienNuoc.Clear();
            txtSoPhongDienNuoc.Clear();
            txtTienDien.Clear();
            txtTienNuoc.Clear();

            btnLuuHoaDon.IsEnabled = false;
            btnHuyHoaDon.IsEnabled = false;
            btnXoaHoaDon.IsEnabled = false;
            dgvHoaDonDienNuoc.UnselectAll();
            LoadTabHoaDonDienNuoc();
            LoadTabThongTin();
            dtpNgayTaoHoaDonDienNuoc.Text = "";
        }

        private void dgvHoaDonDienNuoc_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            bool tinhTrang = false;
            try
            {
                hoaDonDienNuoc.MaBienLai = int.Parse(GetCellContent(dgvHoaDonDienNuoc, 0));
                hoaDonDienNuoc.TienDien = float.Parse(GetCellContent(dgvHoaDonDienNuoc, 1));
                hoaDonDienNuoc.TienNuoc = float.Parse(GetCellContent(dgvHoaDonDienNuoc, 2));
                hoaDonDienNuoc.NgayTaoHoaDon = DateTime.Parse(GetCellContent(dgvHoaDonDienNuoc, 3));
                hoaDonDienNuoc.TinhTrangThanhToan = GetCellContent(dgvHoaDonDienNuoc, 4);
                hoaDonDienNuoc.SoPhong = int.Parse(GetCellContent(dgvHoaDonDienNuoc, 5));

                if (hoaDonDienNuoc.TinhTrangThanhToan.Trim() == "Yes")
                {
                    tinhTrang = true;
                }

                txtMaBienLaiDienNuoc.Text = hoaDonDienNuoc.MaBienLai + "";
                txtSoPhongDienNuoc.Text = hoaDonDienNuoc.SoPhong + "";
                txtTienDien.Text = hoaDonDienNuoc.TienDien + "";
                txtTienNuoc.Text = hoaDonDienNuoc.TienNuoc + "";
                dtpNgayTaoHoaDonDienNuoc.SelectedDate = hoaDonDienNuoc.NgayTaoHoaDon;
                btnTinhTrangThanhToanDienNuoc.IsChecked = tinhTrang;
            }
            catch
            {
                return;
            }
            txtSoPhongDienNuoc.IsReadOnly = false;
            txtTienDien.IsReadOnly = false;
            txtTienNuoc.IsReadOnly = false;

            btnLuuHoaDon.IsEnabled = true;
            btnHuyHoaDon.IsEnabled = true;
            btnXoaHoaDon.IsEnabled = true;
        }

        private void LoadTabHoaDonDienNuoc()
        {
            tbHoaDonDienNuoc = Funcions.Instance().DanhSachHoaDonDienNuoc();
            dgvHoaDonDienNuoc.ItemsSource = tbHoaDonDienNuoc.DefaultView;
            dgvHoaDonDienNuoc.IsReadOnly = true;
        }
        #endregion

        #region ChucNang_TimKiem
        private void txtSoPhongTimKiem_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                dgvDanhSachSinhVienTheoPhong.ItemsSource = Funcions.Instance().DanhSachSinhVienTheoPhong(int.Parse(txtSoPhongTimKiem.Text.Trim())).DefaultView;
            }
            catch
            {
                return;
            }
        }

        private void txtMaNhanVienTimKiem_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                dgvDanhSachPhongTheoNhanVienQuanLy.ItemsSource = Funcions.Instance().DanhSachPhongTheoQuanLy(int.Parse(txtMaNhanVienTimKiem.Text.Trim())).DefaultView;
            }
            catch
            {
                return;
            }
        }
        #endregion    
    }
}
