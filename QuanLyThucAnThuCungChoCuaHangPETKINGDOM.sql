use master
--Tao CSDL
create database QLthucan
GO
use QLthucan
GO
Create Table LOAI
(
	MaLoai int Identity(1,1),
	TenLoai nvarchar(50) NOT NULL,
	CONSTRAINT PK_LOAI PRIMARY KEY(MaLoai)
)
GO
Create Table NHASANXUAT
(
	MaNSX int identity(1,1),
	TenNSX nvarchar(100) NOT NULL,
	DiaChi NVARCHAR(150),
	DienThoai NVARCHAR(15),
	CONSTRAINT PK_NHASANXUAT PRIMARY KEY(MaNSX)
)
GO

CREATE TABLE THUCAN
(
	MaThucAn INT IDENTITY(1,1),
	TenThucAn NVARCHAR(100) NOT NULL,
	DonViTinh NVARCHAR(50) DEFAULT 'Gói',
	DonGia MONEY CHECK (DonGia>=0),
	MoTa NTEXT,
	HinhMinhHoa VARCHAR(50),
	MaLoai INT,
	MaNSX INT,
	NgayCapNhat SMALLDATETIME,
	SoLuongBan INT CHECK(SoLuongBan>0),
	SoLanXem INT DEFAULT 0,
	CONSTRAINT PK_THUCAN PRIMARY KEY(MaThucAn)
)
GO

CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTenKH nVarchar(50),
	DiaChiKH nVarchar(50),
	DienThoaiKH Varchar(10),
	TenDN Varchar(15),
	MatKhau Varchar(15),
	NgaySinh SMALLDATETIME,
	GioiTinh Bit Default 1,
	Email Varchar(50),
	DaDuyet Bit Default 0,
	CONSTRAINT PK_KhachHang PRIMARY KEY(MaKH)
)
GO

CREATE TABLE DONDATHANG
(
	SoDH INT IDENTITY(1,1),
	MaKH INT,
	NgayDH SMALLDATETIME,
	TriGia Money Check (TriGia>0),
	DaGiao Bit Default 0,
	NgayGiaoHang SMALLDATETIME,
	TenNguoiNhan Varchar(50),
	DiaChiNhan nvarchar(50),
	DienThoaiNhan Varchar(15),
	HTThanhToan Bit Default 0,
	HTGiaoHang Bit Default 0,
	CONSTRAINT PK_DonDatHang PRIMARY KEY(SoDH)
)
GO

CREATE TABLE CTDATHANG
(
	SoDH INT,
	MaThucAn INT,
	SoLuong Int Check(SoLuong>0),
	DonGia Decimal(9,2) Check(DonGia>=0),
	ThanhTien AS SoLuong*DonGia ,
	CONSTRAINT PK_CTDatHang PRIMARY KEY(SoDH,MaThucAn)
)
GO




ALTER TABLE THUCAN ADD CONSTRAINT FK_THUCAN_LOAI FOREIGN KEY (MaLoai) REFERENCES LOAI(MaLoai)
ALTER TABLE THUCAN ADD CONSTRAINT FK_THUCAN_NHASANXUAT FOREIGN KEY (MaNSX) REFERENCES NHASANXUAT(MaNSX)
ALTER TABLE DONDATHANG ADD CONSTRAINT FK_DonDatHang_KhachHang FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
ALTER TABLE CTDATHANG ADD CONSTRAINT FK_CTDatHang_DonDatHang FOREIGN KEY (SoDH) REFERENCES DONDATHANG(SoDH)
ALTER TABLE CTDATHANG ADD CONSTRAINT FK_CTDatHang_THUCAN FOREIGN KEY (MaThucAn) REFERENCES THUCAN(MaThucAn)

GO

