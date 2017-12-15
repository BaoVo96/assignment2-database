################
# CREATE TABLE #
################

drop database if exists ass2;
create schema if not exists ass2;

use ass2;

# Create chuong_trinh_hoc
drop table if exists chuong_trinh_hoc;
CREATE TABLE chuong_trinh_hoc (
    id_chuong_trinh_hoc CHAR(10),
    ten CHAR(100),
    thoi_gian_hoc float,
    thoi_gian_gia_han float,
    CONSTRAINT PK_chuong_trinh_hoc PRIMARY KEY (id_chuong_trinh_hoc)
);

# Create khoa
drop table	if exists khoa;
CREATE TABLE khoa (
    id_khoa CHAR(10),
    ten_khoa CHAR(100),
    CONSTRAINT PK_khoa PRIMARY KEY (id_khoa)
);

# Create mon_hoc
drop table if exists mon_hoc;
CREATE TABLE mon_hoc (
    id_mon_hoc CHAR(10),
    ten CHAR(100),
    so_tin_chi TINYINT UNSIGNED,
    so_tiet TINYINT UNSIGNED,
    id_chuong_trinh_hoc CHAR(10),
    id_khoa CHAR(10),
    CONSTRAINT PK_mon_hoc PRIMARY KEY (id_mon_hoc)
);

# Create nguoi
drop table if exists nguoi;
CREATE TABLE nguoi (
    id_nguoi CHAR(10),
    ten CHAR(50),
    ngay_sinh DATE,
    dia_chi MEDIUMTEXT,
    sdt CHAR(20),
    mail CHAR(50),
    sex CHAR(6),
    CONSTRAINT PK_nguoi PRIMARY KEY (id_nguoi)
);

# Create giang_vien
drop table if exists giang_vien;
CREATE TABLE giang_vien (
    id_gv CHAR(10),
    id_khoa CHAR(10),
    CONSTRAINT PK_giang_vien PRIMARY KEY (id_gv)
);

# Create sinh_vien
drop table if exists sinh_vien;
CREATE TABLE sinh_vien (
    id_sv CHAR(10),
    id_khoa CHAR(10),
    id_chuong_trinh_hoc CHAR(10),
    id_lop_chu_nhiem CHAR(10),
    khoa SMALLINT UNSIGNED,
    CONSTRAINT PK_sinh_vien PRIMARY KEY (id_sv)
);

# Create lop_mon_hoc
drop table if exists lop_mon_hoc;
CREATE TABLE lop_mon_hoc (
    id_lop_mon_hoc CHAR(10),
    si_so TINYINT UNSIGNED,
    id_mon_hoc CHAR(10),
    id_hoc_ky CHAR(5),
    id_giang_vien CHAR(10),
    id_lop CHAR(10),
    CONSTRAINT PK_lop_mon_hoc PRIMARY KEY (id_lop_mon_hoc , id_mon_hoc, id_hoc_ky)
);

# Create lop_chu_nhiem
drop table if exists lop_chu_nhiem;
CREATE TABLE lop_chu_nhiem (
    id_lop_chu_nhiem CHAR(10),
    si_so TINYINT UNSIGNED,
    ten CHAR(10),
    id_giang_vien CHAR(10),
    id_khoa CHAR(10),
    id_lop CHAR(10),
    CONSTRAINT PK_lop_chu_nhiem PRIMARY KEY (id_lop_chu_nhiem)
);

# Create hoat_dong_ngoai_khoa
drop table if exists hoat_dong_ngoai_khoa;
CREATE TABLE hoat_dong_ngoai_khoa (
    id_hoat_dong_ngoai_khoa CHAR(10),
    ten CHAR(100),
    id_giang_vien CHAR(10),
    id_hoc_ky CHAR(10),
    CONSTRAINT PK_hoat_dong_ngoai_khoa PRIMARY KEY (id_hoat_dong_ngoai_khoa)
);

# Create chu_de
drop table if exists chu_de;
CREATE TABLE chu_de (
    id_chu_de CHAR(5),
    ten CHAR(100),
    id_lop CHAR(10),
    id_giang_vien CHAR(10),
    CONSTRAINT PK_chu_de PRIMARY KEY (id_chu_de , id_lop)
);

# Create cau_hoi
drop table if exists cau_hoi;
CREATE TABLE cau_hoi (
    id_cau_hoi CHAR(5),
    tieu_de CHAR(100),
    noi_dung TEXT,
    thoi_gian DATETIME,
    id_nguoi_tao CHAR(10),
    id_lop_mon_hoc CHAR(10),
    id_mon_hoc CHAR(10),
    id_lop CHAR(10),
    CONSTRAINT PK_cau_hoi PRIMARY KEY (id_cau_hoi)
);

# Create hoc_ky
drop table if exists hoc_ky;
CREATE TABLE hoc_ky (
    id_hoc_ky CHAR(10),
    CONSTRAINT PK_hoc_ky PRIMARY KEY (id_hoc_ky)
);

# Create tin_nhan
drop table if exists tin_nhan;
CREATE TABLE tin_nhan (
    id_tin_nhan INT,
    noi_dung TEXT,
    thoi_gian DATETIME,
    id_nguoi_gui CHAR(10),
    id_nguoi_nhan CHAR(10),
    CONSTRAINT PK_tin_nhan PRIMARY KEY (id_tin_nhan)
);

# Create lop
drop table if exists lop;
CREATE TABLE lop (
    id_lop CHAR(10),
    CONSTRAINT PK_lop PRIMARY KEY (ID_lop)
);
				
# Create noi_dung_duong_dan
drop table if exists noi_dung_duong_dan;
CREATE TABLE noi_dung_duong_dan (
    id_chu_de CHAR(5),
    id_lop CHAR(10),
    id_duong_dan TINYINT UNSIGNED,
    duong_dan MEDIUMTEXT,
    CONSTRAINT PK_noi_dung_duong_dan PRIMARY KEY (id_chu_de , id_lop , id_duong_dan)
);

# Create diem
drop table if exists diem;
CREATE TABLE diem (
    id_lop_mon_hoc CHAR(10),
    id_mon_hoc CHAR(10),
  	id_hoc_ky CHAR(10),
    id_sinh_vien CHAR(10),
    diem CHAR(5),
    so_diem float NULL default null,
    CONSTRAINT PK_diem PRIMARY KEY (id_lop_mon_hoc , id_mon_hoc , id_sinh_vien , id_hoc_ky , diem)
);

# Create phan_tram_diem
drop table if exists phan_tram_diem;
CREATE TABLE phan_tram_diem (
    id_mon_hoc CHAR(10),
    diem CHAR(5),
    phan_tram_diem TINYINT UNSIGNED,
    CONSTRAINT PK_phan_tram_diem PRIMARY KEY (id_mon_hoc , diem)
);

# Create khoa_co_chuong_trinh_hoc
drop table if exists khoa_co_chuong_trinh_hoc;
CREATE TABLE khoa_co_chuong_trinh_hoc (
    id_khoa CHAR(10),
    id_chuong_trinh_hoc CHAR(10),
    CONSTRAINT PK_khoa_co_chuong_trinh_hoc PRIMARY KEY (id_khoa , id_chuong_trinh_hoc)
);
	
# Create tra_loi
drop table if exists tra_loi;
CREATE TABLE tra_loi (
    id_nguoi_tra_loi CHAR(10),
    id_cau_hoi CHAR(10),
    id_lop_mon_hoc CHAR(10),
    id_mon_hoc CHAR(10),
    CONSTRAINT PK_tra_loi PRIMARY KEY (id_nguoi_tra_loi , id_cau_hoi , id_lop_mon_hoc , id_mon_hoc)
);

# Create lan_tra_loi
drop table if exists lan_tra_loi;
CREATE TABLE lan_tra_loi (
    id_nguoi_tra_loi CHAR(10),
    id_cau_hoi CHAR(5),
    id_lop_mon_hoc CHAR(10),
    id_mon_hoc CHAR(10),
    lan_tra_loi TINYINT UNSIGNED,
    noi_dung MEDIUMTEXT,
    thoi_gian DATETIME,
    CONSTRAINT PK_lan_tra_loi PRIMARY KEY (id_nguoi_tra_loi , id_cau_hoi , id_lop_mon_hoc , id_mon_hoc , lan_tra_loi)
);

# Create dang_ky						
drop table if exists dang_ky;
CREATE TABLE dang_ky (
    id_sinh_vien CHAR(10),
    id_hoat_dong CHAR(10),
    CONSTRAINT PK_dang_ky PRIMARY KEY (id_sinh_vien , id_hoat_dong)
);

# Create huong_dan						
drop table if exists huong_dan;
CREATE TABLE huong_dan (
    id_giang_vien CHAR(10),
    id_hoat_dong CHAR(10),
    CONSTRAINT PK_huong_dan PRIMARY KEY (id_giang_vien , id_hoat_dong)
);

# Create hoc
drop table if exists hoc;
CREATE TABLE hoc (
    id_lop_mon_hoc CHAR(10),
    id_mon_hoc CHAR(10),
    id_hoc_ky CHAR(5),
    id_sinh_vien CHAR(10),
    CONSTRAINT PK_hoc PRIMARY KEY (id_lop_mon_hoc, id_mon_hoc, id_hoc_ky, id_sinh_vien)
);