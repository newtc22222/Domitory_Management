namespace QuanLySinhVien.Models
{
    public class Phong
    {
        private int soPhong;
        private int tang;
        private int soLuongSinhVienHienTai;
        private int soLuongSinhVienToiDa;
        private int maNhanVien;

        public Phong(int soPhong, int tang, int soLuongSinhVienHienTai,
            int soLuongSinhVienToiDa, int maNhanVien)
        {
            this.soPhong = soPhong;
            this.tang = tang;
            this.soLuongSinhVienHienTai = soLuongSinhVienHienTai;
            this.soLuongSinhVienToiDa = soLuongSinhVienToiDa;
            this.maNhanVien = maNhanVien;
        }
        public Phong()
        {

        }
        public int SoPhong { get => soPhong; set => soPhong = value; }
        public int Tang { get => tang; set => tang = value; }
        public int SoLuongSinhVienHienTai { get => soLuongSinhVienHienTai; set => soLuongSinhVienHienTai = value; }
        public int SoLuongSinhVienToiDa { get => soLuongSinhVienToiDa; set => soLuongSinhVienToiDa = value; }
        public int MaNhanVien { get => maNhanVien; set => maNhanVien = value; }
    }
}
