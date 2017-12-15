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

################
# INSERT TABLE #
################

# Insert chuong_trinh_hoc
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('DHCQ', 'Đại học chính quy', 4, 2.5);							
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CDCQ', 'Cao đẳng chính quy', 3, 2.5);							
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CQB2', 'Chính quy bằng 2', 2, 2);								
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CH', 'Cao học', 1, 1);							
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('KSTN', 'Kỹ sư tài năng', 4, 2);							
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CTLKQT', 'Chương trình liên kết quốc tế', 3, 2.5);						
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('VHVL', 'Vừa học vừa làm', 2, 1);					
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('KSCLCTA', 'Kỹ sư chất lượng cao tiếng anh', 4, 2);								
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('KSCLCVP', 'Kỹ sư chất lượng cao Việt Pháp', 4, 2.5);								
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CTAUF', 'Chương trình AUF', 4, 2);								
INSERT INTO chuong_trinh_hoc(id_chuong_trinh_hoc, ten, thoi_gian_hoc, thoi_gian_gia_han) VALUES ('CTTT', 'Chương trình tiên tiến', 4, 2);							

# Insert khoa
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('CK', 'Cơ khí');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('DC', 'Địa chất và dầu khí');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('DD', 'Điện - Điện tử');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('GT', 'Giao thông');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('HH', 'Hóa học');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('UD', 'Ứng dụng');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('MT', 'Khoa học và kỹ thuật máy tính');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('VL', 'Vật liệu');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('XD', 'Xây dựng');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('MO', 'Môi trường');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('QL', 'Quản lý công nghiệp');
INSERT INTO khoa(id_khoa, ten_khoa) VALUES ('BD', 'Bảo dưỡng công nghiệp');

# Insert mon_hoc
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('MT1003', 'Giải tích 1', 4, 60, 'DHCQ', 'UD');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('PH1003', 'Vật lý 1', 4, 60, 'DHCQ', 'UD');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('ME3233', 'Tiếp thị logistics', 1, 30, 'DHCQ', 'CK');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('CO2003', 'Lập trình web', 3, 45, 'DHCQ', 'MT');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('TR2011', 'Khí động lực học 1', 3, 45, 'DHCQ', 'GT');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('IM2011', 'Quản lý dự án cho kỹ sư', 3, 30, 'DHCQ', 'QL');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('ME3077', 'Cấu trúc vải', 2, 45, 'DHCQ', 'CK');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('ME3239', 'Công nghệ CNC', 3, 60, 'DHCQ', 'CK');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('CO2001', 'Hệ cơ sở dữ liệu', 5, 60, 'DHCQ', 'MT');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('ME4435', 'Kỹ thuật hàn', 3, 45, 'DHCQ', 'CK');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('TR3029', 'Động cơ gió', 4, 60, 'DHCQ', 'GT');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('TR4049', 'Rung động tàu', 1, 30, 'DHCQ', 'GT');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('CH3135', 'Công nghệ vi sinh', 3, 60, 'DHCQ', 'HH');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('CH2065', 'Hóa keo', 1, 45, 'DHCQ', 'HH');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('CI3007', 'Nền móng', 2, 45, 'DHCQ', 'XD');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('EN2001', 'Thủy văn môi trường', 3, 60, 'DHCQ', 'MO');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('EN3021', 'Biến đổi khí hậu', 1, 30, 'DHCQ', 'MO');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('MA2004', 'Công nghệ cao su', 3, 45, 'DHCQ', 'VL');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('MA3041', 'Tính chất của polyme', 3, 45, 'DHCQ', 'VL');											
INSERT INTO mon_hoc(id_mon_hoc, ten, so_tin_chi, so_tiet, id_chuong_trinh_hoc, id_khoa) VALUES ('EE2003', 'Điện tử y sinh', 2, 60, 'DHCQ', 'DD');											

# Insert nguoi
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1410001', 'Ngô Phúc Nguyên', '1996-1-2', 'Tiền Giang', '01672659686', 'Nam', 'nguyen141@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1410348', 'Võ Công Gia Bảo', '1996-5-4', 'Nghệ An', '0982611641', 'Nam', 'vcgb23@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1410003', 'Tống Kim Ngân', '1998-4-2', 'Ninh Thuận', '01664849475', 'Nữ', 'ngankim@yahoo.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0001', 'Phạm Minh Phương', '1990-11-26', 'Đồng Tháp', '01665497045', 'Nam', 'pmphuong34@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1310015', 'Nguyễn Tuấn Bảo', '1996-12-12', 'Tây Ninh', '0918546812', 'Nam', 'baobieber14@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1512544', 'Võ Đức Duy', '1996-11-7', 'Tiền Giang', '0921648554', 'Nam', 'ducduy@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1612489', 'Huỳnh Như', '1999-3-1', 'Bến Tre', '0951484846', 'Nữ', 'huynhnhu@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1713454', 'Võ Hoàn Mỹ', '1997-6-15', 'Sóc Trăng', '01674954545', 'Nữ', 'myvo85@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0002', 'Phạm Tấn Khiêm', '1985-6-30', 'An Giang', '01675984812', 'Nam', 'khiemtan@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1612753', 'Lê Huy Thi', '1995-2-14', 'Vũng Tàu', '0984984512', 'Nam', 'huythi@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0005', 'Ngô Thừa Ân', '1970-8-26', 'Kiên Giang', '0918458554', 'Nam', 'anngo@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1611548', 'Lê Thị Thùy Dương', '1980-4-10', 'Cà Mau', '01254648125', 'Nữ', 'duongle@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1412500', 'Huỳnh Đăng Trụ', '1995-3-10', 'Quãng Ngãi', '0905484845', 'Nam', 'truhuynh1994@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0003', 'Lê Bá Anh Tuấn', '1994-7-4', 'Cần Thơ', '0936448451', 'Nam', 'tuanbale@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1511453', 'Ngô Gia Ngân', '1998-12-3', 'Trà Vinh', '0978549165', 'Nữ', 'giangan@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1710601', 'Hoàng Ngọc Hải', '1994-10-8', 'Lâm Đồng', '0964848123', 'Nam', 'haingochoang@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1512479', 'Nguyễn Trường Duy', '1996-8-8', 'Bạc Liêu', '0984546481', 'Nam', 'nguyenduy@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1412698', 'Đoàn Quốc Thái', '1996-10-17', 'Đồng Nai', '0904461656', 'Nam', 'quocthai184@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1711658', 'Châu Ngọc Dung', '1997-2-10', 'Bình Dương', '01674846464', 'Nữ', 'ngocdung@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0004', 'Vũ Xuân Thành', '1975-9-1', 'Khánh Hòa', '01234845694', 'Nam', 'vuthanh@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0135', 'Lê Tấn Sang', '1982-9-23', 'Hà Nội', '01235891248', 'Nam', 'tansang@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV5699', 'Nguyễn Tấn Đặng', '1975-8-23', 'Đồng Nai', '012345981238', 'Nam', 'tandang@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV5625', 'Trần Kim Chi', '1970-12-12', 'An Giang', '012345681256', 'Nữ', 'chitran@yahoo.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1355', 'Nguyễn Thị Tâm', '1986-1-1', 'Đồng Tháp', '02354452358', 'Nữ', 'tamnguyen86@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1874', 'Nguyễn Thị Lệ', '1989-3-2', 'Ninh Bình', '035812357894', 'Nữ', 'lenguyen@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV8903', 'Trương Tấn Sang', '1975-6-5', 'Kon Tum', '016812352123', 'Nam', 'tts@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV8909', 'Đỗ Cao Học', '1986-9-12', 'Bình Phước', '012345624568', 'Nam', 'hocdo.123@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV7896', 'Đỗ Cao Bách Khoa ', '1969-9-25', 'Hà Nội', '021561565154', 'Nam', 'bkdo@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV8907', 'Nguyễn Lê Phan', '1970-12-26', 'Đồng Nai', '015678035468', 'Nam', 'phannguyen@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV8906', 'Đỗ Thái', '1971-12-12', 'Nha Trang', '01268123148', 'Nam', 'thaido@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1234', 'Nguyễn Thị Kim Chi', '1971-12-12', 'Khánh Hòa', '01248126802', 'Nữ', 'chinguyen@yahoo.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1568', 'Nguyễn Thị Ánh', '1971-12-13', 'Lâm Đồng', '0156059715', 'Nữ', 'anhnguyen@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV4890', 'Nguyễn Ánh', '1985-1-29', 'Hà Nội', '0459823269', 'Nữ', 'anhxinh@yahoo.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1268', 'Lệ Quyên', '1989-3-25', 'Cao Bằng', '0115698156', 'Nữ', 'quyenle@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1258', 'Trương Tấn Phát', '1990-11-12', 'Lạng Sơn', '015682891588', 'Nam', 'phat@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV1565', 'Nguyễn Lân Hùng', '1989-11-12', 'Bắc Cạn', '015911268156', 'Nam', 'hung@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1713455', 'Lê Tấn Ngọc', '1995-7-17', 'Cần Thơ', '015698726598', 'Nam', 'ngocle@yahoo.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1412501', 'Lê Tấn Phát', '1996-6-16', 'Gia Lai', '01592489245', 'Nam', 'phatle@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1313648', 'Nguyễn Thị Linh', '1995-9-12', 'Vĩnh Phúc', '0282456789', 'Nữ', 'lanhlong@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1210142', 'Võ Tòng', '1993-12-15', 'Lâm Đồng', '01264597890', 'Nam', 'votong@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1310034', 'Lâm Sung', '1995-12-19', 'Thanh Hóa', '0123458989', 'Nam', 'lamsung@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1210065', 'Lý Quỳ', '1991-11-12', 'Hà Nội', '012345982849', 'Nữ', 'quy@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1410245', 'Lưu Bị', '1995-1-12', 'Huế', '01234567890', 'Nam', 'luubi@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('SV1513215', 'Tống Giang', '1997-2-28', 'Cà Mau', '01234566280', 'Nam', 'giangtong@gmail.com');												
INSERT INTO nguoi(id_nguoi, ten, ngay_sinh, dia_chi, sdt, sex, mail) VALUES ('GV0315', 'Võ Tấn Phước', '1975-3-20', 'Đồng Tháp', '01268566281', 'Nam', 'phuocvo@gmail.com');		

