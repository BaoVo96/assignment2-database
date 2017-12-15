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