/****** Object:  Table [dbo].[CHUDE]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[LOAI] ON
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (1, N'THỨC ĂN HẠT KHÔ')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (2, N'THỨC ĂN ƯỚT')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (3, N'SNACK - XƯƠNG GẶM')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (4, N'THỨC ĂN HẠT MỀM')
SET IDENTITY_INSERT [dbo].[LOAI] OFF

/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (1, N'Võ Quốc Lương', N'Phú Hòa', N'0988936592', N'luongvq', N'12345', CAST(0x59310000 AS SmallDateTime), 1, N'luongvq@tdmu.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (2, N'Nguyễn Tiến Luân', N'Quận 6', N'Chua có', N'thang', N'123456', CAST(0x6A570000 AS SmallDateTime), 1, N'ntluan@hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (3, N'Đặng Quốc Hòa', N'Sư Vạn Hạnh', N'Chua có', N'dqhoa', N'hoa', CAST(0x5D890000 AS SmallDateTime), 1, N'dqhoa@hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (4, N'Ngô Ngọc Ngân', N'Khu chung cư', N'0918544699', N'nnngan', N'ngan', CAST(0x42830000 AS SmallDateTime), 1, N'nnngan@hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (5, N'Đỗ Quỳnh Hương', N'Cống Quỳnh', N'0908123456', N'dqhuong', N'huong', CAST(0x75500000 AS SmallDateTime), 0, N'dqhuong@hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (6, N'Trần Thị Thu Trang', N'Nơ Trang Long', N'Chua có', N'ttttrang       ', N'trang          ', CAST(0x594D0000 AS SmallDateTime), 0, N'ttrang@yahoo.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (7, N'Nguyễn Thiên Thanh', N'Hai Bà Trưng', N'0908320111', N'ntthanh', N'thanh', CAST(0x71130000 AS SmallDateTime), 0, N'ntthanh@t3h.hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (8, N'Trần Thị Hải Yến', N'Trần Hưng Đạo', N'8111111   ', N'tthyen', N'yen', CAST(0x6BC40000 AS SmallDateTime), 0, N'tthyan@vol.vnn.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (9, N'Nguyễn Thị Thanh Mai', N'Trần Quang Diệu', N'81111222', N'nttmai         ', N'mai            ', CAST(0x75FF0000 AS SmallDateTime), 0, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (10, N'Nguyễn Thành Danh', N'Cộng Hòa', N'8103751   ', N'ntdanh', N'danh', CAST(0x6EA00000 AS SmallDateTime), 1, N'ntdanh@yahoo.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (11, N'Phạm Thị Nga', N'Q6 - Tp.HCM', N'0831564512', N'ptnga', N'nga', CAST(0x93D90000 AS SmallDateTime), 0, N'ptnhung@hcmuns.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (12, N'Lê Doanh Doanh', N'2Bis Hùng Vương', N'07077865', N'lddoanh', N'doanh', CAST(0x6E590000 AS SmallDateTime), 0, N'lddoanh@yahoo.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (13, N'Đòan Ngọc Minh Tâm', N'2 Đinh Tiên Hòang', N'0909092222', N'dnmtam', N'tam', CAST(0x6FCF0000 AS SmallDateTime), 0, N'ndmtam@yahoo.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HotenKH], [DiachiKH], [DienthoaiKH], [TenDN], [Matkhau], [Ngaysinh], [Gioitinh], [Email]) VALUES (14, N'Trần Khải Nhi', N'3 Bùi Hữu Nghĩa', N'0909095555', N'tknhi', N'nhi', CAST(0x727E0000 AS SmallDateTime), 1, N'tknhi@yahoo.com')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF


/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (1, N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', N'19001560')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (2, N'NXB Thống kê', N'Đồng Nai', N'19001511')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (3, N'Kim đồng', N'Tp.HCM', N'19001570')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (4, N'Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (5, N'Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (6, N'Văn hóa', N'Bình Dương', N'0913336677')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (7, N'Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Dienthoai]) VALUES (8, N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')
SET IDENTITY_INSERT [dbo].[NHASANXUAT] OFF

/****** Object:  Table [dbo].[SACH]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[THUCAN] ON
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (1, N'Thức ăn hạt mềm cho chó Zenith ADULT vị CỪU & Khoai Tây 1.2kg', 220.000, N'Gói', N'Thức  ăn hạt mềm cho chó Zenith ADULT vị CỪU & Khoai Tây 1.2kg
Thuộc dòng sản phẩm thức ăn hạt mềm cao cấp cho thú cưng. 
Thức ăn hạt mềm chó con Zenith Adult được chế biến từ thịt cừu tươi, thịt nạc gà rút xương, gạo lứt, yến mạch và dầu cá hồi.
Với các thành phần tươi sạch, giàu dinh dưỡng.
Zenith Puppy hạt mềm, cung cấp độ ẩm cao và lượng muối thấp, thơm ngon, dễ nhai, dễ tiêu hóa và tốt cho sức khỏe chó con. 
Dành cho chó con trên 1 tuổi 
Không chứa ngũ cốc.
Không gây dị ứng.
Được chế biến từ thịt cừu, bột gà, gạo lứt, yến mạch.
Giúp giảm bớt mùi phân và mùi cơ thể 
Giúp tăng cường sức đề kháng, phòng ngừa bệnh tật.
Làm đẹp da, đẹp lông.
Cung cấp chất dinh dưỡng cần thiết cho sự tăng trưởng của chó trưởng thành.
Giúp tăng cường sức khỏe đường ruột, tiêu hóa tốt, ngừa tiêu chảy.', N'1.jpg', 4, 1, CAST(0x95270000 AS SmallDateTime), 120, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (2, N'ROYAL CANIN MINI PUPPY - Thức ăn chó con giống nhỏ gói zip 1kg', 190.000, N'Gói', N'THỨC ĂN CHO CHÓ ROYAL CANIN MINI PUPPY
Dành cho chó kích cỡ Mini (cân nặng tối đa 10kg) và đang trong lứa tuổi Puppy từ 2 đến 10 tháng tuổi.
Những chú chó giống nhỏ dưới 11kg (khi trưởng thành) như: Poodle, Phốc, Cocker Spaniel, Pug, Chihuahua, Phốc sóc Pomeranian, v.v..
Tùy thuộc vào từng giống chó mà chúng có đặc tính sinh lý, cấu tạo hàm, cấu trúc xương, hệ tiêu hóa và nhu cầu năng lượng cao khác nhau. 
Từ đó sản phẩm ROYAL CANIN Mini Junior luôn cam kết đảm bảo:
+ Giúp duy trì sức khoẻ tiêu hóa của chó
+ Hỗ trợ nhu cầu năng lượng cao ở mọi giai đoạn phát triển của chó
+ Thiết kế hạt giúp giảm sự hình thành cao răng 
+ Hỗ trợ hệ miễn dịch khỏe mạnh giúp chó chống lại bệnh tật
+ 100% dinh dưỡng cân bằng
+ 100% đảm bảo an toàn
ROYAL CANIN Mini Puppy dành cho chó con từ 0 đến 10kg và từ 2 đến 10 tháng tuổi.', N'2.jpg', 1, 2, CAST(0x94FD0000 AS SmallDateTime), 25, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (3, N'Thức ăn cho chó vị thịt gà Reflex Plus Can Food For Dog With Chicken, Chunks In Gravy lon 400gr', 39.000, N'Gói', N'Thành phần nguyên liệu: 
Thịt gà và chiết xuất từ thịt gà 29%, ngũ cốc 7.5%, Cá và chiết xuất từ cá 5.5%, khoáng chất 0.43%, chiết xuất protein từ rau 0.43%, gravy 20%, vitamin các loại 0.24%, phụ gia 0.10%, nước 57%
Chỉ tiêu chất lượng: Protein ≥ 5%; Chất béo ≥ 5%; Xơ thô ≤ 3%; Độ ẩm ≤ 86%; Khoáng tổng số ≤ 3%', N'3.jpg', 2, 3, CAST(0x95220000 AS SmallDateTime), 23, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (4,N'Pate King - Pet - Thức ăn dành cho CHÓ vị GIÒ HEO HẦM lon 380gr', 55.000, N'Gói', N'Giò Heo Hầm Nước Dùng của King’s Pet còn chính là giải pháp dành cho chó : 
Chó biếng ăn
Suy dinh dưỡng	
Giúp làm đẹp da lông,	
Giảm lượng thức ăn khô nạp vào cơ thể.	
Giảm tối đa các chứng bệnh nguy hiểm sỏi liên quan đến gan, thận ở chó.
Trong 100g chân giò heo có chứa 21g protit; 21,6g lipit, và nhiều collagen, canxi hoà tan nếu được hầm lâu với nước dùng trong môi trường kín khí.
Hàm lượng dinh dưỡng có trong 1 lon Bánh thưởng cấp nước – Giò heo hầm nước dùng King’s Pet:	
 Độ ẩm : 80%	
Đạm : 10%	
Chất Béo : 15%	
Chất xơ : 0.1%
Năng lượng trao đổi (800Kcal/kg).
Kèm theo đó là các vi chất dinh dưỡng và khoáng như: Canxi, Photpho, Chất sắt, Vitamin A, B, Collagen.', N'4.jpg', 2, 1, CAST(0x95280000 AS SmallDateTime), 50, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (5, N'ROYAL CANIN MINI ADULT - Thức ăn dành cho chó lớn giống nhỏ gói zip 1kg', 160.000, N'Gói', N'THỨC ĂN CHO CHÓ ROYAL CANIN MINI ADULT 
Dành cho chó kích cỡ Mini (cân nặng tối đa dưới 10kg) và đang trong lứa tuổi Adult từ 10 tháng tuổi trở lên.
Những chú chó có kích cỡ nhỏ chỉ cần những loại thức ăn có thiết kế nhỏ, tuy nhiên chúng lại cần nhiều năng lượng hơn giống chó lớn vì chúng có thời kỳ tăng trưởng ngắn hơn và mạnh mẽ hơn. 
Thêm vào đó, tuổi thọ trung bình của giống chó nhỏ cao hơn giống chó lớn, chính vì vậy chúng khá khắc khe trong việc ăn uống.
Công thức của ROYAL CANIN Mini Adult được thiết kế để đáp ứng các nhu cầu dinh dưỡng đặc thù của giống chó nhỏ trong độ tuổi dưới 10 tháng.
+ Giúp duy trì sức khoẻ tiêu hóa của chó
+ Hỗ trợ nhu cầu năng lượng cao
+ Thiết kế hạt giúp giảm sự hình thành cao răng
+ Hỗ trợ hệ miễn dịch khỏe mạnh
+ 100% dinh dưỡng cân bằng
+ 100% đảm bảo an toàn
ROYAL CANIN MINI ADULT dành cho chó con từ 0 đến 10kg và trên 10 tháng tuổi.', N'5.jpg', 1, 1, CAST(0x950A0000 AS SmallDateTime), 16, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (6, N'ROYAL CANIN URINARY S/O CANINE - BỆNH SỎI THẬN Ở CHÓ gói 2kg', 487.000, N'Gói', N'THỰC PHẨM CHỨC NĂNG ROYAL CANIN URINARY S/O 
HỖ TRỢ ĐIỀU TRỊ BỆNH SỎI THẬN Ở CHÓ
+ Royal Canin Urinary S/O là thức ăn dinh dưỡng hoàn chỉnh cho chó.
+ Công thức hỗ trợ hòa tan sỏi Struvite và giảm tái phát nhờ các thành phần có thể axit hóa nước tiểu, ít chứa phân tử Magie (thành phần chính của sỏi Struvite).
KHUYẾN CÁO
Nên hỏi ý kiến của Bác Sĩ Thú Y trước khi cho ăn. 
Cho chó sử dụng Urinary S/O từ 5 đến 12 tuần để hòa tan sỏi struvite và tối đa trong 6 tháng để giảm tái phát.
Sau đó, chó cần được kiểm tra định kỳ tại Thú Y để nhận được lời khuyên cho chế độ ăn lâu dài. 
Luôn chuẩn bị sẵn nước sạch.
Lưu ý: Cần kiểm tra chức năng thận của chó trước khi chuyển sang chế độ ăn Urinary S/O.', N'6.jpg', 1, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (7, N'Thức ăn chó KANIPRO bao 10kg (gồm 20 gói 500gr)', 487.000, N'Gói', N'Thức ăn cao cấp phù hợp mọi giống chó ở giai đoạn trưởng thành
Thức ăn cho chó KANIPRO hương vị thịt bò, gà và rau có thành phần dinh dưỡng cân bằng và đầy đủ để mang lại một sức khỏe và tình trạng tốt cho Cún cưng, giúp:
•Strong Muscular Development:
Cơ bắp phát triển mạnh mẽ.
Thành phần tối ưu trong Kanipro giúp hỗ trợ cho cơ bắp chó cưng phát tiển chắc khỏe
•Healthy Immune System:
Tăng sức đề kháng.
Kích thích tăng cường hệ thống miễn dịch từ bên trong nhờ có vitamin, muối khoáng và các chất dinh dưỡng quan trọng khác.
•Good Digestive Function:
Chức năng tiêu hóa tốt.
Hệ tiêu hóa hoạt động hiệu quả.
Hấp thụ tối đa thức ăn, vitamin, khoáng chất
•Healthy Skin & Shiny Coat:
Da khỏe mạnh và long bóng mượt.
Nhờ có Omega 6 & 3 cùng các axit béo cần thiết cho da và lông của chó.
•Strong Teeth and Bone Development:
cho răng và xương chắc khỏe.
Bổ sung Canxi, Photpho và chất khoáng thiết yếu cho xương và răng phát triển chắc khỏe
', N'7.jpg', 1, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (8, N'Thức ăn chó Smart heart Small Breed Puppy gói 450gr', 487.000, N'Gói', N'THỨC ĂN CHÓ SMARTHEART SMALL BREED PUPPY
- CHO CÚN CON “YUMMY”
+ Dinh dưỡng trong giai đoạn đầu vô cùng quan trọng, ảnh hưởng đến tốc độ phát triển và sức khỏe của Cún khi trưởng thành.
+ Nghiên cứu phù hợp với hệ tiêu hóa còn non yếu.
+ Thức ăn hạt SmartHeart Small Breed Puppy chứa nguồn dinh dưỡng cân bằng:
DHA & Colin.
Omega 3 & 6.
Vitamin E và Canxi là lựa chọn lý tưởng cho Cún phát triển toàn diện.
+ Đặc biệt, sản phẩm còn gây ấn tượng bởi thành phần GOS hỗ trợ tốt vi sinh vật dạ dày, cải thiện hệ tiêu hóa cho Cún con.
+ Chọn mua SmartHeart Small Breed Puppy, Sen yên tâm để Cún ăn ngon, chóng lớn!
+ Xem thêm nhiều sản phẩm tại: https://petyeu.com.vn/
', N'8.jpg', 1, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (9, N'ROYAL CANIN MEDIUM ADULT - Thức ăn dành cho lớn giống trung bình bao 10kg', 980.000, N'Gói', N'THỨC ĂN CHO CHÓ ROYAL CANIN MEDIUM ADULT
Dành cho chó kích cỡ Medium (cân nặng tối đa từ 11 - 25 kg) và đang trong lứa tuổi Puppy từ 12 tháng tuổi trở lên.
Những giống chó size Medium được biết đến có nguồn năng lượng dồi dào vì đa số giống chó này được sử dụng hỗ trợ trong các công việc của con người từ rất lâu. Cho dù giống chó size Medium này được nuôi trong nhà hay dành thời gian hoạt động ngoài trời, với ROYAL CANIN Medium Adult sẽ giúp giống chó này duy trì khả năng phòng thủ tự nhiên trong suốt vòng đời của chúng, đồng thời cung cấp năng lượng cân bằng cho giống chó này giúp duy trì trọng lượng khỏe mạnh.
+ Giúp duy trì sức khoẻ tiêu hóa
+ Hỗ trợ nhu cầu năng lượng cao cho sự tăng trưởng mạnh mẽ
+ Hỗ trợ sự phát triển xương
+ Hỗ trợ sức khỏe hệ thống miễn dịch
+ 100% dinh dưỡng cân bằng
+ 100% đảm bảo an toàn
Hạt được thiết kế đặc biệt cho giống chó cỡ trung để khuyến khích nhai.
', N'9.jpg', 1, 5, CAST(0x95270000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (10, N'Pedigree Adult 80gr - Sốt chó lớn gà gan và rau
', 12.000, N'Gói', N'Sản phẩm Sốt Pedigree Adult vị gà gan và rau sẽ cung cấp cho cún những lợi ích sau:     
+ Trộn với cơm hoặc hạt khô để tạo bữa ăn dinh dưỡng với thịt nguyên chất đậm đà và nước sốt thơm ngon.
+ Có nhiều vị cho chó thay đổi: vị gà, vị bò, vị gan.
+ Cung cấp đủ dinh dưỡng, vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giúp cún cưng khỏe mạnh, năng động và thân thiện. 
+ Giúp cún dễ tiêu hóa, bảo vệ đường ruột. Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa. 
+ Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị.
+ Làm đa dạng bữa ăn của cún với các công thức: thức ăn hạt + sốt, cơm + Sốt 
+ Chứa nhiều Omega 6, kẽm và các vitamin được khoa học chứng minh sẽ mang đến cho cún một bộ lông bóng mượt, thích mắt.
', N'10.jpg', 2, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (11, N'Pedigree Puppy 130gr - Sốt chó con vị gà nấu sốt
', 18.000, N'Gói', N'Sản phẩm Sốt Pedigree Puppy vị gà nấu sốt sẽ cung cấp cho cún những lợi ích sau:     
+ Trộn với cơm hoặc hạt khô để tạo bữa ăn dinh dưỡng với thịt nguyên chất đậm đà và nước sốt thơm ngon.
+ Có nhiều vị cho chó thay đổi: vị gà, vị bò, vị gan.
+ Cung cấp đủ dinh dưỡng, vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giúp cún cưng khỏe mạnh, năng động và thân thiện. 
+ Giúp cún dễ tiêu hóa, bảo vệ đường ruột. Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa. 
+ Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị.
+ Làm đa dạng bữa ăn của cún với các công thức: thức ăn hạt + sốt, cơm + Sốt 
+ Chứa nhiều Omega 6, kẽm và các vitamin được khoa học chứng minh sẽ mang đến cho cún một bộ lông bóng mượt, thích mắt.
', N'11.jpg', 2, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (12, N'12 gói Pedigree Adult 80gr - Sốt chó lớn vị bò nướng Và rau
', 120.000, N'Gói', N'Sản phẩm Sốt Pedigree Adult vị bò nướng và rau sẽ cung cấp cho cún những lợi ích sau:     
+ Trộn với cơm hoặc hạt khô để tạo bữa ăn dinh dưỡng với thịt nguyên chất đậm đà và nước sốt thơm ngon.
+ Có nhiều vị cho chó thay đổi: vị gà, vị bò, vị gan.
+ Cung cấp đủ dinh dưỡng, vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giúp cún cưng khỏe mạnh, năng động và thân thiện. 
+ Giúp cún dễ tiêu hóa, bảo vệ đường ruột. Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa. 
+ Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị.
+ Làm đa dạng bữa ăn của cún với các công thức: thức ăn hạt + sốt, cơm + Sốt 
+ Chứa nhiều Omega 6, kẽm và các vitamin được khoa học chứng minh sẽ mang đến cho cún một bộ lông bóng mượt, thích mắt.
', N'12.jpg', 2, 5, CAST(0x94E80000 AS SmallDateTime), 65, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (13, N'Pedigree Adult 80gr - Sốt chó lớn vị bò nướng Và rau
', 12.000, N'Gói', N'Sản phẩm Sốt Pedigree Adult vị bò nướng và rau sẽ cung cấp cho cún những lợi ích sau:     
+ Trộn với cơm hoặc hạt khô để tạo bữa ăn dinh dưỡng với thịt nguyên chất đậm đà và nước sốt thơm ngon.
+ Có nhiều vị cho chó thay đổi: vị gà, vị bò, vị gan.
+ Cung cấp đủ dinh dưỡng, vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giúp cún cưng khỏe mạnh, năng động và thân thiện. 
+ Giúp cún dễ tiêu hóa, bảo vệ đường ruột. Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa. 
+ Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị.
+ Làm đa dạng bữa ăn của cún với các công thức: thức ăn hạt + sốt, cơm + Sốt 
+ Chứa nhiều Omega 6, kẽm và các vitamin được khoa học chứng minh sẽ mang đến cho cún một bộ lông bóng mượt, thích mắt.
', N'13.jpg', 2, 5, CAST(0x94E80000 AS SmallDateTime), 60, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (14, N'Bánh xương chăm sóc răng PEDIGREE DENTASTIX 75GR', 33.000, N'Gói', N'
+ Pedigree Dentastix được nghiên cứu tại trung tâm Dinh Dưỡng Thú Nuôi Waltham.
+ Được chứng minh lâm sàng giúp giảm đến 80% cao răng tích tụ khi được sử dụng như một phần của một thói quen chăm sóc răng miệng hàng ngày cho chó. 
+ Ngoài ra, hình dạng chữ X của DentaStix làm sạch kẽ răng và lợi chó yêu nhà bạn, giúp chúng có hàm răng sạch sẽ. 
+ Bánh mang hương vị hấp dẫn, đảm bảo chó yêu của bạn sẽ rất thích.
+ Cún sẽ rất vui khi bạn sử dụng bánh xương chăm sóc răng dành cho chó Pedigree như một phần của thói quen chăm sóc răng miệng hàng ngày của chúng.', N'16.jpg', 3, 2, CAST(0x94FD0000 AS SmallDateTime), 25, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (15, N'Bánh xương chăm sóc răng PEDIGREE DENTASTIX 60GR', 33.000, N'Gói', N'
+ Pedigree Dentastix được nghiên cứu tại trung tâm Dinh Dưỡng Thú Nuôi Waltham.
+ Được chứng minh lâm sàng giúp giảm đến 80% cao răng tích tụ khi được sử dụng như một phần của một thói quen chăm sóc răng miệng hàng ngày cho chó. 
+ Ngoài ra, hình dạng chữ X của DentaStix làm sạch kẽ răng và lợi chó yêu nhà bạn, giúp chúng có hàm răng sạch sẽ. 
+ Bánh mang hương vị hấp dẫn, đảm bảo chó yêu của bạn sẽ rất thích.
+ Cún sẽ rất vui khi bạn sử dụng bánh xương chăm sóc răng dành cho chó Pedigree như một phần của thói quen chăm sóc răng miệng hàng ngày của chúng.', N'17.jpg', 3, 3, CAST(0x94FD0000 AS SmallDateTime), 26, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (16, N'Bánh xương chăm sóc răng PEDIGREE DENTASTIX PUPPY 56GR', 33.000, N'Gói', N'
+ Pedigree Dentastix được nghiên cứu tại trung tâm Dinh Dưỡng Thú Nuôi Waltham.
+ Được chứng minh lâm sàng giúp giảm đến 80% cao răng tích tụ khi được sử dụng như một phần của một thói quen chăm sóc răng miệng hàng ngày cho chó. 
+ Ngoài ra, hình dạng chữ X của DentaStix làm sạch kẽ răng và lợi chó yêu nhà bạn, giúp chúng có hàm răng sạch sẽ. 
+ Bánh mang hương vị hấp dẫn, đảm bảo chó yêu của bạn sẽ rất thích.
+ Cún sẽ rất vui khi bạn sử dụng bánh xương chăm sóc răng dành cho chó Pedigree như một phần của thói quen chăm sóc răng miệng hàng ngày của chúng.', N'18.jpg', 3, 4, CAST(0x94FD0000 AS SmallDateTime), 29, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (17, N'Bánh xương chăm sóc răng PEDIGREE DENTASTIX 98GR', 35.000, N'Gói', N'
+ Pedigree Dentastix được nghiên cứu tại trung tâm Dinh Dưỡng Thú Nuôi Waltham.
+ Được chứng minh lâm sàng giúp giảm đến 80% cao răng tích tụ khi được sử dụng như một phần của một thói quen chăm sóc răng miệng hàng ngày cho chó. 
+ Ngoài ra, hình dạng chữ X của DentaStix làm sạch kẽ răng và lợi chó yêu nhà bạn, giúp chúng có hàm răng sạch sẽ. 
+ Bánh mang hương vị hấp dẫn, đảm bảo chó yêu của bạn sẽ rất thích.
+ Cún sẽ rất vui khi bạn sử dụng bánh xương chăm sóc răng dành cho chó Pedigree như một phần của thói quen chăm sóc răng miệng hàng ngày của chúng.', N'19.jpg', 3, 5, CAST(0x94FD0000 AS SmallDateTime), 35, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (18, N'Snackie vị bò 70gr', 37.000, N'Gói', N'SNACKIE - GREAT TASTE!
+ Bánh thưởng cao cấp SNACKIE nhập khẩu 100% từ Thái Lan
+ Được làm từ 100% THỊT GÀ THẬT
+ Nguyên liệu được chọn lọc kỹ lưỡng và sản xuất bởi công nghệ hiện tại , theo tiêu chuẩn quốc tế
+ SNACKIE mang đến hương vị thơm ngon hoàn hảo,xứng đáng là quà thưởng cho các bé chó trong lúc huấn luyện , hoặc có thể làm món ăn văt khi sen chơi cùng bé.
+ Hương vị đa dạng kích thích sự ngon miệng của cún, dạng que mềm dễ ăn tạo sự thích thú cho bé
+ SNACKIE có nhiều vị thay đổi cho bé:
- Vị Sữa : thơm ngon
- Vị Bò : thơm lừng
- Vị thịt heo xông khói.
- Vị cải bó xôi : bổ sung chất xơ cho sự phát triển của bé.
- Vị Cà Rốt : bổ sung chất xơ.', N'20.jpg', 3, 6, CAST(0x94FD0000 AS SmallDateTime), 25, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (19, N'Snackie vị heo muối que 70gr', 37.000, N'Gói', N'SNACKIE - GREAT TASTE!
+ Bánh thưởng cao cấp SNACKIE nhập khẩu 100% từ Thái Lan
+ Được làm từ 100% THỊT GÀ THẬT
+ Nguyên liệu được chọn lọc kỹ lưỡng và sản xuất bởi công nghệ hiện tại , theo tiêu chuẩn quốc tế
+ SNACKIE mang đến hương vị thơm ngon hoàn hảo,xứng đáng là quà thưởng cho các bé chó trong lúc huấn luyện , hoặc có thể làm món ăn văt khi sen chơi cùng bé.
+ Hương vị đa dạng kích thích sự ngon miệng của cún, dạng que mềm dễ ăn tạo sự thích thú cho bé
+ SNACKIE có nhiều vị thay đổi cho bé:
- Vị Sữa : thơm ngon
- Vị Bò : thơm lừng
- Vị thịt heo xông khói.
- Vị cải bó xôi : bổ sung chất xơ cho sự phát triển của bé.
- Vị Cà Rốt : bổ sung chất xơ.', N'21.jpg', 3, 2, CAST(0x94FD0000 AS SmallDateTime), 39, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (20, N'Thức ăn hạt mềm cho chó Zenith PUPPY vị Gà & Khoai Tây 1.2kg', 220.000, N'Gói', N'Thức  ăn hạt mềm cho chó Zenith PUPPY vị Gà & Khoai Tây 1.2kg
Thuộc dòng sản phẩm thức ăn hạt mềm cao cấp cho thú cưng. 
Thức ăn hạt mềm chó con Zenith Puppy được chế biến từ thịt cừu tươi, thịt nạc gà rút xương, gạo lứt, yến mạch và dầu cá hồi.
Với các thành phần tươi sạch, giàu dinh dưỡng.
Zenith Puppy hạt mềm, cung cấp độ ẩm cao và lượng muối thấp, thơm ngon, dễ nhai, dễ tiêu hóa và tốt cho sức khỏe chó con. 
Dành cho chó con dưới 1 tuổi 
Không chứa ngũ cốc.
Không gây dị ứng.
Được chế biến từ thịt cừu, bột gà, gạo lứt, yến mạch.
Giúp giảm bớt mùi phân và mùi cơ thể.
Giúp tăng cường sức đề kháng, phòng ngừa bệnh tật.
Làm đẹp da, đẹp lông.
Cung cấp chất dinh dưỡng cần thiết cho sự tăng trưởng của chó con.
Giúp tăng cường sức khỏe đường ruột, tiêu hóa tốt, ngừa tiêu chảy.', N'22.jpg', 4, 2, CAST(0x94FD0000 AS SmallDateTime), 40, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (21, N'Thức ăn cho chó Dr.Soft Salmon & Potato 3kg', 550.000, N'Gói', N'
Tên sản phẩm: Thức ăn hỗn hợp hoàn chỉnh cho chó vị cá hồi và khoai tây
Công dụng : Dùng làm thức ăn cho chó trên 2 tháng tuổi
Trọng lượng : 3kg(500g x 6gói)
Hạn sử dụng : 18 tháng từ ngày sản xuất
Liều dùng: In trên bao bì
Chỉ tiêu chất lượng:
Protein thô ≥ 26%; Béo thô  ≥ 12%; canxi: 0.5% - 1.5%;
Photpho: 0.5% - 1.5%; xơ thô  ≤ 5%;  tro thô  ≤ 10%; độ ẩm ≤23%
Thành phần chính: Bột thịt cừu, bột đậu nành, lúa mì, bột ngô, bột gà, bột khoai tây, dầu gà tinh chế, Glycerin, axit béo Omega 3,  β-glucan, Fructooligosaccharide, Chlorella, bột trà xanh, bột quả việt quất, bột nam việt quất, chiết xuất Yucca, Choline chloride, hỗn hợp axit amin, hỗn hợp khoáng chất (canxi , photpho, kẽm …), chất bảo quản, màu thực phẩm, Chondroitin, Glucosamine, cà rốt
*  Đặc điểm:
Chó con có bộ răng còn yếu khi ăn thức ăn cứng sẽ gây tác động xấu đến răng, chó con thường nhai, nuốt thức ăn nhanh, do đó làm giảm tỷ lệ tiêu hóa, không tốt cho sức khỏe.
Dr.Soft Grainfree là loại thức ăn mềm, không gây gánh nặng lên bộ răng, là loại thức ăn giúp cải thiện tỷ lệ tiêu hóa.
Để hạn chế tối đa việc dị ứng ngũ cốc cho chó cưng, chúng tôi không sử dụng các loại hạt gây dị ứng cao.
Da, lông : Thành phần dầu cá hồi chứa lượng Axit béo Omega-3 và DHA dồi dào giúp làm mượt lông, phát triển não bộ.
Tỷ lệ tiêu hóa cao: Hình thái sản phẩm mềm, xốp được sản xuất bằng kinh nghiệm độc quyền, giúp khả năng tiêu hóa khỏe, làm kích thích vị giác, thú cưng thích ăn hơn.
Hệ xương: Chứa hàm lượng Chondroitin, Glucosamine giúp hình thành hệ xương chắc khỏe.
Tuần hoàn : Chứa thành phần vitamin, khoáng chất, axit amin, giúp tăng cường sinh lực, đốt cháy mỡ, làm tăng sức khỏe cho thú cưng.
Miễn dịch : Tăng cường hệ miễn dịch nhờ thành phần β-glucan
Tăng cường sức khỏe đường ruột nhờ Fructooligosaccharide
Đây là loại thức ăn đã mềm, ẩm nên không cần thiết phải ngâm trong nước rồi mới cho ăn như các loại thức ăn vật nuôi khác', N'23.jpg', 4, 5, CAST(0x94FD0000 AS SmallDateTime), 10, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (22, N'Thức ăn cho chó DR.Soft Duck Grain Free 1.2kg',265.000, N'Gói', N'
Tên sản phẩm: Thức ăn hỗn hợp hoàn chỉnh cho chó vị vịt
Công dụng : Dùng làm thức ăn cho chó trên 2 tháng tuổi
Trọng lượng : 1.2kg(300g x 4gói)
Hạn sử dụng : 18 tháng kể từ ngày sản xuất
Liều dùng: In trên bao bì
Chỉ tiêu chất lượng:
Protein thô≥ 22%; Béo thô  ≥ 9%; canxi: 0.7% - 1.5%;
Photpho: 0.7% - 1.5%; xơ thô  ≤ 5%;  tro thô  ≤ 12%; độ ẩm ≤23%
Thành phần chính: Bột thịt vịt, Cá hồi thủy phân, Tinh bột sắn, Bột đậu, Thịt gà thủy phân, Dầu gà tinh chế, Glycerin, MSM,Chondroitin, Glucosamine, Vitamin hỗn hợp(A, B12, D, E, …), nguyên tố hỗn hợp (khoáng chất), hỗn hợp (canxi ion, Ferric citrate, kẽm oxide), Axit amin (DL-Methionine, L-Lysine, ...), Màu thực phẩm  
*  Đặc điểm:
Chó con có bộ răng còn yếu khi ăn thức ăn cứng sẽ gây tác động xấu đến răng, chó con thường nhai, nuốt thức ăn nhanh, do đó làm giảm tỷ lệ tiêu hóa, không tốt cho sức khỏe.
Dr.Soft Grainfree là loại thức ăn mềm, không gây gánh nặng lên bộ răng, là loại thức ăn giúp cải thiện tỷ lệ tiêu hóa.
Để hạn chế tối đa việc dị ứng ngũ cốc cho chó cưng, chúng tôi không sử dụng các loại hạt gây dị ứng cao.
Da, lông : Thành phần dầu cá hồi chứa lượng Axit béo Omega-3 và DHA dồi dào giúp làm mượt lông, phát triển não bộ.
Tỷ lệ tiêu hóa cao: Hình thái sản phẩm mềm, xốp được sản xuất bằng kinh nghiệm độc quyền, giúp khả năng tiêu hóa khỏe, làm kích thích vị giác, thú cưng thích ăn hơn.
Hệ xương: Chứa hàm lượng Chondroitin, Glucosamine giúp hình thành hệ xương chắc khỏe.
Tuần hoàn : Chứa thành phần vitamin, khoáng chất, axit amin, giúp tăng cường sinh lực, đốt cháy mỡ, làm tăng sức khỏe cho thú cưng.
Miễn dịch : Tăng cường hệ miễn dịch nhờ thành phần β-glucan
Tăng cường sức khỏe đường ruột nhờ Fructooligosaccharide
Đây là loại thức ăn đã mềm, ẩm nên không cần thiết phải ngâm trong nước rồi mới cho ăn như các loại thức ăn vật nuôi khác.', N'24.jpg', 4, 4, CAST(0x94FD0000 AS SmallDateTime), 19, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (23, N'Thức ăn cho chó con Dr. Soft Lamb for Puppy 1.2Kg',285.000, N'Gói', N'
Tên sản phẩm: Thức ăn hỗn hợp hoàn chỉnh cho chó con vị cừu
Công dụng : Dùng làm thức ăn cho chó trên 4 tuần tuổi
Trọng lượng : 1.2kg(300g x 4gói) 
Hạn sử dụng : 18 tháng kể từ ngày sản xuất
Liều dùng: In trên bao bì
Thành phần chính: Bột thịt cừu, bột đậu nành, lúa mì, bột ngô, bột gà, bột khoai tây, dầu gà tinh chế, Glycerin, axit béo Omega 3,  β-glucan, Fructooligosaccharide, Chlorella, bột trà xanh, bột quả việt quất, bột nam việt quất, chiết xuất Yucca, Choline chloride, hỗn hợp axit amin, hỗn hợp khoáng chất (canxi , photpho, kẽm …), chất bảo quản, màu thực phẩm, Chondroitin, Glucosamine, cà rốt
Chỉ tiêu chất lượng:
Protein thô ≥ 27%; Béo thô  ≥ 13%; canxi: 0.5% - 1.5%;
Photpho: 0.5% - 1.5%; xơ thô  ≤ 5%;  tro thô  ≤ 10%; độ ẩm ≤23%
*  Đặc điểm:
Loại mềm không gây hại cho răng thú cưng
Thức ăn cho cún cưng mềm và xốp.
Chuyên dành cho cún cưng dễ dị ứng, giúp làm đẹp da, lông, chắc xương
Tăng tỷ lệ tiêu hóa
1.KHÔNG hương liệu tổng hợp
2.KHÔNG màu tổng hợp
3.KHÔNG MSG
Da, lông : Thành phần dầu cá hồi chứa lượng Axit béo Omega-3 và DHA dồi dào giúp làm mượt lông, phát triển não bộ.
Tỷ lệ tiêu hóa cao: Hình thái sản phẩm mềm, xốp được sản xuất bằng kinh nghiệm độc quyền, giúp khả năng tiêu hóa khỏe, làm kích thích vị giác, thú cưng thích ăn hơn.
Hệ xương: Chứa hàm lượng Chondroitin, Glucosamine giúp hình thành hệ xương chắc khỏe.
Tuần hoàn : Chứa thành phần vitamin, khoáng chất, axit amin, giúp tăng cường sinh lực, đốt cháy mỡ, làm tăng sức khỏe cho thú cưng.
Miễn dịch : Tăng cường hệ miễn dịch nhờ thành phần β-glucan
 Đáp ứng tiêu chuẩn dinh dưỡng theo quy định của AAFCO (Hiệp hội quản lý thức ăn vật nuôi của Mỹ)
Chứa chiết xuất thực vật Yucca, giúp giảm sự thay đổi mùi vị cho vật nuôi.
Đây là loại thức ăn đã mềm, ẩm nên không cần thiết phải ngâm trong nước rồi mới cho ăn như các loại thức ăn vật nuôi khác.', N'25.jpg', 4, 2, CAST(0x94FD0000 AS SmallDateTime), 10, 0)
INSERT [dbo].[THUCAN] ([MaThucAn], [TenThucAn], [DonGia], [Donvitinh], [Mota], [Hinhminhhoa], [MaLoai], [MaNSX], [Ngaycapnhat], [Soluongban], [Solanxem]) VALUES (24, N'Thức ăn cho chó Dr. Soft Lamb For breed all 1.2 kg',265.000, N'Gói', N'
Tên sản phẩm: Thức ăn hỗn hợp hoàn chỉnh cho chó vị cừu
Công dụng : Dùng làm thức ăn cho chó trên 2 tháng tuổi
Trọng lượng : 1.2kg(300g x 4gói) 
Hạn sử dụng : 18 tháng kể từ ngày sản xuất
Liều dùng : In trên bao bì
Thành phần chính: Bột thịt cừu, bột đậu nành, lúa mì, bột ngô, bột gà, bột khoai tây, Dầu gà tinh chế, Glycerin, axit béo Omega 3,  β-glucan, Fructooligosaccharide, Chlorella, bột trà xanh, bột quả việt quất, bột nam việt quất, chiết xuất Yucca, Choline chloride, hỗn hợp axit amin, hỗn hợp vitamin, hỗn hợp khoáng chất (canxi , photpho, kẽm …), chất bảo quản, màu thực phẩm, Glucosamine, Chondroitin
Chỉ tiêu chất lượng:
Protein thô ≥ 26%; Béo thô  ≥ 12%; canxi: 0.5% - 1.5%;
Photpho: 0.5% - 1.5%; xơ thô  ≤ 5%;  tro thô  ≤ 10%; độ ẩm ≤23%
*  Đặc điểm:
Loại mềm không gây hại cho răng thú cưng
Thức ăn cho cún cưng mềm và xốp.
Chuyên dành cho cún cưng dễ dị ứng, giúp làm đẹp da, lông, chắc xương
Tăng tỷ lệ tiêu hóa
1.KHÔNG hương liệu tổng hợp
2.KHÔNG màu tổng hợp
3.KHÔNG MSG
Da, lông : Thành phần dầu cá hồi chứa lượng Axit béo Omega-3 và DHA dồi dào giúp làm mượt lông, phát triển não bộ.
Tỷ lệ tiêu hóa cao: Hình thái sản phẩm mềm, xốp được sản xuất bằng kinh nghiệm độc quyền, giúp khả năng tiêu hóa khỏe, làm kích thích vị giác, thú cưng thích ăn hơn.
Hệ xương: Chứa hàm lượng Chondroitin, Glucosamine giúp hình thành hệ xương chắc khỏe.
Tuần hoàn : Chứa thành phần vitamin, khoáng chất, axit amin, giúp tăng cường sinh lực, đốt cháy mỡ, làm tăng sức khỏe cho thú cưng.
Miễn dịch : Tăng cường hệ miễn dịch nhờ thành phần β-glucan
 Đáp ứng tiêu chuẩn dinh dưỡng theo quy định của AAFCO (Hiệp hội quản lý thức ăn vật nuôi của Mỹ)
Chứa chiết xuất thực vật Yucca, giúp giảm sự thay đổi mùi vị cho vật nuôi.
Đây là loại thức ăn đã mềm, ẩm nên không cần thiết phải ngâm trong nước rồi mới cho ăn như các loại thức ăn vật nuôi khác.', N'26.jpg', 4, 2, CAST(0x94FD0000 AS SmallDateTime), 25, 0)
SET IDENTITY_INSERT [dbo].[THUCAN] OFF

/****** Object:  Table [dbo].[THAMGIA]    Script Date: 10/19/2010 13:14:22 ******/


