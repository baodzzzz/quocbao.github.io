USE [Project_PRJ]
GO
/****** Object:  Table [dbo].[account]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[active_code] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NULL,
	[categoryName] [varchar](255) NULL,
	[status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] NOT NULL,
	[productId] [int] NULL,
	[imageUrl] [nvarchar](200) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [bigint] NOT NULL,
	[account_id] [bigint] NULL,
	[totalPrice] [float] NULL,
	[note] [varchar](255) NULL,
	[created_Date] [date] NULL,
	[status] [int] NULL,
	[shipping_id] [bigint] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[quantity] [int] NULL,
	[productPrice] [float] NULL,
	[productName] [varchar](255) NULL,
	[productImage] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] NULL,
	[code] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](255) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[status] [int] NULL,
	[subCategory_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_account]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_account](
	[id] [int] NULL,
	[role] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping](
	[id] [bigint] NOT NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[address] [varchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_account]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_account](
	[id] [int] NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_category]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_category](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_order]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_order](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_product]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_product](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_sub_category]    Script Date: 10/20/2021 10:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_sub_category](
	[id] [int] NULL,
	[status] [varchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [password], [address], [email], [phone], [role_id], [status], [active_code]) VALUES (N'admin', N'admin', N'Hai Duong', N'quocbao170801@gmail.com', N'099999999', 1, 1, NULL)
INSERT [dbo].[account] ([username], [password], [address], [email], [phone], [role_id], [status], [active_code]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (1, N'Nike', 1)
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (2, N'Converse', 1)
INSERT [dbo].[category] ([id], [categoryName], [status]) VALUES (3, N'Adidas', 1)
GO
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (1, 1, N'product-details/product1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (2, 1, N'product-details/fragment.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (3, 1, N'product-details/fragment-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (4, 1, N'product-details/fragment-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (5, 2, N'product-details/product2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (6, 2, N'product-details/jd1-travisscott-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (7, 2, N'product-details/jd1-travisscott-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (8, 2, N'product-details/jd1-travisscott-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (9, 3, N'product-details/product3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (10, 3, N'product-details/Hyper Royal1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (11, 3, N'product-details/Hyper Royal2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (12, 3, N'product-details/Hyper Royal3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (13, 4, N'product-details/product4.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (14, 4, N'product-details/jddior-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (15, 4, N'product-details/jddior-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (16, 4, N'product-details/jddior-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (17, 5, N'product-details/product5.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (18, 5, N'product-details/GIÀY FORUM LOW-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (19, 5, N'product-details/GIÀY FORUM LOW-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (20, 5, N'product-details/GIÀY FORUM LOW-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (21, 6, N'static/images/product-details/product6.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (22, 6, N'static/images/product-details/1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (23, 6, N'static/images/product-details/2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (24, 6, N'static/images/product-details/3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (25, 7, N'static/images/product-details/product7.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (26, 7, N'static/images/product-details/GIÀY ZX 1K BOOST-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (27, 7, N'static/images/product-details/GIÀY ZX 1K BOOST-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (28, 7, N'static/images/product-details/GIÀY ZX 1K BOOST-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (29, 8, N'static/images/product-details/product8.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (30, 8, N'static/images/product-details/cvfogb-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (31, 8, N'static/images/product-details/cvfogb-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (32, 8, N'static/images/product-details/cvfogb-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (33, 9, N'static/images/product-details/product9.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (34, 9, N'static/images/product-details/similar1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (35, 9, N'static/images/product-details/similar2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (36, 9, N'static/images/product-details/similar3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (37, 10, N'static/images/product-details/product10.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (38, 10, N'static/images/product-details/44.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (39, 10, N'static/images/product-details/45.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (40, 10, N'static/images/product-details/46.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (41, 11, N'static/images/product-details/product11.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (42, 11, N'static/images/product-details/cvogw-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (43, 11, N'static/images/product-details/cvogw-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (44, 11, N'static/images/product-details/cvogw-3.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (45, 12, N'static/images/product-details/product12.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (46, 12, N'static/images/product-details/GIÀY CỔ THẤP FORUM-1.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (47, 12, N'static/images/product-details/GIÀY CỔ THẤP FORUM-2.png', 1)
INSERT [dbo].[images] ([id], [productId], [imageUrl], [status]) VALUES (48, 12, N'product-details/GIÀY CỔ THẤP FORUM-3.png', 1)
GO
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (1, N'QB-01', N'JD High OG SP
Fragment x Travis Scott', 5, 3500, N'Mẫu Air Jordan 1 High OG SP Fragment Design x Travis Scott lấy cảm hứng từ mẫu giày Jordan 1 Royal từ năm 1985 với phần trên bằng da lộn màu trắng và xanh lam.', N'static/images/shop/product1.png', 1, 1)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (2, N'QB-02', N'Jordan 1 Retro High Travis Scott', 5, 1700, N'Jordan 1 Retro High Travis Scott là đôi giày rất đẹp.', N'static/images/shop/product2.png', 2, 1)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (3, N'QB-03', N'Air Jordan 1
Hyper Royal', 5, 4000, N'Air Jordan 1
Hyper Royal là đôi giày cực phẩm.', N'static/images/shop/product3.png', 3, 1)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (4, N'QB-04', N'Jordan 1 Retro High
Dior', 5, 10000, N'Jordan 1 Retro High
Dior là sự kết hợp hoàn hảo của dior và nike.', N'static/images/shop/product4.png', 1, 1)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (5, N'QB-05', N'FORUM LOW', 5, 110, N'Thiết kế mới mẻ.', N'static/images/shop/product5.png', 2, 3)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (6, N'QB-06', N'FORUM LOW RED', 5, 110, N'Biến hóa phong cách tiếp nối di sản.', N'static/images/shop/product6.png', 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (7, N'QB-07', N'GIÀY ZX 1K BOOST', 5, 110, N'Phong cách 3 sọc.', N'static/images/shop/product7.png', 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (8, N'QB-08', N'GIÀY CỔ THẤP FORUM', 5, 110, N'ĐÔI GIÀY BÓNG RỔ TRỨ DANH TRONG THIẾT KẾ CỔ THẤP', N'static/images/shop/product12.png', 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (9, N'QB-09', N'Chuck 70 Tape Seam Hi-Vis High-Top', 5, 75, N'Giày cá tính nổi bật.', N'static/images/shop/product9.png', 3, 2)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (10, N'QB-10', N'Chuck Taylor All Star CX Hi-Vis High-Top', 5, 74, N'Giày basic', N'static/images/shop/product10.png', 1, 2)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (11, N'QB-11', N'Converse Fear of God Cream', 5, 175, N'Giày fog', N'static/images/shop/product11.png', 2, 2)
INSERT [dbo].[product] ([id], [code], [name], [quantity], [price], [description], [imageUrl], [status], [subCategory_id]) VALUES (12, N'QB-12', N'Converse Fear of God Black', 5, 170, N'Giày fog đen', N'static/images/shop/product8.png', 1, 2)
GO
INSERT [dbo].[role_account] ([id], [role]) VALUES (1, N'Admin')
INSERT [dbo].[role_account] ([id], [role]) VALUES (2, N'Nhân viên')
INSERT [dbo].[role_account] ([id], [role]) VALUES (3, N'VIP')
INSERT [dbo].[role_account] ([id], [role]) VALUES (4, N'Khách hàng')
GO
INSERT [dbo].[status_account] ([id], [status]) VALUES (1, N'Kích hoạt')
INSERT [dbo].[status_account] ([id], [status]) VALUES (2, N'Chờ')
INSERT [dbo].[status_account] ([id], [status]) VALUES (3, N'Bị chặn')
GO
INSERT [dbo].[status_category] ([id], [status]) VALUES (1, N'Đang bán')
INSERT [dbo].[status_category] ([id], [status]) VALUES (2, N'Đang khuyến mãi')
INSERT [dbo].[status_category] ([id], [status]) VALUES (3, N'Miễn phí vận chuyển')
INSERT [dbo].[status_category] ([id], [status]) VALUES (4, N'Hết hàng')
INSERT [dbo].[status_category] ([id], [status]) VALUES (5, N'Ngừng kinh doanh')
GO
INSERT [dbo].[status_order] ([id], [status]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[status_order] ([id], [status]) VALUES (2, N'Được chấp nhận')
INSERT [dbo].[status_order] ([id], [status]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[status_order] ([id], [status]) VALUES (4, N'Thanh toán online')
INSERT [dbo].[status_order] ([id], [status]) VALUES (5, N'Thành công')
GO
INSERT [dbo].[status_product] ([id], [status]) VALUES (1, N'Đang Bán')
INSERT [dbo].[status_product] ([id], [status]) VALUES (2, N'Đang Khuyến Mãi')
INSERT [dbo].[status_product] ([id], [status]) VALUES (3, N'Miễn Phí Vận Chuyển')
INSERT [dbo].[status_product] ([id], [status]) VALUES (4, N'Hết Hàng')
INSERT [dbo].[status_product] ([id], [status]) VALUES (5, N'Ngừng Kinh Doanh')
GO
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (1, N'Ðang Bán')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (2, N'Ðang khuy?n mãi')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (3, N'Mi?n phí v?n chuy?n')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (4, N'H?t hàng')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (5, N'Ng?ng kinh doanh')
GO
