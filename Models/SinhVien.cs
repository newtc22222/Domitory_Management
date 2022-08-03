namespace QuanLySinhVien.Models
{
    public class SinhVien
    {
        private int maSV;
        private string hoTen;
        private string cmnd;
        private string tonGiao;
        private string soDT;
        private string gioiTinh;
        private int soPhong;
        private string quocTich;
        private int namHoc;

        public SinhVien(int maSV, string hoTen, string cmnd,
            string tonGiao, string soDT, string gioiTinh,
            int soPhong, string quocTich, int namHoc)
        {
            this.maSV = maSV;
            this.hoTen = hoTen;
            this.cmnd = cmnd;
            this.tonGiao = tonGiao;
            this.soDT = soDT;
            this.gioiTinh = gioiTinh;
            this.soPhong = soPhong;
            this.quocTich = quocTich;
            this.namHoc = namHoc;
        }

        public SinhVien()
        {

        }

        public int MaSV { get => maSV; set => maSV = value; }
        public string HoTen { get => hoTen; set => hoTen = value; }
        public string Cmnd { get => cmnd; set => cmnd = value; }
        public string TonGiao { get => tonGiao; set => tonGiao = value; }
        public string SoDT { get => soDT; set => soDT = value; }
        public string GioiTinh { get => gioiTinh; set => gioiTinh = value; }
        public int SoPhong { get => soPhong; set => soPhong = value; }
        public string QuocTich { get => quocTich; set => quocTich = value; }
        public int NamHoc { get => namHoc; set => namHoc = value; }
    }
}
