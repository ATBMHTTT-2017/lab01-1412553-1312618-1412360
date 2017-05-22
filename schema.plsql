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
  LUONG VARCHAR(20),
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
------INSERT DATA----
---NHANVIEN---
INSERT INTO NHANVIEN VALUES ('BS1412123', 'Nguyễn Văn Tài', '15/12/1995', 'Phú Yên', 'Nam', 'PB01', 'MCN01', '1000');
INSERT INTO NHANVIEN VALUES ('BS1421124', 'Nguyễn Văn Tú', '15/12/1990', 'Phú Thọ', 'Nam', 'PB02', 'MCN02', '2000');
INSERT INTO NHANVIEN VALUES ('BS1412125', 'Nguyễn Văn Huân', '15/12/1995', 'Phú Yên', 'Nam', 'PB03', 'MCN03','1200');
INSERT INTO NHANVIEN VALUES ('BS1412126', 'Nguyễn Trung Tính', '15/05/1994', 'Phú Thọ', 'Nam', 'PB01', 'MCN01', '1300');
INSERT INTO NHANVIEN VALUES ('BS1412127', 'Huỳnh Văn Bánh', '20/12/1995', 'Hưng Yên', 'Nam', 'PB02', 'MCN02', '1350');
INSERT INTO NHANVIEN VALUES ('BS1412128', 'Huỳnh Thúc Văn', '20/12/1992', 'Khánh Hòa', 'Nam', 'PB03', 'MCN03', '1200');
INSERT INTO NHANVIEN VALUES ('BS1012123', 'Lê Tấn Lợi', '20/12/1990', 'Bình Định', 'Nam', '', '','3000');  --GIAMDOC

select * from NHANVIEN;

---DUAN---
INSERT INTO DUAN VALUES ('DA1','Dự Án 1', '5000', 'PB01', 'CN01', 'BS1412123', '6000');
INSERT INTO DUAN VALUES ('DA2', 'Dư Án 2', '6000', 'PB02', 'CN02', 'BS1412124', '7000');
INSERT INTO DUAN VALUES ('DA3','Dự Án 3', '5500', 'PB03', 'CN03', 'BS1415425', '6000');
INSERT INTO DUAN VALUES ('DA4','Dự Án 4', '5500', 'PB03', 'CN04', 'BS1412126', '6000');
select * from DUAN;

--PHONG BAN---
INSERT INTO PHONGBAN VALUES ('PB01','PHÒNG 1','LẦU 1','BS1412123');
INSERT INTO PHONGBAN VALUES ('PB02','PHÒNG 2','LẦU 1', 'BS1412124');
INSERT INTO PHONGBAN VALUES ('PB03','PHÒNG 3','LẦU 1','BS1412125');
select * from PHONGBAN;

---CHI NHANH---
INSERT INTO CHINHANH VALUES ('MCN01', 'Chi Nhánh 1','Quận 1','BS1412123');
INSERT INTO CHINHANH VALUES ('MCN02', 'Chi Nhánh 2','Quận 2','BS1412124');
INSERT INTO CHINHANH VALUES ('MCN03', 'Chi Nhánh 3','Quận 3','BS1412125');
select * from CHINHANH;

--PHAN CONG---
INSERT INTO PHANCONG VALUES ('BS1412123', 'DA1','01/01/2010');
INSERT INTO PHANCONG VALUES ('BS1412124', 'DA2','01/01/2011');
INSERT INTO PHANCONG VALUES ('BS1412125', 'DA3','01/01/2012');
select * from PHANCONG;
--khóa ngoại---
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_PHONGBAN FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB);
ALTER TABLE NHANVIEN ADD CONSTRAINT  FK_NHANVIEN_CHINHANH FOREIGN KEY (MACN) REFERENCES CHINHANH(MACN);

ALTER TABLE DUAN ADD CONSTRAINT  FK_DUAN_NHANVIEN FOREIGN KEY (TRGDA) REFERENCES NHANVIEN(MANV);
ALTER TABLE DUAN ADD CONSTRAINT  FK_DUAN_CHINHANH FOREIGN KEY (MCN) REFERENCES CHINHANH(MACN);
ALTER TABLE DUAN ADD CONSTRAINT  FK_DUAN_PHONGBAN FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB);

ALTER TABLE PHONGBAN ADD CONSTRAINT  FK_PHONGBAN_NHANVIEN FOREIGN KEY (TRGPB) REFERENCES NHANVIEN(MANV);

ALTER TABLE CHINHANH ADD CONSTRAINT  FK_CHINHANH_NHANVIEN FOREIGN KEY (TRGCN) REFERENCES NHANVIEN(MANV);

ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE PHANCONG ADD CONSTRAINT  FK_PHANCONG_DUAN FOREIGN KEY (MADA) REFERENCES DUAN(MADA);