# Insert giang_vien
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0001', 'MT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0002', 'MT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0003', 'MT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0004', 'UD');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0005', 'UD');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0135', 'CK');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV5699', 'BD');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV5625', 'GT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1355', 'QL');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1874', 'CK');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV8903', 'DD');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV8909', 'MT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV7896', 'CK');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV8907', 'GT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV8906', 'GT');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1234', 'HH');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1568', 'HH');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV4890', 'XD');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1268', 'MO');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1258', 'MO');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV1565', 'VL');					
INSERT INTO giang_vien(id_gv, id_khoa) VALUES ('GV0315', 'VL');					

# Insert sinh_vien
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1410001', 'UD', 'DHCQ', 'CN0004', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1410348', 'UD', 'DHCQ', 'CN0005', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1410003', 'CK', 'DHCQ', 'CN0006', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1310015', 'BD', 'CDCQ', 'CN0007', 2013);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1512544', 'GT', 'DHCQ', 'CN0008', 2015);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1612489', 'QL', 'DHCQ', 'CN0009', 2016);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1713454', 'CK', 'DHCQ', 'CN0010', 2017);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1612753', 'MT', 'DHCQ', 'CN0001', 2016);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1611548', 'MT', 'DHCQ', 'CN0002', 2016);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1412501', 'CK', 'DHCQ', 'CN0013', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1511453', 'GT', 'DHCQ', 'CN0014', 2015);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1710601', 'GT', 'DHCQ', 'CN0015', 2017);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1512479', 'HH', 'DHCQ', 'CN0016', 2015);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1412698', 'HH', 'DHCQ', 'CN0017', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1711658', 'XD', 'DHCQ', 'CN0018', 2017);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1713455', 'MO', 'DHCQ', 'CN0019', 2017);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1412500', 'MO', 'DHCQ', 'CN0020', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1313648', 'VL', 'DHCQ', 'CN0021', 2013);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1210142', 'VL', 'DHCQ', 'CN0022', 2012);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1310034', 'DD', 'DHCQ', 'CN0011', 2013);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1210065', 'MT', 'DHCQ', 'CN0012', 2012);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1410245', 'MT', 'DHCQ', 'CN0003', 2014);											
INSERT INTO sinh_vien(id_sv, id_khoa, id_chuong_trinh_hoc, id_lop_chu_nhiem, khoa) VALUES ('SV1513215', 'GT', 'DHCQ', 'CN0008', 2015);											


# Insert lop_mon_hoc
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L01-A', 40, 'CO2003', 'HK171', 'GV0001', 'L63463');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L01-B', 40, 'CO2003', 'HK171', 'GV0001', 'L52325');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L04', 120, 'ME3233', 'HK172', 'GV0135', 'L25352');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L04', 60, 'IM2011', 'HK172', 'GV1355', 'L63462');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L06', 90, 'TR4049', 'HK161', 'GV8907', 'L55352');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L08', 60, 'CH2065', 'HK151', 'GV1234', 'L86858');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L08', 120, 'CI3007', 'HK151', 'GV4890', 'L98978');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A01-A', 40, 'EN2001', 'HK152', 'GV1268', 'L34534');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A01-B', 40, 'EN2001', 'HK152', 'GV1268', 'L45454');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A02', 45, 'CO2001', 'HK162', 'GV0002', 'L56565');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A02', 60, 'CO2001', 'HK161', 'GV0002', 'L67676');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L03', 60, 'MA3041', 'HK141', 'GV0315', 'L78787');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A04', 120, 'ME4435', 'HK173', 'GV1874', 'L98989');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L09', 90, 'EE2003', 'HK153', 'GV8903', 'L12121');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L02-A', 40, 'MA2004', 'HK162', 'GV1565', 'L14141');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L02-B', 40, 'MA2004', 'HK162', 'GV1565', 'L15151');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L02-C', 40, 'MA2004', 'HK162', 'GV1565', 'L16161');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A05-A', 60, 'ME3239', 'HK142', 'GV7896', 'L17171');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('A05-B', 60, 'ME3239', 'HK142', 'GV7896', 'L98654');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L09', 120, 'MT1003', 'HK161', 'GV0005', 'L45677');													
INSERT INTO lop_mon_hoc(id_lop_mon_hoc, si_so, id_mon_hoc, id_hoc_ky, id_giang_vien, id_lop) VALUES ('L10', 40, 'CO2001', 'HK151', 'GV8909', 'L00034');													

# Insert lop_chu_nhiem
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0001', 70, 'MT1604', 'GV0001', 'MT', 'L12369');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0002', 70, 'MT16KH02', 'GV0002', 'MT', 'L12645');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0003', 65, 'MT14KT', 'GV0003', 'MT', 'L45981');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0004', 60, 'UD1401', 'GV0004', 'UD', 'L12684');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0005', 60, 'UD1402', 'GV0005', 'UD', 'L56987');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0006', 90, 'CK14CTM', 'GV0135', 'CK', 'L78942');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0007', 50, 'BD1301', 'GV5699', 'BD', 'L15684');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0008', 70, 'GT1505', 'GV8907', 'GT', 'L15940');													
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0009', 40, 'QL1609', 'GV1355', 'QL', 'L45982');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0010', 80, 'CK1705', 'GV1874', 'CK', 'L15698');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0011', 80, 'DD1308', 'GV8903', 'DD', 'L48948');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0012', 60, 'MT1201', 'GV8909', 'MT', 'L01568');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0013', 45, 'CK14DM', 'GV7896', 'CK', 'L91651');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0014', 60, 'GT1507', 'GV5625', 'GT', 'L45612');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0015', 60, 'GT1703', 'GV8906', 'GT', 'L15681');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0016', 50, 'HH15TP', 'GV1234', 'HH', 'L15682');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0017', 70, 'HH14HD', 'GV1568', 'HH', 'L45948');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0018', 80, 'XD1703', 'GV4890', 'XD', 'L16162');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0019', 60, 'MO17QL', 'GV1268', 'MO', 'L16183');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0020', 70, 'MO1403', 'GV1258', 'MO', 'L31861');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0021', 80, 'VL1307', 'GV1565', 'VL', 'L56975');														
INSERT INTO lop_chu_nhiem(id_lop_chu_nhiem, si_so, ten, id_giang_vien, id_khoa, id_lop) VALUES ('CN0022', 90, 'VL1202', 'GV0315', 'VL', 'L01045');														

# Insert hoat_dong_ngoai_khoa
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0001', 'Con đường chân lý', 'GV0001', 'HK171');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0002', 'Môi trường xanh', 'GV0002', 'HK171');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0003', 'Hội thảo Database', 'GV0003', 'HK161');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0004', 'Hành trình kết nối', 'GV0004', 'HK172');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0005', 'Ngày hội tư vấn', 'GV0005', 'HK151');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0006', 'Tham quan doanh nghiệp', 'GV0135', 'HK142');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0007', 'Vang mãi bản hùng ca', 'GV5699', 'HK142');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0008', 'Vững bước sinh viên', 'GV5625', 'HK162');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0009', 'Xuân tình nguyện', 'GV1355', 'HK151');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0010', 'Cuộc thi Robo thủy lực', 'GV1874', 'HK162');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0011', 'Cuộc thi xe dò line', 'GV8903', 'HK173');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0012', 'Môi trường xanh', 'GV8909', 'HK151');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0013', 'Đêm hội quản lý', 'GV7896', 'HK161');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0014', 'Xuân tình nguyện', 'GV8907', 'HK171');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0015', 'Con đường chân lý', 'GV8906', 'HK161');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0016', 'Hành trình về nguồn', 'GV1234', 'HK141');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0017', 'Mùa hè xanh thành phố', 'GV1568', 'HK143');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0018', 'Cuộc thi tìm hiểu lịch sử', 'GV4890', 'HK142');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0019', 'Hội chợ việc làm', 'GV1268', 'HK152');										
INSERT INTO hoat_dong_ngoai_khoa(id_hoat_dong_ngoai_khoa, ten, id_giang_vien, id_hoc_ky) VALUES ('NK0020', 'Hành trình kết nối', 'GV1258', 'HK141');										

