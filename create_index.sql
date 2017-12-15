
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
