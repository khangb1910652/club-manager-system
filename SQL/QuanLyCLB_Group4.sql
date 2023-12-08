create database QuanLyCLB;
use QuanLyCLB;

create table taiKhoan(
	tenDangNhap NVarchar(30) not null primary key,
	matKhau NVarchar(30) not null,
	quyen Nvarchar(30) not null,
);

create table chucVu(
	maCV Nvarchar(30) not null primary key,
	tenCV Nvarchar(30) not null,
);

create table thanhVien(
	cccd NVarchar(30) not null primary key check (LEN(cccd) = 12),
	hoTen Nvarchar(30) not null,
	gioiTinh bit not null,
	ngaySinh date not null,
	email Nvarchar(30) unique not null check (email LIKE '%_@__%.__%' AND email NOT LIKE '%[^a-zA-Z0-9@._-]%'),
	soDienThoai Nvarchar(11) unique not null check (sodienThoai NOT LIKE '%[^0-9]%'),
	diaChi Nvarchar(30) not null,
	trinhDo Nvarchar(30) not null,
	ngayThamGia smalldatetime default getdate(),
	tongTien decimal(10,0) not null default 0,
	tenDangNhap Nvarchar (30) foreign key references taiKhoan(tenDangNhap) ON DELETE CASCADE,
	maCV Nvarchar(30) foreign key references chucVu(maCV) ON DELETE CASCADE
);

create table suKien(
	maSK Nvarchar(30) not null primary key,
	tenSK Nvarchar(30) not null,
	noiDungSK Ntext not null,
	thoiGianBatDau datetime not null,
	thoiGianKetThuc datetime not null,
	diaDiem Nvarchar(30) not null,
	phi decimal(10,0) not null default 0
);

create table danhSachThamGia(
    cccd Nvarchar(30) foreign key references thanhVien(cccd) ON DELETE CASCADE,
    maSK Nvarchar(30) foreign key references suKien(maSK) ON DELETE CASCADE,
    PRIMARY KEY (cccd, maSK)
);

create table dongGop(
	soTien decimal(10,0) not null default 0,
	ngayDong datetime default getdate(),
	cccd NVarchar(30) foreign key references thanhVien(cccd) ON DELETE CASCADE,
);

create table taiChinh(
	soDu decimal(10,0) not null,
	ngay smalldatetime default getdate()
);

--BẢNG TÀI KHOẢN
--Insert bảng taiKhoan
INSERT INTO taiKhoan VALUES ('TCLB', 'tclb123', 'Admin');
INSERT INTO taiKhoan VALUES('PCLB', 'pclb123', 'Admin');
INSERT INTO taiKhoan VALUES('User', 'user123', 'User');

-- BẢNG CHỨC VỤ
-- Insert bảng chucVu
INSERT INTO chucVu values ('TCLB', N'Trưởng câu lạc bộ');
INSERT INTO chucVu values ('PCLB', N'Phó câu lạc bộ');
INSERT INTO chucVu values ('TVCLB', N'Thành viên');
INSERT INTO chucVu values ('HLVCLB', N'Huấn luyện viên câu lạc bộ');