/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Trigia], [Dagiao], [Ngaygiaohang]) VALUES (1, 1, CAST(0x9D500000 AS SmallDateTime),  CAST(75000.00 AS Decimal(9, 2)), 0, CAST(0x9D500000 AS SmallDateTime))
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Trigia], [Dagiao], [Ngaygiaohang]) VALUES (2, 1, CAST(0x9DA30000 AS SmallDateTime),  CAST(80000.00 AS Decimal(9, 2)), 0, CAST(0x9DA30000 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF

/****** Object:  Table [dbo].[CTDATHANG]    Script Date: 10/19/2010 13:14:22 ******/
INSERT [dbo].[CTDATHANG] ([SoDH], [MaThucAn], [Soluong], [DonGia]) VALUES (1, 19, 1, 25000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaThucAn], [Soluong], [DonGia]) VALUES (1, 23, 2, 25000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaThucAn], [Soluong], [DonGia]) VALUES (2, 1, 1, 26000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaThucAn], [Soluong], [DonGia]) VALUES (2, 17, 3, 18000)





CREATE TABLE ADMIN
(
	MaAdmin INT IDENTITY(1,1),
	HoTenAdmin nVarchar(50),
	DiaChiAdmin nVarchar(50),
	DienThoaiAdmin Varchar(10),
	TenDNAdmin Varchar(15),
	MatKhauAdmin Varchar(15),
	NgaySinhAdmin SMALLDATETIME,
	GioiTinhAdmin Bit Default 1,
	EmailAdmin Varchar(50),
	QuyenAdmin Int Default 1,
	CONSTRAINT PK_Admin PRIMARY KEY(MaAdmin)
)
GO

/****** Object:  Table [dbo].[ADMIN]    Script Date: 10/19/2010 13:14:22 ******/
SET IDENTITY_INSERT [dbo].[ADMIN] ON
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin],[QuyenAdmin]) VALUES (1, N'Võ Quốc Lương', N'Phú Hòa', N'0988936592', N'luongvq', N'12345', CAST(0x59310000 AS SmallDateTime), 1, N'luongvq@tdmu.edu.vn',1)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin],[QuyenAdmin]) VALUES (2, N'Võ Nguyễn Nhật Minh', N'Phú Hòa', N'012344444', N'minhvnn', N'12345', CAST(0x59310000 AS SmallDateTime), 1, N'minhvnn@tdmu.edu.vn',2)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin],[QuyenAdmin]) VALUES (3, N'Võ Nguyễn Thái Hoàng', N'Phú Hòa', N'012344444', N'hoangvnt', N'12345', CAST(0x59310000 AS SmallDateTime), 1, N'hoangvnt@tdmu.edu.vn',2)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF