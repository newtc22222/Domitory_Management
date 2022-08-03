using System;

namespace QuanLySinhVien.Models
{
    public class HoaDonDienNuoc
    {
        private int maBienLai;
        private float tienDien;
        private float tienNuoc;
        private DateTime ngayTaoHoaDon;
        private string tinhTrangThanhToan;
        private int soPhong;

        public HoaDonDienNuoc(int maBienLai, float tienDien, float tienNuoc, 
            DateTime ngayTaoHoaDon, string tinhTrangThanhToan, int soPhong)
        {
            this.MaBienLai = maBienLai;
            this.TienDien = tienDien;
            this.TienNuoc = tienNuoc;
            this.NgayTaoHoaDon = ngayTaoHoaDon;
            this.TinhTrangThanhToan = tinhTrangThanhToan;
            this.SoPhong = soPhong;
        }
        public HoaDonDienNuoc() { }
        public int MaBienLai { get => maBienLai; set => maBienLai = value; }
        public float TienDien { get => tienDien; set => tienDien = value; }
        public float TienNuoc { get => tienNuoc; set => tienNuoc = value; }
        public DateTime NgayTaoHoaDon { get => ngayTaoHoaDon; set => ngayTaoHoaDon = value; }
        public string TinhTrangThanhToan { get => tinhTrangThanhToan; set => tinhTrangThanhToan = value; }
        public int SoPhong { get => soPhong; set => soPhong = value; }
    }
}
