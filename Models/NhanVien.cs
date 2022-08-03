namespace QuanLySinhVien.Models
{
    public class NhanVien
    {
        private int maNV;
        private string hoTen;
        private string cmnd;
        private string tonGiao;
        private string soDT;
        private string gioiTinh;
        private string chucVu;
        private string quocTich;

        public NhanVien(int maNV, string hoTen, string cmnd,
            string tonGiao, string soDT, string gioiTinh, 
            string chucVu, string quocTich)
        {
            this.maNV = maNV;
            this.hoTen = hoTen;
            this.cmnd = cmnd;
            this.tonGiao = tonGiao;
            this.soDT = soDT;
            this.gioiTinh = gioiTinh;
            this.chucVu = chucVu;
            this.quocTich = quocTich;
        }
        public NhanVien()
        {

        }
        public int MaNV { get => maNV; set => maNV = value; }
        public string HoTen { get => hoTen; set => hoTen = value; }
        public string Cmnd { get => cmnd; set => cmnd = value; }
        public string TonGiao { get => tonGiao; set => tonGiao = value; }
        public string SoDT { get => soDT; set => soDT = value; }
        public string GioiTinh { get => gioiTinh; set => gioiTinh = value; }
        public string ChucVu { get => chucVu; set => chucVu = value; }
        public string QuocTich { get => quocTich; set => quocTich = value; }
    }
}
