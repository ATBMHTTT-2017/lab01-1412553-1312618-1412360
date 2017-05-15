--CREATE USER vai trò dba---
CREATE USER ATBM1 IDENTIFIED BY "tqhba29041995"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;
--cap quyen voi vai trò là dba----
GRANT ALL PRIVILEGES TO ATBM1 WITH ADMIN OPTION;
GRANT dba, CONNECT TO ATBM1;

--cấp quyền cho cho user---
GRANT CREATE SESSION TO ATBM1 WITH ADMIN OPTION;
GRANT CREATE TABLE TO ATBM1 WITH ADMIN OPTION;
GRANT CREATE VIEW TO ATBM1 WITH ADMIN OPTION;
GRANT CREATE ANY PROCEDURE TO ATBM1 WITH ADMIN OPTION;

-------------------------------------------------------------
-----Script------
CREATE TABLE NHANVIEN
(
  MANV VARCHAR(20) NOT NULL,
  TENNV VARCHAR(20),
  NGSINH VARCHAR(20),
  DIACHI VARCHAR(50),
  GIOITINH VARCHAR(20),
  MAPB VARCHAR(20),
  MACN VARCHAR(20),
  PRIMARY KEY(MANV)
);

CREATE TABLE DUAN
(
  MADA VARCHAR(20) NOT NULL,
  TENDA VARCHAR(20),
  KINHPHI VARCHAR(20),
  MAPB VARCHAR(20),
  MACN VARCHAR(20),
  TRGDA VARCHAR(20),
  TONGCHI VARCHAR(20),
  PRIMARY KEY (MADA)
);

CREATE TABLE PHONGBAN
(
  MAPB VARCHAR(20) NOT NULL,
  TENPB VARCHAR(20),
  DIADIEM VARCHAR(20),
  TRGPB VARCHAR(20),
  PRIMARY KEY (MAPB)
);

CREATE TABLE CHINHANH
(
  MACN VARCHAR(20) NOT NULL,
  TENCN VARCHAR(20),
  VITRI VARCHAR(20),
  TRGCN VARCHAR(20),
  PRIMARY KEY (MACN)
);
CREATE TABLE PHANCONG
(
  MANV VARCHAR(20) NOT NULL,
  MADA VARCHAR(20) NOT NULL,
  THOIGIAN VARCHAR(20), 
  PRIMARY KEY (MANV, MADA)
);
----------------------------------------------------------