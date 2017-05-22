--Phần tạo user với vai trò dưới quyền sa-----
--CREATE USER vai trò dba---
CREATE USER LABBT IDENTIFIED BY "tqhba29041995"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;
--cấp quyền với trò là dba----
GRANT ALL PRIVILEGES TO LABBT WITH ADMIN OPTION;
GRANT dba, CONNECT TO LABBT WITH ADMIN OPTION;
--bắt đầu tạo bảng và cấp quyền thực hiện các yêu cầu-----
------------------------------------------------------------------------------------------------------

-----CREATE USER----
CREATE USER BS1412123 IDENTIFIED BY "123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER BS1412124 IDENTIFIED BY "123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER BS1412125 IDENTIFIED BY "123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER BS1012123 IDENTIFIED BY "123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

--CREATE ROLE--
CREATE ROLE GIAMDOC;
CREATE ROLE TRUONGPHONG;
CREATE ROLE TRUONGCHINHANH;
CREATE ROLE TRUONGDUAN;
---cấp quyền cho role---
GRANT SELECT ON DUAN TO GIAMDOC;
GRANT CONNECT TO GIAMDOC;

GRANT UPDATE, INSERT ON DUAN TO TRUONGPHONG;
GRANT UPDATE ON PHONGBAN TO TRUONGPHONG;
GRANT CONNECT TO TRUONGPHONG;

GRANT UPDATE ON PHONGBAN TO TRUONGDUAN;
GRANT CONNECT TO TRUONGDUAN;

GRANT UPDATE ON PHONGBAN TO TRUONGCHINHANH;
GRANT CONNECT TO TRUONGCHINHANH;

---cấp quyền từ ROLE sang user----
GRANT CREATE SESSION TO BS1012123 WITH ADMIN OPTION;
GRANT GIAMDOC TO BS1012123;

GRANT CREATE SESSION TO BS1412123 WITH ADMIN OPTION;
GRANT TRUONGPHONG TO BS1412123;

GRANT CREATE SESSION TO BS1412124 WITH ADMIN OPTION;
GRANT TRUONGCHINHANH TO BS1412124;

GRANT CREATE SESSION TO BS1412125 WITH ADMIN OPTION;
GRANT TRUONGDUAN TO BS1412125;
-------------------------------------------------------------

---test-----
---- Giám đốc được phép xem thông tin dự án gồm 
----(mã dự án, tên dự án, kinh phí, tên phòng chủ trì, tên chi nhánh chủ trì, tên trưởng dự án và tổng chi)
SELECT * FROM LABBT.DUAN;

----- Chỉ trưởng phòng được phép cập nhật và thêm thông tin vào dự án

UPDATE LABBT.DUAN
SET KINHPHI = '7000'
WHERE MADA = 'DA01' AND KINHPHI = '6000';

--thêm thông tin dự án
INSERT INTO LABBT.DUAN VALUES ('DA8','Dự Án 8', '5000', 'PB02', 'CN03', 'BS1412124', '6000');


-----------------------------------------------------------------------------------------------------

BEGIN
SA_SYSDBA.CREATE_POLICY (
policy_name => 'ACCESS_DUAN',
column_name => 'OLS_COLUMN');
END;
/

GRANT ACCESS_DUAN_DBA TO BS1012123;
-- Package dùng để tạo ra các thành phần của nhãn
GRANT EXECUTE ON sa_components TO BS1012123;

-- Package dùng để tạo các nhãn
GRANT EXECUTE ON sa_label_admin TO BS1012123;

-- Package dùng để gán chính sách cho các table/schema
GRANT EXECUTE ON sa_policy_admin TO BS1012123;

GRANT ACCESS_DUAN_DBA TO LABBT;

-- Package dùng để gán các label cho user
GRANT EXECUTE ON sa_user_admin TO LABBT;


BEGIN
sa_sysdba.create_policy
(policy_name    => 'Policy');
END;
/

BEGIN
sa_components.create_level
(policy_name   => 'Policy',
long_name      => 'foo',
short_name     => 'bar',
level_num      => 9);
END;
/




