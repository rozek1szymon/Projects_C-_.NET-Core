USE [SR_Test]
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 4/29/2019 2:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[PK_Deliveries] [int] IDENTITY(1,1) NOT NULL,
	[DEL_NameOfPackage] [nvarchar](max) NULL,
	[DEL_AddressOfDestination] [nvarchar](max) NULL,
	[DEL_DateOfMade] [datetime2](7) NOT NULL,
	[DEL_WeightOfDelivery ] [float] NOT NULL,
	[FK_Deliveries_MainPackages] [int] NOT NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[PK_Deliveries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainPackages]    Script Date: 4/29/2019 2:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainPackages](
	[PK_MainPackages] [int] IDENTITY(1,1) NOT NULL,
	[PACK_NameOfPackage] [nvarchar](max) NULL,
	[PACK_DateOfMadeThePackage] [datetime2](7) NOT NULL,
	[PACK_IsPackageOpen] [bit] NOT NULL,
	[PACK_DateOfCloseThePackage] [datetime2](7) NULL,
	[PACK_DestinationCityOfDelivery] [nvarchar](max) NULL,
 CONSTRAINT [PK_MainPackages] PRIMARY KEY CLUSTERED 
(
	[PK_MainPackages] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_MainPackages_FK_Deliveries_MainPackages] FOREIGN KEY([FK_Deliveries_MainPackages])
REFERENCES [dbo].[MainPackages] ([PK_MainPackages])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_MainPackages_FK_Deliveries_MainPackages]
GO
