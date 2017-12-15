###############
# FOREIGN KEY #
###############

# Foreign key: mon_hoc
ALTER TABLE mon_hoc
ADD FOREIGN KEY (id_chuong_trinh_hoc) 
REFERENCES chuong_trinh_hoc(id_chuong_trinh_hoc)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE mon_hoc
ADD FOREIGN KEY (id_khoa) 
REFERENCES Khoa(id_khoa)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Giang_vien
ALTER TABLE Giang_vien
ADD FOREIGN KEY (id_khoa) 
REFERENCES Khoa(id_khoa)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Giang_vien
ADD FOREIGN KEY (id_gv) 
REFERENCES Nguoi(id_nguoi)
ON DELETE CASCADE
ON UPDATE CASCADE 
;

# Foreign key: Sinh_vien
ALTER TABLE Sinh_vien
ADD FOREIGN KEY (id_sv) 
REFERENCES Nguoi(id_nguoi)
ON DELETE CASCADE
ON UPDATE CASCADE 
;

ALTER TABLE Sinh_vien
ADD FOREIGN KEY (id_chuong_trinh_hoc) 
REFERENCES Chuong_trinh_hoc(id_chuong_trinh_hoc)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Sinh_vien
ADD FOREIGN KEY (id_khoa) 
REFERENCES khoa(id_khoa)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Sinh_vien
ADD FOREIGN KEY (id_lop_chu_nhiem) 
REFERENCES Lop_chu_nhiem(id_lop_chu_nhiem)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Lop_mon_hoc
ALTER TABLE Lop_mon_hoc
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Mon_hoc(id_mon_hoc)
ON UPDATE CASCADE 
;

ALTER TABLE Lop_mon_hoc
ADD FOREIGN KEY (id_hoc_ky) 
REFERENCES Hoc_ky(id_hoc_ky)
ON UPDATE CASCADE
;

ALTER TABLE Lop_mon_hoc
ADD FOREIGN KEY (id_giang_vien) 
REFERENCES Giang_vien(id_gv)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Lop_mon_hoc
ADD FOREIGN KEY (id_lop) 
REFERENCES Lop(id_lop)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Lop_chu_nhiem
ALTER TABLE Lop_chu_nhiem
ADD FOREIGN KEY (id_giang_vien) 
REFERENCES Giang_vien(id_gv)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Lop_chu_nhiem
ADD FOREIGN KEY (id_khoa) 
REFERENCES Khoa(id_khoa)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Lop_chu_nhiem
ADD FOREIGN KEY (id_lop) 
REFERENCES Lop(id_lop)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Hoat_dong_ngoai_khoa
ALTER TABLE Hoat_dong_ngoai_khoa
ADD FOREIGN KEY (id_giang_vien) 
REFERENCES Giang_vien(id_gv)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Hoat_dong_ngoai_khoa
ADD FOREIGN KEY (id_hoc_ky) 
REFERENCES Hoc_ky(id_hoc_ky)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Chu_de
ALTER TABLE Chu_de
ADD FOREIGN KEY (id_lop) 
REFERENCES Lop(id_lop)
ON UPDATE CASCADE 
;

ALTER TABLE Chu_de
ADD FOREIGN KEY (id_giang_vien) 
REFERENCES Giang_vien(id_gv)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Cau_hoi
ALTER TABLE Cau_hoi
ADD FOREIGN KEY (id_nguoi_tao) 
REFERENCES Nguoi(id_nguoi)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Cau_hoi
ADD FOREIGN KEY (id_lop_mon_hoc) 
REFERENCES Lop_mon_hoc(id_lop_mon_hoc)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Cau_hoi
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Mon_hoc(id_mon_hoc)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

ALTER TABLE Cau_hoi
ADD FOREIGN KEY (id_lop) 
REFERENCES Lop(id_lop)
ON DELETE SET NULL
ON UPDATE CASCADE 
;

# Foreign key: Tin_nhan
ALTER TABLE Tin_nhan
ADD FOREIGN KEY (id_nguoi_gui) 
REFERENCES Nguoi(id_nguoi)
ON DELETE CASCADE
ON UPDATE CASCADE 
;

ALTER TABLE Tin_nhan
ADD FOREIGN KEY (id_nguoi_nhan) 
REFERENCES Nguoi(id_nguoi)
ON DELETE CASCADE
ON UPDATE CASCADE 
;

# Foreign key: Hoc
ALTER TABLE Hoc
ADD FOREIGN KEY (id_lop_mon_hoc) 
REFERENCES Lop_mon_hoc(id_lop_mon_hoc)
ON UPDATE CASCADE 
;

