using System;

namespace QuanLySinhVien.Models
{
    public class HoaDonLePhi
    {
        private int maBienLai;
        private float tongTien;
        private DateTime ngayBatDauO;
        private DateTime ngayTaoHoaDon;
        private string tinhTrangThanhToan;
        private int maSinhVien;

        public HoaDonLePhi(int maBienLai, float tongTien, DateTime ngayBatDauO,
            DateTime ngayTaoHoaDon, string tinhTrangThanhToan, int maSinhVien)
        {
            this.maBienLai = maBienLai;
            this.tongTien = tongTien;
            this.ngayBatDauO = ngayBatDauO;
            this.ngayTaoHoaDon = ngayTaoHoaDon;
            this.tinhTrangThanhToan = tinhTrangThanhToan;
            this.maSinhVien = maSinhVien;
        }
        public HoaDonLePhi()
        {

        }
        public int MaBienLai { get => maBienLai; set => maBienLai = value; }
        public float TongTien { get => tongTien; set => tongTien = value; }
        public DateTime NgayBatDauO { get => ngayBatDauO; set => ngayBatDauO = value; }
        public DateTime NgayTaoHoaDon { get => ngayTaoHoaDon; set => ngayTaoHoaDon = value; }
        public string TinhTrangThanhToan { get => tinhTrangThanhToan; set => tinhTrangThanhToan = value; }
        public int MaSinhVien { get => maSinhVien; set => maSinhVien = value; }
    }
}
