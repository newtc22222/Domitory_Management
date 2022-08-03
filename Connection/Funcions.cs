using System;
using System.Data;
using System.Data.SqlClient;
using QuanLySinhVien.View;
namespace QuanLySinhVien.Connection
{
    class Funcions
    {
        private DAL dal;

        private static Funcions obj;
        public static Funcions Instance()
        {
            if(obj == null)
            {
                try
                {
                    obj = new Funcions(MainWindow.dataSource);
                }
                catch
                {
                    throw new Exception();
                }
                return obj;
            }
            return obj;
        }

        public Funcions(string dataSource)
        {
            dal = new DAL(dataSource);
        }

        public bool KiemTraThongTinDangNhap(int tenTaiKhoan, string matKhau, string vaiTro)
        {
            bool flag = false;
            string sql = "SELECT * FROM dbo.func_KiemTraThongTinDangNhap( " 
                + tenTaiKhoan +",'" + matKhau + "', N'" + vaiTro + "');";
            try
            {
                int? result = dal.ExecuteScalar(sql, CommandType.Text);
                if (result > 0)
                {
                    flag = true;
                }
            }
            catch (SqlException)
            {
                flag = false;
            }
            return flag;
        }

        #region ThongTin_tren_TrangChu
        public int SoLuongSinhVienTheoGioiTinh(string gioiTinh)
        {
            string sql = "select dbo.func_SoLuongSinhVienTheoGioiTinh(N'" + gioiTinh + "')";
            return (int)dal.ExecuteScalar(sql, CommandType.Text);
        }
        public DataTable DanhSachHoaDonDienNuocChuaThanhToan()
        {
            string sql = "SELECT * FROM view_HoaDonDienNuocChuaThanhToan";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachPhongTrong()
        {
            string sql = "SELECT * FROM view_PhongTrong";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachPhongConChoTrong()
        {
            string sql = "SELECT * FROM view_PhongConChoTrong";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachSinhVienTheoPhong(int soPhong)
        {
            string sql = "EXEC sp_DanhSachSinhVienTheoPhong @SoPhong=" + soPhong;
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachPhongTheoQuanLy(int maQuanLy)
        {
            string sql = "SELECT * FROM dbo.func_DanhSachPhongDoNhanVienQuanLy( " + maQuanLy + ")";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        #endregion

        #region ThongTin_Tab
        public DataTable ThongTinDangNhap()
        {
            string sql = "SELECT * FROM view_ThongTinDangNhapNhanVien";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachSinhVien()
        {
            string sql = "EXEC dbo.sp_DanhSachSinhVien";
            return dal.GetDataToDataTable(sql, CommandType.StoredProcedure);
        }
        public DataTable DanhSachNhanVien()
        {
            string sql = "EXEC dbo.sp_DanhSachNhanVien";
            return dal.GetDataToDataTable(sql, CommandType.StoredProcedure);
        }
        public DataTable DanhSachPhong()
        {
            string sql = "EXEC dbo.sp_DanhSachPhong";
            return dal.GetDataToDataTable(sql, CommandType.StoredProcedure);
        }
        public DataTable DanhSachHoaDonDienNuoc()
        {
            string sql = "EXEC dbo.sp_DanhSachHoaDonDienNuoc";
            return dal.GetDataToDataTable(sql, CommandType.StoredProcedure);
        }
        public DataTable DanhSachHoaDonLePhi()
        {
            string sql = "EXEC dbo.sp_DanhSachHoaDonLePhi";
            return dal.GetDataToDataTable(sql, CommandType.StoredProcedure);
        }
        public DataTable DanhSachHoaDonLePhiChuaThanhToan()
        {
            string sql = "select * from view_DanhSachHoaDonLePhiChuaThanhToan";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachSinhVienTheoNamHoc(int namHoc)
        {
            string sql = "Select * from dbo.func_DanhSachSinhVienTheoNamHoc(" + namHoc + ");";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachHoaDonDienNuocTheoThang(DateTime now)
        {
            string sql = "select * from dbo.func_DanhSachHoaDonTheoThang('" +
                now.Month + "-" + now.Day + "-" + now.Year + "')";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        public DataTable DanhSachHoaDonDienNuocTheoTang(int tang)
        {
            string sql = "SELECT * FROM func_DanhSachHoaDonTheoTang("+ tang + ")";
            return dal.GetDataToDataTable(sql, CommandType.Text);
        }
        #endregion

        #region Chuc_nang
        public void DoiMatKhau(int tenTaiKhoan,string matKhau)
        {
            string sql = "sp_DoiMatKhau";
            dal.ExcuteNonQuery(sql, CommandType.StoredProcedure,
                new SqlParameter("@TenTaiKhoan", tenTaiKhoan),
                new SqlParameter("@MatKhau", matKhau));
        }
        // Nhan vien
        public void ThemNhanVien(int maNhanVien, string hoTen,
            string soDienThoai, string gioiTinh, string tonGiao,
            string quocTich, string cmnd, string chucVu)
        {
            dal.ExcuteNonQuery("sp_ThemNhanVien", CommandType.StoredProcedure,
                new SqlParameter("@MaNhanVien", maNhanVien),
                new SqlParameter("@HoTen", hoTen),
                new SqlParameter("@SoDienThoai", soDienThoai),
                new SqlParameter("@GioiTinh", gioiTinh),
                new SqlParameter("@TonGiao", tonGiao),
                new SqlParameter("@QuocTich", quocTich),
                new SqlParameter("@CMND", cmnd),
                new SqlParameter("@ChucVu", chucVu));
        }
        public void CapNhatNhanVien(int maNhanVien, string hoTen,
            string soDienThoai, string gioiTinh,
            string tonGiao, string quocTich, string cmnd, string chucVu)
        {
            dal.ExcuteNonQuery("sp_CapNhatNhanVien", CommandType.StoredProcedure,
                new SqlParameter("@MaNhanVien", maNhanVien),
                new SqlParameter("@HoTen", hoTen),
                new SqlParameter("@SoDienThoai", soDienThoai),
                new SqlParameter("@GioiTinh", gioiTinh),
                new SqlParameter("@TonGiao", tonGiao),
                new SqlParameter("@QuocTich", quocTich),
                new SqlParameter("@CMND", cmnd),
                new SqlParameter("@ChucVu", chucVu));
        }
        public void XoaNhanVien(int maNhanVien)
        {
            dal.ExcuteNonQuery("sp_XoaNhanVien", CommandType.StoredProcedure,
                new SqlParameter("@MaNhanVien", maNhanVien));
        }
        // Sinh vien
        public void ThemSinhVien(int maSinhVien, string hoTen,
            string soDienThoai, string gioiTinh,
            int namHoc, string tonGiao, string quocTich,
            string cmnd, int soPhong)
        {
            dal.ExcuteNonQuery("sp_ThemSinhVien", CommandType.StoredProcedure,
                new SqlParameter("@MaSinhVien", maSinhVien),
                new SqlParameter("@HoTen", hoTen),
                new SqlParameter("@SoDienThoai", soDienThoai),
                new SqlParameter("@GioiTinh", gioiTinh),
                new SqlParameter("@NamHoc", namHoc),
                new SqlParameter("@TonGiao", tonGiao),
                new SqlParameter("@QuocTich", quocTich),
                new SqlParameter("@CMND", cmnd),
                new SqlParameter("@SoPhong", soPhong));
        }
        public void CapNhatSinhVien(int maSinhVien, string hoTen,
            string soDienThoai, string gioiTinh,
            int namHoc, string tonGiao, string quocTich,
            string cmnd, int soPhong)
        {
            dal.ExcuteNonQuery("sp_CapNhatSinhVien", CommandType.StoredProcedure,
                new SqlParameter("@MaSinhVien", maSinhVien),
                new SqlParameter("@HoTen", hoTen),
                new SqlParameter("@SoDienThoai", soDienThoai),
                new SqlParameter("@GioiTinh", gioiTinh),
                new SqlParameter("@NamHoc", namHoc),
                new SqlParameter("@TonGiao", tonGiao),
                new SqlParameter("@QuocTich", quocTich),
                new SqlParameter("@CMND", cmnd),
                new SqlParameter("@SoPhong", soPhong));
        }
        public void XoaSinhVien(int maSinhVien)
        {
            dal.ExcuteNonQuery("sp_XoaSinhVien", CommandType.StoredProcedure,
                new SqlParameter("@MaSinhVien", maSinhVien));
        }
        // Phong
        public void ThemPhong(int soPhong, int tang, int soLuongSinhVienHienTai,
            int soLuongSinhVienToiDa, int maNguoiQuanLy)
        {
            dal.ExcuteNonQuery("sp_ThemPhong", CommandType.StoredProcedure,
                new SqlParameter("@SoPhong", soPhong),
                new SqlParameter("@Tang", tang),
                new SqlParameter("@SoLuongSinhVienHienTai", soLuongSinhVienHienTai),
                new SqlParameter("@SoLuongSinhVienToiDa", soLuongSinhVienToiDa),
                new SqlParameter("@NguoiQuanLy", maNguoiQuanLy));
        }
        public void CapNhatPhongPhong(int soPhong, int soLuongSinhVienToiDa,
            int maNguoiQuanLy)
        {
            dal.ExcuteNonQuery("sp_CapNhatPhong", CommandType.StoredProcedure,
                new SqlParameter("@SoPhong", soPhong),
                new SqlParameter("@SoLuongSinhVienToiDa", soLuongSinhVienToiDa),
                new SqlParameter("@NguoiQuanLy", maNguoiQuanLy));
        }
        public void XoaPhong(int soPhong)
        {
            dal.ExcuteNonQuery("sp_XoaPhong", CommandType.StoredProcedure,
                new SqlParameter("@SoPhong", soPhong));
        }
        // Hoa don le phi
        public void ThemHoaDonLePhi(int maBienLai, float tongTien,
            DateTime ngayBatDauO, DateTime ngayTaoHoaDon, string tinhTrangThanhToan,
            int maSinhVien)
        {
            dal.ExcuteNonQuery("sp_ThemHoaDonLePhi", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai),
                new SqlParameter("@TongTien", tongTien),
                new SqlParameter("@NgayBatDauO", ngayBatDauO.Year + "-" + ngayBatDauO.Month + "-" + ngayBatDauO.Day),
                new SqlParameter("@NgayTaoHoaDon", ngayTaoHoaDon.Year + "-" + ngayTaoHoaDon.Month + "-" + ngayTaoHoaDon.Day),
                new SqlParameter("@TinhTrangThanhToan", tinhTrangThanhToan),
                new SqlParameter("@MaSinhVien", maSinhVien));
        }
        public void CapNhatHoaDonLePhi(int maBienLai, float tongTien, 
            DateTime ngayBatDauO, DateTime ngayTaoHoaDon, string tinhTrangThanhToan,
            int maSinhVien)
        {
            dal.ExcuteNonQuery("sp_CapNhatHoaDonLePhi", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai),
                new SqlParameter("@TongTien", tongTien),
                new SqlParameter("@NgayBatDauO", ngayBatDauO.Year +
                "-" + ngayBatDauO.Month +
                "-" + ngayBatDauO.Day),
                new SqlParameter("@NgayTaoHoaDon", ngayTaoHoaDon.Year +
                "-" + ngayTaoHoaDon.Month + "-" + ngayTaoHoaDon.Day),
                new SqlParameter("@TinhTrangThanhToan", tinhTrangThanhToan),
                new SqlParameter("@MaSinhVien", maSinhVien));
        }
        public void XoaHoaDonLePhi(int maBienLai)
        {
            dal.ExcuteNonQuery("sp_XoaHoaDonLePhi", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai));
        }
        // Hoa don dien nuoc
        public void ThemHoaDonDienNuoc(int maBienLai, 
            float tienDien, float tienNuoc,
            DateTime ngyaTaoHoaDon, string tinhTrangThanhToan,
            int soPhong)
        {
            dal.ExcuteNonQuery("sp_ThemHoaDonDienNuoc", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai),
                new SqlParameter("@TienDien", tienDien),
                new SqlParameter("TienNuoc", tienNuoc),
                new SqlParameter("@NgayTaoHoaDon", ngyaTaoHoaDon.Year +
                "-" + ngyaTaoHoaDon.Month +
                "-" + ngyaTaoHoaDon.Day),
                new SqlParameter("@TinhTrangThanhToan", tinhTrangThanhToan),
                new SqlParameter("@SoPhong", soPhong));
        }
        public void CapNhatHoaDonDienNuoc(int maBienLai,
            float tienDien, float tienNuoc, DateTime ngyaTaoHoaDon,
            string tinhTrangThanhToan, int soPhong)
        {
            dal.ExcuteNonQuery("sp_CapNhatHoaDonDienNuoc", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai),
                new SqlParameter("@TienDien", tienDien),
                new SqlParameter("TienNuoc", tienNuoc),
                new SqlParameter("@NgayTaoHoaDon", ngyaTaoHoaDon.Year +
                "-" + ngyaTaoHoaDon.Month + "-" + ngyaTaoHoaDon.Day),
                new SqlParameter("@TinhTrangThanhToan", tinhTrangThanhToan),
                new SqlParameter("@SoPhong", soPhong));
        }
        public void XoaHoaDonDienNuoc(int maBienLai)
        {
            dal.ExcuteNonQuery("sp_XoaHoaDonDienNuoc", CommandType.StoredProcedure,
                new SqlParameter("@MaBienLai", maBienLai));
        }
        #endregion
    }
}