ALTER TABLE Hoc
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Lop_mon_hoc(id_mon_hoc)
ON UPDATE CASCADE 
;

ALTER TABLE Hoc
ADD FOREIGN KEY (id_hoc_ky) 
REFERENCES Lop_mon_hoc(id_hoc_ky)
ON UPDATE CASCADE 
;

ALTER TABLE Hoc
ADD FOREIGN KEY (id_sinh_vien) 
REFERENCES Sinh_vien(id_sv)
ON UPDATE CASCADE 
;


# Foreign key: Noi_dung_duong_dan
ALTER TABLE Noi_dung_duong_dan
ADD FOREIGN KEY (id_lop) 
REFERENCES Lop(id_lop)
ON DELETE CASCADE
ON UPDATE CASCADE 
;

# Foreign key: Diem
ALTER TABLE Diem
ADD FOREIGN KEY (id_lop_mon_hoc) 
REFERENCES Hoc(id_lop_mon_hoc)
ON UPDATE CASCADE 
;

ALTER TABLE Diem
ADD FOREIGN KEY (id_hoc_ky) 
REFERENCES Hoc(id_hoc_ky)
ON UPDATE CASCADE 
;

ALTER TABLE Diem
ADD FOREIGN KEY (id_sinh_vien) 
REFERENCES Hoc(id_sinh_vien)
ON UPDATE CASCADE 
;

ALTER TABLE Diem
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Hoc(id_mon_hoc)
ON UPDATE CASCADE 
;

ALTER TABLE Diem
ADD FOREIGN KEY (id_mon_hoc,diem) 
REFERENCES phan_tram_diem(id_mon_hoc,diem)
ON UPDATE CASCADE 
;

# Foreign key: Khoa_co_chuong_trinh_hoc
ALTER TABLE Khoa_co_chuong_trinh_hoc
ADD FOREIGN KEY (id_khoa) 
REFERENCES Khoa(id_khoa)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE Khoa_co_chuong_trinh_hoc
ADD FOREIGN KEY (id_chuong_trinh_hoc) 
REFERENCES Chuong_trinh_hoc(id_chuong_trinh_hoc)
ON DELETE CASCADE
ON UPDATE CASCADE
;

# Foreign key: Tra_loi
ALTER TABLE Tra_loi
ADD FOREIGN KEY (id_nguoi_tra_loi) 
REFERENCES Nguoi(id_nguoi)
ON UPDATE CASCADE
;

ALTER TABLE Tra_loi
ADD FOREIGN KEY (id_cau_hoi) 
REFERENCES Cau_hoi(id_cau_hoi)
ON UPDATE CASCADE
;

ALTER TABLE Tra_loi
ADD FOREIGN KEY (id_lop_mon_hoc) 
REFERENCES Lop_mon_hoc(id_lop_mon_hoc)
ON UPDATE CASCADE
;

ALTER TABLE Tra_loi
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Mon_hoc(id_mon_hoc)
ON UPDATE CASCADE
;

# Foreign key: Lan_tra_loi
ALTER TABLE Lan_tra_loi
ADD FOREIGN KEY (id_nguoi_tra_loi) 
REFERENCES Nguoi(id_nguoi)
ON UPDATE CASCADE
;

ALTER TABLE Lan_tra_loi
ADD FOREIGN KEY (id_lop_mon_hoc) 
REFERENCES Lop_mon_hoc(id_lop_mon_hoc)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE Lan_tra_loi
ADD FOREIGN KEY (id_cau_hoi) 
REFERENCES Cau_hoi(id_cau_hoi)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE Lan_tra_loi
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Mon_hoc(id_mon_hoc)
ON DELETE CASCADE
ON UPDATE CASCADE
;

# Foreign key: Dang_ky
ALTER TABLE Dang_ky
ADD FOREIGN KEY (id_sinh_vien) 
REFERENCES Sinh_vien(id_sv)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE Dang_ky
ADD FOREIGN KEY (id_hoat_dong) 
REFERENCES Hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa)
ON DELETE CASCADE
ON UPDATE CASCADE
;

# Foreign key: Huong_dan
ALTER TABLE Huong_dan
ADD FOREIGN KEY (id_giang_vien) 
REFERENCES Giang_vien(id_gv)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE Huong_dan
ADD FOREIGN KEY (id_hoat_dong) 
REFERENCES Hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa)
ON DELETE CASCADE
ON UPDATE CASCADE
;

# Foreign key: Phan_tram_diem
ALTER TABLE Phan_tram_diem
ADD FOREIGN KEY (id_mon_hoc) 
REFERENCES Mon_hoc(id_mon_hoc)
ON DELETE CASCADE
ON UPDATE CASCADE
;