# Insert lop
INSERT INTO lop(id_lop) VALUES ('L63463');				
INSERT INTO lop(id_lop) VALUES ('L52325');				
INSERT INTO lop(id_lop) VALUES ('L25352');				
INSERT INTO lop(id_lop) VALUES ('L63462');				
INSERT INTO lop(id_lop) VALUES ('L55352');				
INSERT INTO lop(id_lop) VALUES ('L86858');				
INSERT INTO lop(id_lop) VALUES ('L98978');				
INSERT INTO lop(id_lop) VALUES ('L34534');				
INSERT INTO lop(id_lop) VALUES ('L45454');				
INSERT INTO lop(id_lop) VALUES ('L56565');				
INSERT INTO lop(id_lop) VALUES ('L67676');				
INSERT INTO lop(id_lop) VALUES ('L78787');				
INSERT INTO lop(id_lop) VALUES ('L98989');				
INSERT INTO lop(id_lop) VALUES ('L12121');				
INSERT INTO lop(id_lop) VALUES ('L14141');				
INSERT INTO lop(id_lop) VALUES ('L15151');				
INSERT INTO lop(id_lop) VALUES ('L16161');				
INSERT INTO lop(id_lop) VALUES ('L17171');				
INSERT INTO lop(id_lop) VALUES ('L98654');				
INSERT INTO lop(id_lop) VALUES ('L45677');				
INSERT INTO lop(id_lop) VALUES ('L12369');				
INSERT INTO lop(id_lop) VALUES ('L12645');				
INSERT INTO lop(id_lop) VALUES ('L45981');				
INSERT INTO lop(id_lop) VALUES ('L12684');				
INSERT INTO lop(id_lop) VALUES ('L56987');				
INSERT INTO lop(id_lop) VALUES ('L78942');				
INSERT INTO lop(id_lop) VALUES ('L15684');				
INSERT INTO lop(id_lop) VALUES ('L15940');				
INSERT INTO lop(id_lop) VALUES ('L45982');				
INSERT INTO lop(id_lop) VALUES ('L15698');				
INSERT INTO lop(id_lop) VALUES ('L48948');				
INSERT INTO lop(id_lop) VALUES ('L01568');				
INSERT INTO lop(id_lop) VALUES ('L91651');				
INSERT INTO lop(id_lop) VALUES ('L45612');				
INSERT INTO lop(id_lop) VALUES ('L15681');				
INSERT INTO lop(id_lop) VALUES ('L15682');				
INSERT INTO lop(id_lop) VALUES ('L45948');				
INSERT INTO lop(id_lop) VALUES ('L16162');				
INSERT INTO lop(id_lop) VALUES ('L16183');				
INSERT INTO lop(id_lop) VALUES ('L31861');				
INSERT INTO lop(id_lop) VALUES ('L56975');				
INSERT INTO lop(id_lop) VALUES ('L00034');				
INSERT INTO lop(id_lop) VALUES ('L01045');				

# Insert chu_de
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD001', 'Chương 1: Giới thiệu', 'L25352', 'GV0135');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD002', 'Chương 2: Ra quyết định trong quản lý', 'L25352', 'GV0135');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD003', 'Đáp án đề thi', 'L63462', 'GV1355');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD004', 'Bài thí nghiệm 1', 'L63463', 'GV0001');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD005', 'Bài thí nghiệm 2', 'L63463', 'GV0001');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD006', 'Chương 4: Phương trình vi phân', 'L45677', 'GV0005');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD007', 'Chương 5:  ', 'L98989', 'GV1874');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD008', 'Chương 1: Các khái niệm cơ bản', 'L12121', 'GV8903');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD009', 'Đề tham khảo', 'L16161', 'GV1565');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD010', 'Chương 2: Verilog', 'L98654', 'GV7896');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD011', 'Chương 3: Máy trạng thái', 'L98654', 'GV7896');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD012', 'Bài giảng môn học', 'L78787', 'GV0315');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD013', 'Tổng kết điểm', 'L67676', 'GV0002');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD014', 'Chương 1,2: Trường điện từ', 'L67676', 'GV0002');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD015', 'Chương 5:  Quản lý tiếp thị', 'L25352', 'GV0135');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD016', 'Thuyết trình vật lý', 'L98978', 'GV4890');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD017', 'Chương 4: Nội suy', 'L86858', 'GV1234');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD018', 'Bài 7', 'L63462', 'GV8907');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD019', 'Tài liệu hỗ trợ học tập', 'L17171', 'GV7896');									
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD020', 'Chủ đề 8', 'L78787', 'GV0315');	
INSERT INTO chu_de(id_chu_de, ten, id_lop, id_giang_vien) VALUES ('CD021', 'Chương 3: Quản lý chất lượng', 'L25352', 'GV0135');	

# Insert tin_nhan
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('1', 'Chào bạn ! Mình tên là Duy', '2015-08-31 1:0:05', 'SV1512544', 'SV1410001');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('2', 'Giờ không biết thi phần nào luôn', '2017-12-01 23:05:05', 'SV1412500', 'SV1710601');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('3', 'Gửi cho t solutions DBS', '2016-1-30 1:56:59', 'SV1512479', 'SV1412698');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('4', 'Tối nay đi ăn kem k ?', '2017-5-7 14:59:59', 'SV1711658', 'SV1512479');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('5', 'Ê chừng nào thi vậy ?', '2017-12-01 23:00:30', 'SV1412500', 'SV1710601');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('6', 'M có sđt của th Thi k', '2016-12-11 11:25:36', 'SV1410348', 'SV1612753');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('7', 'Ngày mai có học ko ?', '2017-9-1 23:1:59', 'SV1713454', 'SV1612489');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('8', 'Có học tiết 7,8,9', '2015-1-16 21:2:59', 'SV1410003', 'SV1410001');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('9', 'Sáq wầy có diểm danh ko cậu ?', '2017-4-28 23:59:59', 'SV1713454', 'SV1412500');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('10', 'Bạn cho mình mượn TL nha.', '2014-5-24 09:59:20', 'SV1313648', 'SV1210142');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('11', 'Nguyễn Thành Phát 1412567', '2015-11-22 14:00:59', 'SV1210065', 'SV1310015');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('12', 'Tao chưa học bài nữa.', '2017-3-30 1:59:59', 'SV1611548', 'SV1511453');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('13', 'Ngày mốt thi rồi nha.', '2017-12-01 23:16:59', 'SV1710601', 'SV1412500');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('14', 'Hello ! My name is ACB', '2017-12-20 23:23:23', 'SV1711658', 'SV1512544');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('15', 'Thi phần nào m ?', '2017-12-01 23:25:59', 'SV1412500', 'SV1710601');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('16', 'Tớ cũng không biết nữa', '2016-11-29 23:22:21', 'SV1313648', 'SV1310034');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('17', 'Chừng nào thi GT ?', '2015-12-11 11:11:11', 'SV1412698', 'SV1410348');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('18', 'Tại t không có đi học', '2016-11-12 23:00:59', 'SV1611548', 'SV1412698');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('19', 'OK.', '2016-11-30 23:00:59', 'SV1410245', 'SV1513215');											
INSERT INTO tin_nhan(id_tin_nhan, noi_dung, thoi_gian, id_nguoi_gui, id_nguoi_nhan) VALUES ('20', 'Thứ 5 làm bài tập lớn nha ', '2016-11-30 22:33:59', 'SV1513215', 'SV1410245');											

# Insert cau_hoi
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH001', 'Giữa kỳ', 'Thầy ơi, đề giữa kỳ hình như bị sai câu 2.', '2017-12-5 2:40:32', 'SV1611548', 'L01-A', 'CO2003', 'L63463');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH002', 'Bài tập lớn', 'Thầy ơi cho em hỏi khi nào deadline bài tập lớn', '2017-12-6 4:13:30', 'SV1713454', 'L04', 'ME3233', 'L25352');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH003', 'Nhóm', 'Thưa thầy, em chưa có nhóm bài tập lớn…', '2017-12-8 1:23:00', 'SV1210065', 'L01-A', 'CO2003', 'L63463');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH004', 'Điểm danh', 'Em chào thầy, thầy điểm danh thiếu 1 buổi. Thầy kiểm tra lại giúp em với.', '2017-12-8 4:17:36', 'SV1410245', 'L01-A', 'CO2003', 'L63463');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH005', 'Thực hành', 'Thực hành hơi khó.', '2017-12-7 2:34:44', 'SV1410001', 'L01-A', 'CO2003', 'L63463');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH006', 'Thí nghiệm', 'Thí nghiệm vui lắm.', '2017-12-5 7:40:08', 'SV1612489', 'L04', 'IM2011', 'L63462');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH007', 'Thuyết trình', 'Thầy ơi, cho em xin lịch thuyết trình của nhóm NT91.', '2017-12-6 10:46:42', 'SV1512544', 'L06', 'TR4049', 'L55352');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH008', 'Xin phép', 'Thầy ơi cho em xin nghỉ học vào ngày…', '2017-12-10 10:23:43', 'SV1710601', 'L06', 'TR4049', 'L55352');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH009', 'Điểm thi', ' Thầy ơi, bài thi lần này thang điểm 10 đúng không ạ ?', '2017-12-13 23:59:59', 'SV1711658', 'L08', 'CI3007', 'L98978');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH010', 'Cuối kỳ', 'Cho em hỏi thi cuối kỳ là tự luận hay trắc nghiệm ạ ?', '2017-12-3 1:24:11', 'SV1412698', 'L08', 'CH2065', 'L86858');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH011', 'Câu hỏi', '', '2017-12-12 23:00:59', 'SV1713455', 'A01-B', 'EN2001', 'L45454');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH012', 'Sai tên', 'Thầy ơi, trong danh sách tên em bị sai. Hà chứ không phải là Ha thầy ơi.', '2017-12-3 6:13:03', 'SV1713455', 'A01-B', 'EN2001', 'L45454');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH013', 'Cấp tài khoản', 'Thầy ơi, tài khoản sakai của em vẫn chưa được add vào môn. MSSV của em là…', '2017-12-10 5:45:03', 'SV1210065', 'A02', 'CO2001', 'L56565');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH014', 'Hỏi bài', 'Cho em hỏi là câu số 1 trong đề em giải như thế này đúng không ạ ?', '2017-12-4 23:23:23', 'SV1313648', 'L03', 'MA3041', 'L78787');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH015', 'Tư vấn', 'Thầy ơi, em nên chọn giải pháp php hay js cho bài tập số 1 ạ ?', '2017-12-1 12:25:59', 'SV1412501', 'A04', 'ME4435', 'L98989');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH016', 'Danh sách nhóm', 'Thầy ơi, cho tụi em danh sách nhóm thuyết trình.', '2017-12-10 8:20:15', 'SV1310034', 'L09', 'EE2003', 'L12121');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH017', 'Xin gia hạn', 'Thầy ơi thầy có thể gia hạn bài tập lớn thêm 1 tuần được không ạ ?', '2017-12-2 2:30:44', 'SV1210142', 'L02-C', 'MA2004', 'L16161');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH018', 'Nộp bài', 'Bài của nhóm em lớn hơn 8MB nên các em gửi cho thầy  link để download btl: http://abcxyz.com', '2017-12-4 1:15:50', 'SV1410003', 'L09', 'MT1003', 'L45677');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH019', 'Học bù', 'Thầy ơi, ngày 16-3 em không thể đi học bù vì bị trùng lịch môn khác. Em có thể đi vào ngày khác được không ạ ?', '2017-12-4 1:35:45', 'SV1313648', 'L09', 'MT1003', 'L45677');
INSERT INTO cau_hoi(id_cau_hoi, tieu_de, noi_dung, thoi_gian, id_nguoi_tao, id_lop_mon_hoc, id_mon_hoc, id_lop) VALUES ('CH020', 'Tuần dự trữ', 'Thầy ơi, mình có cần đi học bù vào tuần dữ trự không ?', '2017-12-13 11:33:59', 'SV1711658', 'L09', 'MT1003', 'L45677');

# Insert hoc
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1611548', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1210065', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1410245', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1410001', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1410348', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L01-A', 'CO2003', 'SV1410003', 'HK171');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L04', 'ME3233', 'SV1410003', 'HK172');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L04', 'ME3233', 'SV1713454', 'HK172');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L04', 'IM2011', 'SV1612489', 'HK172');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L06', 'TR4049', 'SV1512544', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L06', 'TR4049', 'SV1511453', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L06', 'TR4049', 'SV1710601', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L08', 'CI3007', 'SV1513215', 'HK151');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L08', 'CI3007', 'SV1711658', 'HK151');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L08', 'CH2065', 'SV1512479', 'HK151');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L08', 'CH2065', 'SV1412698', 'HK151');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A01-B', 'EN2001', 'SV1713455', 'HK152');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A01-B', 'EN2001', 'SV1412500', 'HK152');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A01-B', 'EN2001', 'SV1313648', 'HK152');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A02', 'CO2001', 'SV1410245', 'HK162');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A02', 'CO2001', 'SV1210065', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L03', 'MA3041', 'SV1313648', 'HK141');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('A04', 'ME4435', 'SV1412501', 'HK173');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L09', 'EE2003', 'SV1310034', 'HK153');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L02-C', 'MA2004', 'SV1210142', 'HK162');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L09', 'MT1003', 'SV1410003', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L09', 'MT1003', 'SV1410348', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L09', 'MT1003', 'SV1313648', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L09', 'MT1003', 'SV1711658', 'HK161');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L03', 'MA3041', 'SV1210142', 'HK141');										
INSERT INTO hoc(id_lop_mon_hoc, id_mon_hoc, id_sinh_vien, id_hoc_ky) VALUES ('L02-C', 'MA2004', 'SV1310034', 'HK162');										

# Insert hoc_ky
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK141');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK142');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK143');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK151');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK152');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK153');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK161');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK162');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK163');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK171');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK172');				
INSERT INTO hoc_ky(id_hoc_ky) VALUES ('HK173');				

# Insert noi_dung_duong_dan
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD001', 'L25352', 1, 'https://www.facebook.com/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD001', 'L25352', 2, 'http://truyentranh.net/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD001', 'L25352', 3, 'https://mangazuki.co/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD002', 'L25352', 1, 'https://www.google.com.vn/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD003', 'L63462', 1, 'http://e-learning.hcmut.edu.vn/login/index.php');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD003', 'L63462', 2, 'http://tridang.info/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD004', 'L63463', 1, 'https://tinhte.vn/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD006', 'L45677', 1, 'https://tinhte.vn/threads/khung-xuong-tro-luc-tuong-lai-cua-nhung-nguoi-lao-dong-tay-chan.2751628/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD007', 'L98989', 1, 'https://translate.google.com/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD008', 'L12121', 1, 'http://mybk.hcmut.edu.vn/my/index.action');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD009', 'L16161', 1, 'https://codebeautify.org/csv-to-sql-converter');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD009', 'L16161', 2, 'https://stackoverflow.com/questions/9907210/mysql-date-formats-difficulty-inserting-a-date');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD009', 'L16161', 3, 'https://codepen.io/jakealbaugh/post/regex-in-sublime-text');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD010', 'L98654', 1, 'http://www.giaiphapexcel.com/diendan/threads/t%E1%BB%B1-%C4%91%E1%BB%99ng-ki%E1%BB%83m-tra-d%E1%BB%AF-li%E1%BB%87u-tr%C3%B9ng-v%C3%A0-t%C3%B4-m%C3%A0u.39128/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD011', 'L98654', 1, 'http://excel.webkynang.vn/cach-tim-du-lieu-trung-nhau-trong-excel-loc-gia-tri-trung-trong-excel-2003-2007-2010/');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD012', 'L78787', 1, 'https://www.cfd-online.com/Forums/openfoam-installation/181981-openfoam-plus-accessing-root-account-via-docker.html');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD013', 'L67676', 1, 'https://drive.google.com/file/d/0B6mcQXftl28acUhmSnNBbVZUQ2M/view');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD014', 'L67676', 1, 'https://www.dropbox.com/google/authcallback?state=AA8HeJ_KUrqVJh4EzDHEHoxQn7qNMWktcr_juMs6wWz8QX6_aAreHU7K1NyITKphtjKPmJk3W00Rh1EVnZCbfqUMtjbLIwT4AmKl8Pot9dgE6_PepGsNRBaeijfloM-EfAuSsY1PB0yvcrTXDhmDHvu8vdKvlOB0XQ6vqUBpba2AqSB89RGcjee77GjkjHV4fkWtIYHlnO9isocjqSj2y6j492iHYBACAIJUCNiu2aQLJwGppSkNdUX8GnKOeaHL1DsGVfdqJxvOb0YtXa0vUSYeo8IdcIzmvvjj5KbZ6rsgoBBgVm2Y0T1RGhLD-w3X3IQOCes_ojeFDCR9TBQTCK7M-3TpsJgZ3csFxpkZx0h-7lRMOiAAegWuF65ZhmQqY-09l6wpQsrryBgNNSHNoxkanLSlGEePN7QG0GRpn-fXJg&code=4/d215mALcvxpTmtjvSGP26x_U2L-htvbq5j8RPPPfjLY&scope=https://www.google.com/m8/feeds+https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile#');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD015', 'L25352', 1, 'https://www.lazada.vn/motorola-moto-c-3g-8gb-den-hang-phan-phoi-chinh-thuc-15993364.html?affiliate_name=VN_Accesstradevn&offer_id=511&spm=a2o4n.campaign.products-list.14.440a98a2PQzp6A&offer_name=VN+-+PB+Deeplink+Generator&affiliate_id=110188&transaction_id=102e6a8122e0f9652b4f6f2091bad4&aff_source=4567650848340131670');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD016', 'L98978', 1, 'https://arxiv.org/pdf/1702.05513.pdf');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD017', 'L86858', 1, 'https://ipv4.google.com/sorry/index?continue=https://www.google.com/search%3Fq%3Db%25E1%25BB%258F%2Bd%25E1%25BA%25A5u%2Btrong%2Bexcel%26ie%3Dutf-8%26oe%3Dutf-8%26client%3Dfirefox-b-ab%26gfe_rd%3Dcr%26dcr%3D0%26ei%3DQIkvWtimEsHC8ge_1ZqwAQ&q=EgRxoSN2GOjRvtEFIhkA8aeDSzUN59fU9gT8xZJc5BOrtqHIE3JXMgFy');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD018', 'L63462', 1, 'http://www.colfax-intl.com/nd/xeonphi/book.aspx?DXP');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD019', 'L17171', 1, 'http://www.tp-link.com/il/download/TL-WR740N_V4.html');
INSERT INTO noi_dung_duong_dan(id_chu_de, id_lop, id_duong_dan, duong_dan) VALUES ('CD020', 'L78787', 1, 'https://www.youtube.com/');

# Insert diem
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1611548','GK',9.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1210065','CK',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1611548','CK',8.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1611548','TN',10);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1210065','GK',7);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1410245','CK',6.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1410001','CK',4.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1410348','CK',3);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L01-A','CO2003','HK171','SV1410003','CK',5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L04','ME3233','HK172','SV1410003','CK',7);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L04','ME3233','HK172','SV1713454','CK',8);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L04','IM2011','HK172','SV1612489','KT',10);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L06','TR4049','HK161','SV1512544','GK',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L06','TR4049','HK161','SV1511453','GK',4.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L06','TR4049','HK161','SV1710601','CK',8.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L08','CI3007','HK151','SV1513215','TN',7.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L08','CI3007','HK151','SV1711658','TN',9);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L08','CH2065','HK151','SV1512479','KT',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L08','CH2065','HK151','SV1412698','TN',10);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A01-B','EN2001','HK152','SV1713455','CK',9.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A01-B','EN2001','HK152','SV1713455','TN',5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A01-B','EN2001','HK152','SV1313648','GK',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A02','CO2001','HK162','SV1410245','CK',4.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A02','CO2001','HK161','SV1210065','CK',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L03','MA3041','HK141','SV1313648','CK',8.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('A04','ME4435','HK173','SV1412501','TN',4);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L09','EE2003','HK153','SV1310034','TN',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L02-C','MA2004','HK162','SV1210142','CK',7.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L09','MT1003','HK161','SV1410003','KT',8);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L09','MT1003','HK161','SV1410348','KT',5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L09','MT1003','HK161','SV1313648','CK',5.5);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L09','MT1003','HK161','SV1711658','GK',6);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L03','MA3041','HK141','SV1210142','TN',10);
INSERT INTO diem(id_lop_mon_hoc,id_mon_hoc,id_hoc_ky,id_sinh_vien,diem,so_diem) VALUES ('L02-C','MA2004','HK162','SV1310034','GK',9);


# Insert phan_tram_diem
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CO2003','CK',50);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CO2003','GK',30);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CO2003','TN',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('ME3233','CK',40);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('IM2011','KT',10);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('TR4049','GK',30);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('TR4049','CK',70);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CI3007','TN',10);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CH2065','KT',10);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CH2065','TN',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('EN2001','GK',30);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('EN2001','TN',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('EN2001','CK',50);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('CO2001','CK',60);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MA3041','CK',60);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('ME4435','TN',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('EE2003','TN',30);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MA2004','CK',40);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MA2004','GK',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MT1003','KT',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MT1003','CK',60);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MT1003','GK',20);
INSERT INTO phan_tram_diem(id_mon_hoc,diem,phan_tram_diem) VALUES ('MA3041','TN',40);

# Insert Khoa_co_chuong_trinh_hoc
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','CK');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','DC');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','DD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','GT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','HH');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','UD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','MT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','VL');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','XD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','MO');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('DHCQ','QL');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CDCQ','BD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CH','MT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CH','CK');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CH','HH');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CH','VL');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('KSTN','CK');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('KSTN','MT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('KSTN','HH');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('KSTN','DD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CTLKQT','DD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CTLKQT','MT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CTLKQT','QL');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('CTLKQT','HH');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('VHVL','MT');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('VHVL','MO');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('VHVL','XD');
INSERT INTO khoa_co_chuong_trinh_hoc(id_chuong_trinh_hoc,id_khoa) VALUES ('VHVL','VL');

# Insert tra_loi
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('SV1210065','CH001','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0001','CH001','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('SV1410245','CH001','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0135','CH002','L04','ME3233');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0001','CH003','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0001','CH004','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0001','CH005','L01-A','CO2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV1355','CH006','L04','IM2011');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV8907','CH007','L06','TR4049');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('SV1511453','CH007','L06','TR4049');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV8907','CH008','L06','TR4049');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('SV1512479','CH010','L08','CH2065');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV1234','CH010','L08','CH2065');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('SV1313648','CH012','A01-B','EN2001');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV1268','CH012','A01-B','EN2001');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0002','CH013','A02','CO2001');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV8903','CH016','L09','EE2003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV1565','CH017','L02-C','MA2004');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0005','CH018','L09','MT1003');
INSERT INTO tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc) VALUES ('GV0005','CH019','L09','MT1003');

# Insert lan_tra_loi
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('SV1210065','CH001','L01-A','CO2003',1,'Thầy ơi còn sai câu 20 nữa.',STR_TO_DATE('2017-12-6 1:30:32','%Y-%m-%d %H:%i:%s'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0001','CH001','L01-A','CO2003',2,'Thầy đã sửa lại. Các em kiểm tra lại giúp thầy.',STR_TO_DATE('2017-12-6 2:15:32','%Y-%m-%d %H:%i:%s'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('SV1410245','CH001','L01-A','CO2003',3,'Dạ em cảm ơn thầy.',STR_TO_DATE('2017-12-7 8:02:14','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0135','CH002','L04','ME3233',1,'Deadline thầy đã đăng lên.',STR_TO_DATE('2017-12-7 10:36:50','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0001','CH003','L01-A','CO2003',1,'Em liên hệ với các nhóm còn thiếu',STR_TO_DATE('2017-12-8 7:20:13','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0001','CH004','L01-A','CO2003',1,'Thầy đã chỉnh lại.',STR_TO_DATE('2017-12-8 8:12:06','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0001','CH005','L01-A','CO2003',1,'Em có thể hỏi thầy trên lớp thực hành.',STR_TO_DATE('2017-12-8 10:54:25','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV1355','CH006','L04','IM2011',1,'Em góp ý cho thầy để thầy chỉnh sửa phù hợp hơn.',STR_TO_DATE('2017-12-6 6:50:08','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV8907','CH007','L06','TR4049',1,'Thầy đã gửi email cho nhóm.',STR_TO_DATE('2017-12-10 8:39:42','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('SV1511453','CH007','L06','TR4049',2,'Thầy ơi gửi cho em nữa. Em cảm ơn ạ.',STR_TO_DATE('2017-12-10 10:11:52','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV8907','CH008','L06','TR4049',1,'Ok em.',STR_TO_DATE('2017-12-11 8:13:43','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('SV1512479','CH010','L08','CH2065',1,'Cho em hỏi luôn là mình kiểm tra trong bao lâu ạ ?',STR_TO_DATE('2017-12-5 8:45:17','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV1234','CH010','L08','CH2065',2,'Thầy đã đăng lên trên BKEL.',STR_TO_DATE('2017-12-6 11:39:01','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('SV1313648','CH012','A01-B','EN2001',1,'Em cũng bị sai tên nữa, thầy kiểm tra lại giúp em với. Em cảm ơn thầy ạ.',STR_TO_DATE('2017-12-4 9:55:03','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV1268','CH012','A01-B','EN2001',2,'Thầy đã kiểm tra lại.',STR_TO_DATE('2017-12-5 7:22:01','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0002','CH013','A02','CO2001',1,'Để thầy kiểm tra lại.',STR_TO_DATE('2017-12-12 9:33:03','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV8903','CH016','L09','EE2003',1,'Thầy đã gửi cho lớp trưởng, các em liên hệ với bạn để có thêm thông tin.',STR_TO_DATE('2017-12-13 12:03:15','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV1565','CH017','L02-C','MA2004',1,'Thầy đã gia hạn thêm 1 tuần.',STR_TO_DATE('2017-12-3 1:55:56','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0005','CH018','L09','MT1003',1,'Thầy đã nhận được.',STR_TO_DATE('2017-12-4 3:35:18','%Y-%m-%d %r'));
INSERT INTO lan_tra_loi(id_nguoi_tra_loi,id_cau_hoi,id_lop_mon_hoc,id_mon_hoc,lan_tra_loi,noi_dung,thoi_gian) VALUES ('GV0005','CH019','L09','MT1003',1,'Em có thể học bù vào thứ 6 tuần sau.',STR_TO_DATE('2017-12-4 4:44:27','%Y-%m-%d %r'));

# Insert dang_ky
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410001','NK0001');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410348','NK0001');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410003','NK0001');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1310015','NK0001');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1512544','NK0001');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1612489','NK0002');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1713454','NK0002');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410001','NK0007');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1612753','NK0007');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410003','NK0007');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410001','NK0015');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1611548','NK0015');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1513215','NK0015');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1412500','NK0015');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1412698','NK0020');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1711658','NK0019');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1512479','NK0017');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1511453','NK0005');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410003','NK0006');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1410003','NK0018');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1412500','NK0012');
INSERT INTO dang_ky(id_sinh_vien,id_hoat_dong) VALUES ('SV1611548','NK0012');

# Insert huong_dan
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV8909','NK0001');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV7896','NK0002');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV8907','NK0003');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV8907','NK0004');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1234','NK0005');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1568','NK0006');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV4890','NK0007');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1268','NK0008');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1258','NK0009');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1565','NK0010');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0001','NK0011');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0002','NK0012');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0003','NK0013');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0004','NK0014');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0005','NK0015');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV0135','NK0016');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV5699','NK0017');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV5625','NK0018');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1355','NK0019');
INSERT INTO huong_dan(id_giang_vien,id_hoat_dong) VALUES ('GV1874','NK0020');

###############
# FOREIGN KEY #
###############

### Duy

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

### Tuấn

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

###################
##    TRIGGER    ##
###################

# Nguoi(id_nguoi)
DROP TRIGGER IF EXISTS before_insert_id_nguoi;
DELIMITER $$
CREATE TRIGGER before_insert_id_nguoi 
    BEFORE INSERT ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.id_nguoi NOT LIKE 'SV%' AND NEW.id_nguoi NOT LIKE 'GV%') THEN
	SET msg = "Sai định dạng của id_nguoi";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_id_nguoi;
DELIMITER $$
CREATE TRIGGER before_update_id_nguoi 
    BEFORE UPDATE ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.id_nguoi NOT LIKE 'SV%' AND NEW.id_nguoi NOT LIKE 'GV%') THEN
	SET msg = "Sai định dạng của id_nguoi";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Nguoi(email)
DROP TRIGGER IF EXISTS before_insert_mail;
DELIMITER $$
CREATE TRIGGER before_insert_mail
    BEFORE INSERT ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.mail NOT LIKE '%@%.%') THEN
	SET msg = "Sai định dạng của email";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_mail;
DELIMITER $$
CREATE TRIGGER before_update_mail
    BEFORE UPDATE ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.mail NOT LIKE '%@%.%') THEN
	SET msg = "Sai định dạng của email";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Nguoi(ngay_sinh)
DROP TRIGGER IF EXISTS before_insert_ngay_sinh;
DELIMITER $$
CREATE TRIGGER before_insert_ngay_sinh
    BEFORE INSERT ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(YEAR(NOW()) - YEAR(NEW.ngay_sinh) < 18) THEN
	SET msg = "Tuổi phải lớn hơn 18";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_ngay_sinh;
DELIMITER $$
CREATE TRIGGER before_update_ngay_sinh
    BEFORE UPDATE ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(YEAR(NOW()) - YEAR(NEW.ngay_sinh) < 18) THEN
	SET msg = "Tuổi phải lớn hơn 18";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Diem(so_diem)
DROP TRIGGER IF EXISTS before_insert_so_diem;
DELIMITER $$
CREATE TRIGGER before_insert_so_diem
    BEFORE INSERT ON diem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.so_diem < 0 OR NEW.so_diem > 10) THEN
	SET msg = "Điểm phải nằm trong khoảng từ 0 đến 10";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_so_diem;
DELIMITER $$
CREATE TRIGGER before_update_so_diem
    BEFORE UPDATE ON diem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.so_diem < 0 OR NEW.so_diem > 10) THEN
	SET msg = "Điểm phải nằm trong khoảng từ 0 đến 10";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Diem(phan_tram_diem)
DROP TRIGGER IF EXISTS before_insert_phan_tram_diem;
DELIMITER $$
CREATE TRIGGER before_insert_phan_tram_diem
    BEFORE INSERT ON phan_tram_diem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.phan_tram_diem < 0 OR NEW.phan_tram_diem > 100) THEN
	SET msg = "Phần trăm điểm phải nằm trong khoảng từ 0 đến 100";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_phan_tram_diem;
DELIMITER $$
CREATE TRIGGER before_update_phan_tram_diem
    BEFORE UPDATE ON phan_tram_diem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.phan_tram_diem < 0 OR NEW.phan_tram_diem > 100) THEN
	SET msg = "Phần trăm điểm phải nằm trong khoảng từ 0 đến 100";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Mot giao vien khong duoc chu nhiem 2 lop
DROP TRIGGER IF EXISTS before_insert_id_giang_vien;
DELIMITER $$
CREATE TRIGGER before_insert_id_giang_vien
    BEFORE INSERT ON lop_chu_nhiem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF((SELECT COUNT(*) FROM lop_chu_nhiem WHERE id_giang_vien = NEW.id_giang_vien) > 0) THEN
	SET msg = "Một giảng viên chỉ có thể chủ nhiệm một lớp";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_id_giang_vien;
DELIMITER $$
CREATE TRIGGER before_update_id_giang_vien
    BEFORE UPDATE ON lop_chu_nhiem
    FOR EACH ROW 
BEGIN
DECLARE msg VARCHAR(255);
    IF(((SELECT COUNT(*) FROM lop_chu_nhiem WHERE id_giang_vien = NEW.id_giang_vien) > 0) AND (NEW.id_giang_vien <> OLD.id_giang_vien)) THEN
	SET msg = "Một giảng viên chỉ có thể chủ nhiệm một lớp";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

### Duy

# sinh_vien(khoa)
DROP TRIGGER IF EXISTS before_insert_khoa;
DELIMITER $$
CREATE TRIGGER before_insert_khoa
    BEFORE INSERT ON sinh_vien
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.khoa > YEAR(NOW())) THEN
	SET msg = "Lỗi nhập thời gian Khóa học";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_khoa;
DELIMITER $$
CREATE TRIGGER before_update_khoa
    BEFORE UPDATE ON sinh_vien
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.khoa > YEAR(NOW())) THEN
	SET msg = "Lỗi nhập thời gian Khóa học";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# Nguoi(Sex)
DROP TRIGGER IF EXISTS before_insert_sex;
DELIMITER $$
CREATE TRIGGER before_insert_sex
    BEFORE INSERT ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.sex NOT LIKE 'Nam' AND NEW.sex NOT LIKE 'Nữ') THEN
	SET msg = "Phải nhập đúng 'Nam' hoặc 'Nữ'";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_sex;
DELIMITER $$
CREATE TRIGGER before_update_sex
    BEFORE UPDATE ON Nguoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.sex NOT LIKE 'Nam' AND NEW.sex NOT LIKE 'Nữ') THEN
	SET msg = "Phải nhập đúng 'Nam' hoặc 'Nữ'";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# lop_chu_nhiem(si_so)
DROP TRIGGER IF EXISTS before_insert_si_so;
DELIMITER $$
CREATE TRIGGER before_insert_si_so
    BEFORE INSERT ON lop_chu_nhiem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.si_so = 0) THEN
	SET msg = "Sỉ số lớp chủ nhiệm phải khác 0";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_si_so;
DELIMITER $$
CREATE TRIGGER before_update_si_so
    BEFORE UPDATE ON lop_chu_nhiem
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(NEW.si_so = 0) THEN
	SET msg = "Sỉ số lớp chủ nhiệm phải khác 0";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# cau_hoi(thoi_gian)
