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