
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