-- BẢNG THÀNH VIÊN
-- Insert bảng thanhVien
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789012'	, N'Nguyễn Duy Khang',	0 ,	'2001-1-1'	,'khang123@gmail.com',	'0855267200'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789013'	, N'Nguyễn Minh Luân',	0 ,	'2001-1-1'	,'luan123@gmail.com',	'0855267201'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'PCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789014'	, N'Lê Tuyết Nga',	1,	'2001-1-1'	,'nga123@gmail.com',	'0855267202'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'HLVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789015'	, N'Nguyễn Thị Bích Huyền',	1 ,	'2001-1-1'	,'huyen123@gmail.com',	'0855267203'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'HLVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789016'	, N'Nguyễn Quốc Bảo',	0 ,	'2001-1-1'	,'bao123@gmail.com',	'0855267204'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'HLVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789017'	,N'Nguyễn Văn D',	1 ,	'2001-1-1'	,'D123@gmail.com',	'0855267205'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789018'	,N'Nguyễn Văn K',	1 ,	'2001-1-1'	,'K123@gmail.com',	'0855267206'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789019'	,N'Nguyễn Văn N',	1 ,	'2001-1-1'	,'N123@gmail.com',	'0855267207'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789020'	,N'Nguyễn Văn O',	0 ,	'2001-1-1'	,'O123@gmail.com',	'0855267208'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789021'	,N'Nguyễn Văn U',	1 ,	'2001-1-1'	,'U1123@gmail.com',	'0855267209'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789022'	,N'Nguyễn Văn S',	1 ,	'2001-1-1'	,'S123@gmail.com',	'0855267210'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789023'	,N'Nguyễn Văn B',	0 ,	'2001-1-1'	,'B123@gmail.com',	'0855267211'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789024'	,N'Nguyễn Văn K',	1 ,	'2001-1-1'	,'K1123@gmail.com',	'0855267212'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789025'	,N'Nguyễn Văn W',	1 ,	'2001-1-1'	,'W123@gmail.com',	'0855267213'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789026'	,N'Nguyễn Văn Z',	1 ,	'2001-1-1'	,'Z123@gmail.com',	'0855267214'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789027'	,N'Nguyễn Văn C',	1 ,	'2001-1-1'	,'C123@gmail.com',	'0855267215'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789028'	,N'Nguyễn Văn L',	1 ,	'2001-1-1'	,'L123@gmail.com',	'0855267216'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789029'	,N'Nguyễn Văn Y',	1 ,	'2001-1-1'	,'Y123@gmail.com',	'0855267217'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789030'	,N'Nguyễn Văn I',	0 ,	'2001-1-1'	,'I123@gmail.com',	'0855267218'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789031'	,N'Nguyễn Văn J',	0 ,	'2001-1-1'	,'J123@gmail.com',	'0855267219'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789032'	,N'Nguyễn Văn A',	1 ,	'2001-1-1'	,'A123@gmail.com',	'0855267220'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789033'	,N'Nguyễn Văn E',	1 ,	'2001-1-1'	,'E123@gmail.com',	'0855267221'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789034'	,N'Nguyễn Văn P',	0 ,	'2001-1-1'	,'P123@gmail.com',	'0855267222'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789035'	,N'Nguyễn Văn G',	0 ,	'2001-1-1'	,'G123@gmail.com',	'0855267223'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789036'	,N'Nguyễn Văn S',	1 ,	'2001-1-1'	,'S1123@gmail.com',	'0855267224'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789037'	,N'Nguyễn Văn V',	0 ,	'2001-1-1'	,'V123@gmail.com',	'0855267225'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789038'	,N'Nguyễn Văn K',	1 ,	'2001-1-1'	,'K2123@gmail.com',	'0855267226'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789039'	,N'Nguyễn Văn Y',	0 ,	'2001-1-1'	,'Y1123@gmail.com',	'0855267227'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789040'	,N'Nguyễn Văn U',	0 ,	'2001-1-1'	,'U2123@gmail.com',	'0855267228'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789041'	,N'Nguyễn Văn I',	1 ,	'2001-1-1'	,'I1123@gmail.com',	'0855267229'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789042'	,N'Nguyễn Văn U',	1 ,	'2001-1-1'	,'U3123@gmail.com',	'0855267230'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789043'	,N'Nguyễn Văn R',	1 ,	'2001-1-1'	,'R123@gmail.com',	'0855267231'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789044'	,N'Nguyễn Văn P',	1 ,	'2001-1-1'	,'P2123@gmail.com',	'0855267232'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789045'	,N'Nguyễn Văn Q',	0 ,	'2001-1-1'	,'Q123@gmail.com',	'0855267233'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789046'	,N'Nguyễn Văn R',	0 ,	'2001-1-1'	,'R1123@gmail.com',	'0855267234'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789047'	,N'Nguyễn Văn E',	1 ,	'2001-1-1'	,'E1123@gmail.com',	'0855267235'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789048'	,N'Nguyễn Văn T',	0 ,	'2001-1-1'	,'T123@gmail.com',	'0855267236'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789049'	,N'Nguyễn Văn F',	0 ,	'2001-1-1'	,'F123@gmail.com',	'0855267237'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789050'	,N'Nguyễn Văn Y',	1 ,	'2001-1-1'	,'Y112345@gmail.com',	'0855267238'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789051'	,N'Nguyễn Văn X',	1 ,	'2001-1-1'	,'X123@gmail.com',	'0855267239'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789052'	,N'Nguyễn Văn J',	0 ,	'2001-1-1'	,'J1123@gmail.com',	'0855267240'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789053'	,N'Nguyễn Văn C',	1 ,	'2001-1-1'	,'C1123@gmail.com',	'0855267241'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789054'	,N'Nguyễn Văn O',	0 ,	'2001-1-1'	,'O1123@gmail.com',	'0855267242'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789055'	,N'Nguyễn Văn Z',	0 ,	'2001-1-1'	,'Z1123@gmail.com',	'0855267243'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789056'	,N'Nguyễn Văn L',	1 ,	'2001-1-1'	,'L1123@gmail.com',	'0855267244'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789057'	,N'Nguyễn Văn P',	1 ,	'2001-1-1'	,'P3123@gmail.com',	'0855267245'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789058'	,N'Nguyễn Văn W',	0 ,	'2001-1-1'	,'W1123@gmail.com',	'0855267246'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789059'	,N'Nguyễn Văn Z',	0 ,	'2001-1-1'	,'Z2123@gmail.com',	'0855267247'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789060'	,N'Nguyễn Văn W',	1 ,	'2001-1-1'	,'W2123@gmail.com',	'0855267248'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');
INSERT INTO thanhVien (cccd, hoTen, gioiTinh, ngaySinh, email, soDienThoai, diaChi, trinhDo, tongTien, maCV) values(	'123456789061'	,N'Nguyễn Văn W',	0 ,	'2001-1-1'	,'W3123@gmail.com',	'0855267249'	,N'Cần Thơ'	,N'Trên đại học'	,1000000 	,'TVCLB');

-- BẢNG SỰ KIỆN
-- Tự sinh mã SK
GO
CREATE FUNCTION generateMaSK()
RETURNS NVARCHAR(30)
AS
BEGIN
    DECLARE @maxMaSK NVARCHAR(30)
    DECLARE @newMaSK NVARCHAR(30)

    SELECT @maxMaSK = MAX(maSK) FROM suKien

    IF @maxMaSK IS NULL
        SET @newMaSK = 'SK0001'
    ELSE
        SET @newMaSK = 'SK' + RIGHT('0000' + CAST(RIGHT(@maxMaSK, 4) + 1 AS NVARCHAR(4)), 4)

    RETURN @newMaSK
END
GO
-- Insert bang suKien
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK1',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK2',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK3',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK4',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK5',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK6',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK7',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK8',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK9',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK10',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK11',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK12',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK13',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK14',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK15',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK16',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK17',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK18',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK19',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK20',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK21',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK22',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK23',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK24',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK25',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK26',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK27',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK28',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK29',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK30',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK31',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK32',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK33',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK34',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK35',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK36',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK37',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK38',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK39',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK40',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK41',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK42',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK43',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK44',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK45',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK46',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK47',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK48',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK49',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);
INSERT INTO suKien (maSK, tenSK, noiDungSK, thoiGianBatDau, thoiGianKetThuc, diaDiem, phi) VALUES (dbo.generateMaSK(),	N'SK50',	N'Tổ chức giải đấu, giao lưu cờ vua giữa các hội viên',	'2023-03-17 08:00:00',	'2023-03-17 12:00:00',	N'Nhà văn hóa CT',	100000);

--BẢNG DANH SÁCH THAM GIA
--Insert bảng danhSachThamGia
INSERT INTO danhSachThamGia VALUES (	'123456789012'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789013'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789014'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789015'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789016'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789017'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789018'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789019'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789020'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789021'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789022'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789023'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789024'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789025'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789026'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789027'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789028'	,'SK0001')
INSERT INTO danhSachThamGia VALUES (	'123456789029'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789030'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789031'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789032'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789033'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789034'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789035'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789036'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789037'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789038'	,'SK0002')
INSERT INTO danhSachThamGia VALUES (	'123456789039'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789040'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789041'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789042'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789043'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789044'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789045'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789046'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789047'	,'SK0003')
INSERT INTO danhSachThamGia VALUES (	'123456789048'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789049'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789050'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789051'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789052'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789053'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789054'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789055'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789056'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789057'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789058'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789059'	,'SK0007')
INSERT INTO danhSachThamGia VALUES (	'123456789060'	,'SK0008')
INSERT INTO danhSachThamGia VALUES (	'123456789061'	,'SK0008')

--BẢNG ĐÓNG GÓP
--Insert bảng dongGop
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789012'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789013'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789014'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789015'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789016'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789017'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789018'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789019'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789020'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789021'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789022'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789023'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789024'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789025'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789026'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789027'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789028'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789029'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789030'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789031'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789032'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789033'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789034'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789035'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789036'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789037'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789038'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789039'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789040'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789041'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789042'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789043'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789044'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789045'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789046'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789047'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789048'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789049'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789050'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789051'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789052'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789053'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789054'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789055'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789056'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789057'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789058'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789059'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789060'	);
INSERT INTO dongGop(soTien, cccd) VALUES (	1000000,	'123456789061'	);


--Bảng Tài Chính
--Insert bảng taiChinh
INSERT INTO taiChinh (soDu, ngay) VALUES ((SELECT SUM(soTien) FROM dongGop) - (SELECT SUM(phi) FROM suKien), getdate());

UPDATE taiChinh SET soDu = (SELECT SUM(soTien) FROM dongGop) - (SELECT SUM(phi) FROM suKien);