-----------------------------------------------------------------------------------------
# sample file
--UPDATE
-- Nguyễn Thanh Trà - 1312618


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
-----Script------
/*
DROP TABLE NhanVien CASCADE CONSTRAINTS;
DROP TABLE ChiNhanh CASCADE CONSTRAINTS;
DROP TABLE PhongBan CASCADE CONSTRAINTS;
DROP TABLE DuAn CASCADE CONSTRAINTS;
DROP TABLE ChiTieu CASCADE CONSTRAINTS;
DROP TABLE PhanCong CASCADE CONSTRAINTS;
*/




create table NhanVien(
  maNV char(5) primary key,
  hoTen nvarchar2(50) not null,
  diaChi nvarchar2(100),
  dienThoai char(11),
  email varchar2(20),
  maPhong int,
  chiNhanh int,
  luong int
);

create table ChiNhanh(
  maCN int primary key,
  tenCN nvarchar2(50),
  truongChiNhanh char(5)
);

create table PhongBan(
  maphong int primary key,
  tenphong nvarchar2(50),
  truongphong char(5),
  ngayNhaNchuc date,
  soNhanVien int,
  chiNhanh int
);

create table DuAn(
  maDA int primary key,
  tenDA nvarchar2(50),
  kinhPhi int,
  phongChuTri int,
  truongDA char(5)
);

create table ChiTieu(
  maChiTieu int primary key,
  tenChiTieu nvarchar2(100),
  soTien int,
  duAn int
);

create table PhanCong(
  maNV char(5),
  duAN int,
  vaiTro nvarchar2(50),
  phuCap int,
  primary key (manv, duan)
);
-- Create foreign key --


	alter table NhanVien
	add constraint fk_nhv_phb
	foreign key (maPhong)
	references PhongBan(maPhong);
  
  alter table NhanVien
	add	constraint fk_nhv_chin
	foreign key (chiNhanh)
	references ChiNhanh(maCN);

	alter table PhongBan
	add constraint fk_phb_chn
	foreign key (chiNhanh)
	references ChiNhanh(maCN);
  
  alter table PhongBan
	add	constraint fk_phb_nhv
	foreign key (truongPhong)
	references NhanVien(maNV);

	alter table ChiNhanh
	add constraint chin_nhv
	foreign key (truongChiNhanh)
	references NhanVien(maNV);

	alter table DuAn
	add constraint fk_dua_phb
	foreign key (phongChuTri)
	references PhongBan(maPhong);
  
  alter table DuAn
	add	constraint fk_dua_nhv
	foreign key (truongDA)
	references NhanVien(maNV);

	alter table ChiTieu
	add constraint fk_cht_dua
	foreign key (duAn)
	references DuAn(maDA);

	alter table PhanCong
	add constraint fk_phc_nhv
	foreign key (maNV)
	references NhanVien(maNV);
  
  alter table PhanCong
	add	constraint fk_phc_dua
	foreign key (duAn)
	references DuAn(maDA);

--insert data

insert all
  INTO CHINHANH values (1, 'Dak Nong', null)
  INTO CHINHANH values (2, 'Binh Phuoc', null)
  INTO CHINHANH values (3, 'Dak Lak', null)
  INTO CHINHANH values (4, 'Gia Lai', null)
  INTO CHINHANH values (5, 'Binh Duong', null)
  INTO CHINHANH values (6, 'Khanh Hoa', null)
select* from dual;

insert all
  into PHONGBAN values (1, N'Tài chính', null, null, 0, 1) 
  into PHONGBAN values (2, N'Đào tạo', null, null, 0, 2)
  into PHONGBAN values (3, N'Dịch vụ', null, null, 0, 3)
  into PHONGBAN values (4, N'Kế hoạch', null, null, 0, 4)
  into PHONGBAN values (5, N'Quản lý', null, null, 0, 5)
  into PHONGBAN values (6, N'Quy hoạch', null, null, 0, 6)
select* from dual;

