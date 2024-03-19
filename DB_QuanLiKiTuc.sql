create database QuanLiKiTuc_PRN211_V2
USE [QuanLiKiTuc_PRN211_V2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[maday] [nvarchar](20) NOT NULL,
	[tenday] [nvarchar](50) NULL,
	[quanly] [nvarchar](50) NULL,
	[trangthai][nvarchar](20) NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[maday] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyLuat](
	[makyluat] [int] IDENTITY(1,1) NOT NULL,
	[masv] [nchar](10) NULL,
	[kyluat] [nvarchar](50) NULL,
	[ngaykyluat] [date] NULL,
	[tienphat] [money] NULL,
 CONSTRAINT [PK_KyLuat] PRIMARY KEY CLUSTERED 
(
	[makyluat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[manguoidung] [int] IDENTITY(1,1) NOT NULL,
	[manv] [nchar](10) NULL,
	[tendangnhap] [nchar](30) NULL,
	[matkhau] [nchar](25) NULL,
	[quyen] [nchar](10) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[manguoidung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[manv] [nchar](10) NOT NULL,
	[tennv] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](10) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](50) NULL,
	[sodienthoai] [nchar](15) NULL,
	[hesoluong] [float] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maphong] [nchar](10) NOT NULL,
	[tenphong] [nvarchar](50) NULL,
	[sosv] [int] NULL,
	[sosvtoida] [int] NULL,
	[tinhtrang] [nvarchar](50) NULL,
	[loaiphong] [nvarchar](50) NULL,
	[xeploai] [nvarchar](50) NULL,
	[day] [nchar](10) NULL,
	[chisocu] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[masv] [nchar](10) NOT NULL,
	[tensv] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[quequan] [nvarchar](50) NULL,
	[khoa] [nchar](10) NULL,
	[lop] [nvarchar](50) NULL,
	[maphong] [nchar](10) NULL,
	[loaiuutien] [nvarchar](50) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienDangKy](
	[masvdky] [nchar](10) NOT NULL,
	[tensv] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[quequan] [nvarchar](50) NULL,
	[khoa] [nchar](10) NULL,
	[lop] [nvarchar](50) NULL,
	[maphong] [nchar](10) NULL,
	[loaiuutien] [nvarchar](50) NULL,
 CONSTRAINT [PK_SinhVienDangKy] PRIMARY KEY CLUSTERED 
(
	[masvdky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TienDien](
	[mahoadon] [int] IDENTITY(1,1) NOT NULL,
	[maphong] [nchar](10) NULL,
	[ngaylap] [date] NULL,
	[sodientieuthu] [int] NULL,
	[tongtien] [money] NULL,
	[trangthai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TienDien] PRIMARY KEY CLUSTERED 
(
	[mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Day] ([maday], [tenday], [quanly], [trangthai]) VALUES (N'd1', N'Dãy 1', N'Minh', N'Bình th??ng')
INSERT [dbo].[Day] ([maday], [tenday], [quanly], [trangthai]) VALUES (N'd2', N'Dãy 2', N'Minhdao', N'Bình th??ng')
INSERT [dbo].[Day] ([maday], [tenday], [quanly], [trangthai]) VALUES (N'd3', N'Dãy 3', N'Minhnhat', N'Bình th??ng')
GO
SET IDENTITY_INSERT [dbo].[KyLuat] ON 

INSERT [dbo].[KyLuat] ([makyluat], [masv], [kyluat], [ngaykyluat], [tienphat]) VALUES (1, N'sv01', N'D?p c?u dao ký túc xá', CAST(N'2024-03-16' AS Date), 100000.0000)
INSERT [dbo].[KyLuat] ([makyluat], [masv], [kyluat], [ngaykyluat], [tienphat]) VALUES (2, N'sv02', N'?ánh nhau', CAST(N'2024-03-17' AS Date), 50000.0000)
SET IDENTITY_INSERT [dbo].[KyLuat] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([manguoidung], [manv], [tendangnhap], [matkhau], [quyen]) VALUES (1, N'nv01', N'admin', N'123', N'Admin')
INSERT [dbo].[NguoiDung] ([manguoidung], [manv], [tendangnhap], [matkhau], [quyen]) VALUES (2, N'nv02', N'minh', N'123', N'Admin')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
INSERT [dbo].[NhanVien] ([manv], [tennv], [gioitinh], [ngaysinh], [diachi], [sodienthoai], [hesoluong]) VALUES (N'nv01', N'Admin', N'Nam', CAST(N'2003-06-10' AS Date), N'Hà N?i', N'0961442231', 100000)
INSERT [dbo].[NhanVien] ([manv], [tennv], [gioitinh], [ngaysinh], [diachi], [sodienthoai], [hesoluong]) VALUES (N'nv02', N'minh', N'Nam', CAST(N'2003-06-10' AS Date), N'Hà Nam', N'0961442231', 200000)
INSERT [dbo].[NhanVien] ([manv], [tennv], [gioitinh], [ngaysinh], [diachi], [sodienthoai], [hesoluong]) VALUES (N'nv03', N'Minh ?ào', N'N?', CAST(N'2003-06-10' AS Date), N'Hà T?nh', N'0961442231', 300000)
INSERT [dbo].[NhanVien] ([manv], [tennv], [gioitinh], [ngaysinh], [diachi], [sodienthoai], [hesoluong]) VALUES (N'nv04', N'Minh Nh?t', N'Nam', CAST(N'2003-06-10' AS Date), N'Thanh Hóa', N'0961442231', 400000)
GO
INSERT [dbo].[Phong] ([maphong], [tenphong], [sosv], [sosvtoida], [tinhtrang], [loaiphong], [xeploai], [day], [chisocu]) VALUES (N'p101', N'Phòng 101', 4, 5, N'Thi?u', N'Nam', N'Th??ng', N'd1', 20)
INSERT [dbo].[Phong] ([maphong], [tenphong], [sosv], [sosvtoida], [tinhtrang], [loaiphong], [xeploai], [day], [chisocu]) VALUES (N'p102', N'Phòng 102', 3, 3, N'??', N'Nam', N'Vip', N'd1', 15)
INSERT [dbo].[Phong] ([maphong], [tenphong], [sosv], [sosvtoida], [tinhtrang], [loaiphong], [xeploai], [day], [chisocu]) VALUES (N'p103', N'Phòng 103', 3, 5, N'Thi?u', N'N?', N'Th??ng', N'd2', 0)
GO
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv01', N'Minh', N'Nam', CAST(N'2003-06-10' AS Date), N'Hà N?i', N'K17', N'SE1752', N'p101', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv02', N'Zellis', N'Nam', CAST(N'2003-06-10' AS Date), N'H?i Phòng', N'K17', N'SE1752', N'p101', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv03', N'Zekken', N'Nam', CAST(N'2003-06-10' AS Date), N'Bình D??ng', N'K17', N'SE1754', N'p102', N'Gia ?ình th??ng binh li?t s?')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv04', N'Ly', N'N?', CAST(N'2003-06-10' AS Date), N'Bình D??ng', N'K17', N'SE1753', N'p103', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv05', N'Thu', N'N?', CAST(N'2003-06-10' AS Date), N'Bình D??ng', N'K17', N'SE1752', N'p103', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv06', N'H??ng', N'N?', CAST(N'2003-06-10' AS Date), N'Somewhere', N'K18', N'SE1752', N'p103', N'Du h?c sinh')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv08', N'Phúc', N'Nam', CAST(N'2003-06-10' AS Date), N'Tây Nguyên', N'K18', N'SE1756', N'p101', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv09', N'Aleck', N'Nam', CAST(N'2003-06-10' AS Date), N'H? Long', N'K17', N'SE1755', N'p101', N'Bình th??ng')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv10', N'Sacy', N'Nam', CAST(N'2003-06-10' AS Date), N'Cao B?ng', N'K17', N'SE1754', N'p102', N'Du h?c sinh')
INSERT [dbo].[SinhVien] ([masv], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv12', N'Johnqt', N'Nam', CAST(N'2003-06-10' AS Date), N'Ninh Bình', N'K19', N'SE1753', N'p102', N'Bình th??ng')
GO
INSERT [dbo].[SinhVienDangKy] ([masvdky], [tensv], [gioitinh], [ngaysinh], [quequan], [khoa], [lop], [maphong], [loaiuutien]) VALUES (N'sv11', N'??ng Kí', N'Nam', CAST(N'2003-06-04' AS Date), N'Ninh Bình', N'K16', N'SE1616', N'p101', N'Bình th??ng')

SET IDENTITY_INSERT [dbo].[TienDien] ON 

INSERT [dbo].[TienDien] ([mahoadon], [maphong], [ngaylap], [sodientieuthu], [tongtien], [trangthai]) VALUES (2, N'p101', CAST(N'2024-03-17' AS Date), 10, 30000.0000, N'Ch?a thanh toán')
INSERT [dbo].[TienDien] ([mahoadon], [maphong], [ngaylap], [sodientieuthu], [tongtien], [trangthai]) VALUES (3, N'p101', CAST(N'2024-03-17' AS Date), 10, 30000.0000, N'Ðã thanh toán')
INSERT [dbo].[TienDien] ([mahoadon], [maphong], [ngaylap], [sodientieuthu], [tongtien], [trangthai]) VALUES (4, N'p102', CAST(N'2024-03-11' AS Date), 15, 45000.0000, N'Ch?a thanh toán')
SET IDENTITY_INSERT [dbo].[TienDien] OFF
GO
ALTER TABLE [dbo].[KyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KyLuat_SinhVien] FOREIGN KEY([masv])
REFERENCES [dbo].[SinhVien] ([masv])
GO
ALTER TABLE [dbo].[KyLuat] CHECK CONSTRAINT [FK_KyLuat_SinhVien]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_NhanVien] FOREIGN KEY([manv])
REFERENCES [dbo].[NhanVien] ([manv])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_NhanVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_Day] FOREIGN KEY([day])
REFERENCES [dbo].[Day] ([maday])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_Day]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Phong] FOREIGN KEY([maphong])
REFERENCES [dbo].[Phong] ([maphong])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Phong]
GO
ALTER TABLE [dbo].[ThietBi]  WITH CHECK ADD  CONSTRAINT [FK_ThietBi_Phong] FOREIGN KEY([maphong])
REFERENCES [dbo].[Phong] ([maphong])
GO
ALTER TABLE [dbo].[ThietBi] CHECK CONSTRAINT [FK_ThietBi_Phong]
GO
ALTER TABLE [dbo].[TienDien]  WITH CHECK ADD  CONSTRAINT [FK_TienDien_Phong] FOREIGN KEY([maphong])
REFERENCES [dbo].[Phong] ([maphong])
GO
ALTER TABLE [dbo].[TienDien] CHECK CONSTRAINT [FK_TienDien_Phong]
GO