DROP TRIGGER IF EXISTS before_insert_thoi_gian;
DELIMITER $$
CREATE TRIGGER before_insert_thoi_gian
    BEFORE INSERT ON cau_hoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(UNIX_TIMESTAMP(NEW.thoi_gian) > UNIX_TIMESTAMP(NOW())) THEN
	SET msg = "Thời gian không hợp lý";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_thoi_gian;
DELIMITER $$
CREATE TRIGGER before_update_thoi_gian
    BEFORE UPDATE ON cau_hoi
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(UNIX_TIMESTAMP(NEW.thoi_gian) > UNIX_TIMESTAMP(NOW())) THEN
	SET msg = "Thời gian không hợp lý";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

# tin_nhan(thoi_gian)
DROP TRIGGER IF EXISTS before_insert_thoi_gian;
DELIMITER $$
CREATE TRIGGER before_insert_thoi_gian
    BEFORE INSERT ON tin_nhan
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(UNIX_TIMESTAMP(NEW.thoi_gian) > UNIX_TIMESTAMP(NOW())) THEN
	SET msg = "Thời gian không hợp lý";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_thoi_gian;
DELIMITER $$
CREATE TRIGGER before_update_thoi_gian
    BEFORE UPDATE ON tin_nhan
    FOR EACH ROW 
BEGIN
	DECLARE msg VARCHAR(255);
    IF(UNIX_TIMESTAMP(NEW.thoi_gian) > UNIX_TIMESTAMP(NOW())) THEN
	SET msg = "Thời gian không hợp lý";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$
DELIMITER ;

###################
##     INDEX     ##
###################
	
CREATE INDEX index_ten_nguoi
ON nguoi(ten);
	
CREATE INDEX index_mail_nguoi
ON nguoi(mail);

CREATE INDEX index_sdt_nguoi
ON nguoi(sdt);

CREATE INDEX index_ten_mon_hoc
ON mon_hoc(ten);

CREATE INDEX index_ten_lop_chu_nhiem
ON lop_chu_nhiem(ten);

CREATE INDEX index_ten_hoat_dong_ngoai_khoa
ON hoat_dong_ngoai_khoa(ten);

CREATE INDEX index_ten_chuong_trinh_hoc
ON chuong_trinh_hoc(ten);

CREATE INDEX index_ten_chu_de
ON chu_de(ten);

CREATE INDEX index_tieu_de_cau_hoi
ON cau_hoi(tieu_de);

#To signal a generic SQLSTATE value, use '45000', which means “unhandled user-defined exception.”

###########
## QUERY ##
###########

############ INNER JOIN ############

#Liệt kê các lớp môn học của sinh viên có mã là "SV1410003";
SELECT 
    h.id_mon_hoc 'Mã môn học',
    mh.ten 'Tên môn học',
    mh.so_tin_chi 'Số tín chỉ',
    h.id_lop_mon_hoc 'Lớp môn học',
    h.id_hoc_ky 'Học kỳ'
FROM
    hoc AS h
        JOIN
    mon_hoc AS mh ON h.id_mon_hoc = mh.id_mon_hoc
WHERE
    h.id_sinh_vien = 'SV1410003';

#Liệt kê tên của tất cả các chủ đề trong lớp L04 của môn Tiếp thị logistics.
SELECT 
    cd.ten 'Tên chủ đề', nddd.duong_dan 'Đường dẫn'
FROM
    chu_de AS cd
        JOIN
    lop_mon_hoc AS lmh ON cd.id_lop = lmh.id_lop
        JOIN
    mon_hoc AS mh ON lmh.id_mon_hoc = mh.id_mon_hoc
        JOIN
    noi_dung_duong_dan AS nddd ON cd.id_chu_de = nddd.id_chu_de
WHERE
    lmh.id_lop_mon_hoc = 'L04'
        AND mh.ten = 'Tiếp thị logistics';

# Xem điểm cuối kỳ của tất cả sinh viên của môn "Lập trình web" thuộc lớp L01-A"
SELECT 
    mh.ten 'Tên môn học',
    d.id_sinh_vien 'Mã sinh viên',
    d.diem 'Loại điểm',
    d.so_diem 'Điểm'
FROM
    diem AS d
        JOIN
    mon_hoc AS mh ON d.id_mon_hoc = mh.id_mon_hoc
WHERE
    mh.ten = 'Lập trình Web'
        AND d.diem = 'CK'
        AND d.id_lop_mon_hoc = 'L01-A'
        AND d.id_hoc_ky = 'HK171';

############ OUTER JOIN ############

# Danh sách sinh viên tham gia hoạt động ngoại khóa và sinh viên không tham gia hoạt động ngoại khóa
SELECT 
    id_sv 'Mã sinh viên',
    id_khoa 'Khoa',
    id_chuong_trinh_hoc 'Chương trình học',
    id_lop_chu_nhiem 'Lớp chủ nhiệm',
    khoa 'Khóa học',
    ten 'Hoạt động ngoại khóa'
FROM
    sinh_vien
        LEFT OUTER JOIN
    dang_ky ON id_sv = id_sinh_vien
        LEFT OUTER JOIN
    hoat_dong_ngoai_khoa ON id_hoat_dong = id_hoat_dong_ngoai_khoa;

# Đếm xem 1 sinh viên đã tham gia bao nhiêu hoạt động ngoại khóa.
SELECT 
    sinh_vien.id_sv 'Mã sinh viên', COUNT(dang_ky.id_sinh_vien) 'Số hoạt động ngoại khóa'
FROM
    sinh_vien
        LEFT JOIN
    dang_ky ON sinh_vien.id_sv = dang_ky.id_sinh_vien
GROUP BY sinh_vien.id_sv;

# Liệt kê tất cả các giảng viên và môn mà họ dạy. nếu ko có dạy môn nào thì để null. cho 1 khoa "MT"
SELECT 
    nguoi.ten 'Họ và Tên',
    giang_vien.id_gv 'Mã giảng viên',
    mon_hoc.id_mon_hoc 'Mã môn học',
    mon_hoc.ten 'Tên môn học'
FROM
    mon_hoc
        JOIN
    lop_mon_hoc ON mon_hoc.id_mon_hoc = lop_mon_hoc.id_mon_hoc
        RIGHT JOIN
    giang_vien ON giang_vien.id_gv = lop_mon_hoc.id_giang_vien
        JOIN
    nguoi ON giang_vien.id_gv = nguoi.id_nguoi
WHERE
    giang_vien.id_khoa = 'MT'
GROUP BY giang_vien.id_gv;

############ AGGREGATE FUNCTIONS AND GROUPING ############

# Đếm số lớp môn học của các môn trong 1 học kỳ cụ thể( HK162)
SELECT 
    id_mon_hoc 'Mã môn học',
    COUNT(*) 'Số lớp môn học'
FROM
    lop_mon_hoc
WHERE
    id_hoc_ky = 'HK162'
GROUP BY id_mon_hoc;

# Danh sách thống kê tổng số tín chỉ của sinh viên A đăng ký qua các học kì - sắp xếp theo chiều giảm dần
SET @MSSV = 'SV1313648';
SELECT 
    id_sinh_vien 'Mã sinh viên',
    id_hoc_ky 'Học kỳ',
    COUNT(id_hoc_ky) 'Tổng số môn học đã đăng ký',
    SUM(so_tin_chi) 'Tổng số tín chỉ'
FROM
    hoc
        JOIN
    mon_hoc
WHERE
    hoc.id_mon_hoc = mon_hoc.id_mon_hoc
        AND hoc.id_sinh_vien = @MSSV
GROUP BY id_hoc_ky;

# Điểm trung bình cuối kỳ của môn học Lập trình web
SELECT 
    mon_hoc.ten 'Tên môn học',
    (SELECT 
            AVG(so_diem)
        FROM
            diem
        WHERE
            id_sinh_vien = diem.id_sinh_vien) 'Điểm trung bình cuối kỳ'
FROM
    diem
        JOIN
    mon_hoc ON diem.id_mon_hoc = mon_hoc.id_mon_hoc
WHERE
    (mon_hoc.ten = 'Lập trình web'
        AND diem.diem = 'CK'
        AND diem.id_hoc_ky = 'HK171')
GROUP BY 'Điểm trung bình cuối kỳ';

# Đếm số lượng sinh viên tham gia các hoạt động ngoại khóa ở 1 học kỳ cụ thể (HK171)
SELECT 
    hdnk.id_hoat_dong_ngoai_khoa 'Mã hoạt động ngoại khóa',
    hdnk.ten 'Tên hoạt động ngoại khóa',
    hdnk.id_hoc_ky 'Học kỳ',
    COUNT(*) AS 'Số lượng sinh viên đăng ký'
FROM
    hoat_dong_ngoai_khoa AS hdnk
        JOIN
    dang_ky AS dk ON hdnk.id_hoat_dong_ngoai_khoa = dk.id_hoat_dong
WHERE
    hdnk.id_hoc_ky = 'HK171'
GROUP BY hdnk.id_hoat_dong_ngoai_khoa;

############ SUBQUERY ############

# Liệt kê tất cả sinh viên khoa Máy Tính với id_khoa = 'MT'
SELECT 
    ten 'Họ và Tên',
    ngay_sinh 'Ngày sinh',
    dia_chi 'Địa chỉ',
    sdt 'SĐT',
    mail 'Mail',
    sex 'Giới tính'
FROM
    nguoi
WHERE
    id_nguoi IN (SELECT 
            id_sv
        FROM
            sinh_vien
        WHERE
            id_khoa = 'MT');

# Liệt kê tất cả môn học thuộc khoa Khoa học và kỹ thuật máy tính và số tín chỉ lớn hơn 4
SET @ten_khoa = 'Khoa học và kỹ thuật máy tính';
SELECT 
    id_mon_hoc 'Mã môn học',
    ten 'Tên môn học',
    so_tin_chi 'Số tín chỉ',
    so_tiet 'Số tiết',
    id_chuong_trinh_hoc 'Mã chương trình học'
FROM
    mon_hoc
WHERE
    id_khoa = (SELECT 
            id_khoa
        FROM
            khoa
        WHERE
            ten_khoa = @ten_khoa)
        AND so_tin_chi > 4;

# Liệt kê tất cả Nữ giảng viên
SELECT 
    ten 'Họ và Tên',
    ngay_sinh 'Ngày sinh',
    dia_chi 'Địa chỉ',
    sdt 'SĐT',
    mail 'Mail',
    sex 'Giới tính'
FROM
    nguoi
WHERE
    id_nguoi IN (SELECT 
            id_gv
        FROM
            giang_vien)
        AND sex = 'Nữ';

##########
#  USER  #
##########

################
#  USER ADMIN  #
################

# Tạo user admin, gán quyền root cho user admin
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';


################
#    USER SV   #
################

# Tạo user cho sinh viên SV1410003


#xem tat ca cac diem
drop view if exists ass2.sv1410003_diem; 
create view ass2.sv1410003_diem as select diem.id_mon_hoc, mon_hoc.ten, diem.id_lop_mon_hoc, diem.diem, diem.so_diem
						from ass2.diem join ass2.mon_hoc on diem.id_mon_hoc = mon_hoc.id_mon_hoc where id_sinh_vien='SV1410003';


#xem thong tin ca nhan cua ban than
drop view if exists ass2.sv1410003_info; 
create view ass2.sv1410003_info as select * from ass2.nguoi join ass2.sinh_vien on nguoi.id_nguoi = sinh_vien.id_sv where sinh_vien.id_sv = 'SV1410003';


#xem tat ca chu de
drop view if exists ass2.sv1410003_chu_de; 
create view ass2.sv1410003_chu_de as
SELECT  lop_mon_hoc.id_lop_mon_hoc, lop_mon_hoc.id_mon_hoc, mon_hoc.ten as ten_mon_hoc , lop_mon_hoc.id_hoc_ky, nguoi.ten as ten_giang_vien, chu_de.ten as ten_chu_de, noi_dung_duong_dan.duong_dan

FROM ass2.lop_mon_hoc join ass2.chu_de on lop_mon_hoc.id_lop = chu_de.id_lop
			join ass2.hoc on (	hoc.id_lop_mon_hoc = lop_mon_hoc.id_lop_mon_hoc
								and hoc.id_hoc_ky = lop_mon_hoc.id_hoc_ky
                                and hoc.id_mon_hoc = lop_mon_hoc.id_mon_hoc)
			join ass2.noi_dung_duong_dan on (chu_de.id_chu_de = noi_dung_duong_dan.id_chu_de)
            join ass2.nguoi on nguoi.id_nguoi = lop_mon_hoc.id_giang_vien
            join ass2.mon_hoc on mon_hoc.id_mon_hoc = lop_mon_hoc.id_mon_hoc
			where hoc.id_sinh_vien = 'SV1410003'
                                ;
                                
#xem tat ca hoat dong                                
drop view if exists ass2.sv1410003_hoat_dong;
create view ass2.sv1410003_hoat_dong as
select ass2.hoat_dong_ngoai_khoa.ten as ten_hoat_dong, ass2.hoat_dong_ngoai_khoa.id_hoc_ky  as hoc_ky
from ass2.dang_ky
join ass2.hoat_dong_ngoai_khoa on ass2.dang_ky.id_hoat_dong = ass2.hoat_dong_ngoai_khoa.id_hoat_dong_ngoai_khoa
where id_sinh_vien = 'SV1410003';



CREATE USER 'SV1410003'@'localhost' IDENTIFIED BY '1234';
grant select on ass2.sv1410003_diem to 'SV1410003'@'localhost';
grant select on ass2.sv1410003_info to 'SV1410003'@'localhost';
grant select on ass2.sv1410003_chu_de to 'SV1410003'@'localhost';
grant select on ass2.sv1410003_hoat_dong to 'SV1410003'@'localhost';


################
#  USER GV 		 #
################

# Tạo user cho giảng viên GV8907


create view ass2.GV8907_thong_tin_hoat_dong as
select hoat_dong_ngoai_khoa.ten as ten_hoat_dong, hoat_dong_ngoai_khoa.id_hoc_ky as hoc_ky
from ass2.huong_dan
join ass2.hoat_dong_ngoai_khoa on ass2.huong_dan.id_hoat_dong = ass2.hoat_dong_ngoai_khoa.id_hoat_dong_ngoai_khoa
where ass2.huong_dan.id_giang_vien = 'GV8907';




create view ass2.GV8907_thong_tin_lop_chu_nhiem as
select ass2.lop_chu_nhiem.ten as ten_lop, ass2.sinh_vien.id_sv, ass2.nguoi.ten, ass2.nguoi.ngay_sinh, ass2.nguoi.dia_chi, ass2.nguoi.sdt, ass2.nguoi.sex, ass2.nguoi.mail
from ass2.lop_chu_nhiem
join ass2.sinh_vien on ass2.lop_chu_nhiem.id_lop_chu_nhiem = ass2.sinh_vien.id_lop_chu_nhiem
join ass2.nguoi on ass2.sinh_vien.id_sv = ass2.nguoi.id_nguoi
where ass2.lop_chu_nhiem.id_giang_vien = 'GV8907';


create view ass2.GV8907_diem as
select diem.id_lop_mon_hoc, diem.id_mon_hoc, diem.id_hoc_ky, diem.id_sinh_vien, diem.diem, diem.so_diem
from ass2.diem
join ass2.lop_mon_hoc on (diem.id_lop_mon_hoc = lop_mon_hoc.id_lop_mon_hoc
						and diem.id_mon_hoc = lop_mon_hoc.id_mon_hoc
                        and diem.id_hoc_ky = lop_mon_hoc.id_hoc_ky)
where lop_mon_hoc.id_giang_vien = 'GV8907';



#thong tin ca nhan
create view ass2.GV8907_info as
select * from ass2.nguoi where nguoi.id_nguoi = 'GV8907';


CREATE USER 'GV8907'@'localhost' IDENTIFIED BY '1234';
grant select on ass2.GV8907_info to 'GV8907'@'localhost';
grant select, update on ass2.gv8907_diem to 'GV8907'@'localhost';
grant select on ass2.GV8907_thong_tin_lop_chu_nhiem to 'GV8907'@'localhost';
grant select on ass2.GV8907_thong_tin_hoat_dong to 'GV8907'@'localhost';


SELECT id_sinh_vien, (SELECT AVG(so_diem) FROM diem WHERE id_sinh_vien = diem.id_sinh_vien) diem_trung_binh FROM diem join mon_hoc on diem.id_mon_hoc = mon_hoc.id_mon_hoc where (mon_hoc.ten='Lập trình web' and diem.diem='CK' and diem.id_hoc_ky='HK171')  GROUP BY id_sinh_vien;

# Đăng nhập vào mysql bằng một tài khoản từ cmd
# mysql -u GV8907 -p

# USER : GV8907

select * from ass2.diem;	# Không chạy vì ko có quyền sellect trên bảng điểm, chỉ có quyền insert trên bảng diem.
select * from ass2.GV8907_info; 
update ass2.GV8907_info set sdt='0000' where id_nguoi='GV8907'; # Cái này ko chạy vì giảng viên ko được update thông tin của mình
update ass2.gv8907_diem set so_diem=2.5 where id_sinh_vien='SV1512544'; # Cái này chạy vì giảng viên được update điểm của sinh viên

# USER: SV1410003

select * from ass2.nguoi; # ko chạy vì ko có quyền trên bảng nguoi.
SELECT * FROM ass2.sv1410003_diem; # chạy vì có quyền select;
update ass2.gv8907_diem set so_diem=2.5 where id_sinh_vien='SV1512544';