insert all
  into NHANVIEN values ('nv_01', n'Nguyễn Văn A', N'Dak Nong', '0984898562', 'nva@gmail.com', 1, 1, 400000)
  into NHANVIEN values ('nv_02', n'Nguyễn Văn B', N'Dak Nong', '0981231212', 'nvb@gmail.com', 2, 2, 600000)
  into NHANVIEN values ('nv_03', n'Trần Thị C', N'Dak Nong', '0164554545', 'ttc@gmail.com', 3, 3, 700000)
  into NHANVIEN values ('nv_04', n'Cao Văn B', N'Dak Nong', '0164123456', 'cvb@gmail.com', 4, 4, 800000)
  into NHANVIEN values ('nv_05', n'Đặng Thị Dạ Ly', N'Dak Nong', '0164147895', 'dtdl@gmail.com', 5, 5, 900000)
  into NHANVIEN values ('nv_06', n'Đặng Văn Hiếu', N'Dak Nong', '0164101234', 'dvh@gmail.com', 6, 6, 100000)
  into NHANVIEN values ('nv_07', n'Phạm Văn Tiến', N'Dak Nong', '0164178956', 'adsfd@gmail.com', 2, 2, 200000)
  into NHANVIEN values ('nv_08', n'Trầ Hà', N'Dak Nong', '0164132105', 'agewd@gmail.com', 4, 4, 50000)
  into NHANVIEN values ('nv_09', n'Nguyễn Thúy An', N'Binh Phuoc', '0164178965', 'wqegsdsa@gmail.com', 3, 3, 500000)
  into NHANVIEN values ('nv_10', n'Đoàn Dự', N'Binh Phuoc', '0164178956', 'hrefasedf@gmail.com', 5, 5, 50000)
  into NHANVIEN values ('nv_11', n'Nguyễn Thanh Trà', N'Binh Phuoc', '0164112345', 'awefd@gmail.com', 6, 6, 20000)
  into NHANVIEN values ('nv_12', n'Nguyễn Yến Nhi', N'Binh Phuoc', '0164101234', 'lfuc@gmail.com', 1, 1, 800000)
  into NHANVIEN values ('nv_13', n'Trương Phong', N'Binh Phuoc', '0164178965', 'gweafd@gmail.com', 4, 4, 30000)
  into NHANVIEN values ('nv_14', n'Nguyễn Đại', N'Binh DuongLong An', '09564012345', 'gqawefds@gmail.com', 1, 1, 300000)
  into NHANVIEN values ('nv_15', n'Trần Ngọc', N'Binh Duong', '0956445689', 'gawefsdc@gmail.com', 6, 6, 50000)
  into NHANVIEN values ('nv_16', n'Trần Đại', N'Binh Duong', '0956401236', 'gqawed@gmail.com', 3, 3, 60000)
  into NHANVIEN values ('nv_17', n'Trương Sang', N'Binh Duong', '0956447895', 'awvesd@gmai.com', 5, 5, 700000)
  into NHANVIEN values ('nv_18', n'Hoài Linh', N'Binh Duong', '0956423568', 'awvesd@gmail.com', 1, 1, 100000)
  into NHANVIEN values ('nv_19', n'Chí Tài', N'Binh Duong', '0956445678', 'gqawevsd@gmail.com', 3, 3, 400000)
  into NHANVIEN values ('nv_20', n'Đàm Vĩnh Hưng', N'Binh Duong', '0956498756', 'qgawesd@gmail.com', 3, 3, 200000)
select* from dual;

insert all
  into DUAN values (1, N'Dự án A', 10000000, 1, 'nv_15')
  into DUAN values (2, N'Dự án B', 20000000, 2, 'nv_13')
  into DUAN values (3, N'Dự án C', 30000000, 3, 'nv_16')
  into DUAN values (4, N'Dự án D', 40000000, 4, 'nv_08')
  into DUAN values (5, N'Dự án E', 50000000, 5, 'nv_17')
select* from dual;

insert all
  into CHITIEU values (1, N'Thể thao', 100000, 3)
  into CHITIEU values (2, N'Văn nghệ', 500000, 2)
  into CHITIEU values (3, N'Trang thiết bị', 5000000, 1)
  into CHITIEU values (4, N'Nhân công', 300000, 4)
  into CHITIEU values (5, N'Du lịch', 1000000, 5)
  select* from dual;
insert all
  into PHANCONG values ('nv_03', 1, N'Công nhân', 20000)
  into PHANCONG values ('nv_04', 1, N'Giám dốc', 10000)
  into PHANCONG values ('nv_05', 1, N'Trưởng phòng', 20000)
  into PHANCONG values ('nv_15', 1, N'Quản lý', 50000)
  into PHANCONG values ('nv_08', 1, N'Bảo vệ', 60000)
select* from dual;

--update bảng PhongBan và ChiNhanh
update PHONGBAN
set truongphong = 'nv_01', ngaynhanchuc = to_date('1/2/2017', 'DD/MM/YYYY') where maphong = 1;

update PHONGBAN
set truongphong = 'nv_02', ngaynhanchuc = to_date('3/2/2017', 'DD/MM/YYYY') where maphong = 2;

update PHONGBAN
set truongphong = 'nv_19', ngaynhanchuc = to_date('3/4/2017', 'DD/MM/YYYY') where maphong = 3;

update PHONGBAN
set truongphong = 'nv_10', ngaynhanchuc = to_date('1/4/2017', 'DD/MM/YYYY') where maphong = 4;

update PHONGBAN
set truongphong = 'nv_17', ngaynhanchuc = to_date('2/1/2017', 'DD/MM/YYYY') where maphong = 5;

update PHONGBAN
set truongphong = 'nv_20', ngaynhanchuc = to_date('1/1/2017', 'DD/MM/YYYY') where maphong = 6;

-- update chinhanh
update CHINHANH
set truongchinhanh = 'nv_01' where macn = 1;

update CHINHANH
set truongchinhanh = 'nv_02' where macn = 2;

update CHINHANH
set truongchinhanh = 'nv_03' where macn = 3;

update CHINHANH
set truongchinhanh = 'nv_04' where macn = 4;

update CHINHANH
set truongchinhanh = 'nv_05' where macn = 5;

update CHINHANH
set truongchinhanh = 'nv_06' where macn = 6;






