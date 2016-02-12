USE [MyLibrary]
GO

/****** Object:  Table [dbo].[Locations]    Script Date: 2/12/2016 2:28:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[LocationDescription] [nvarchar](50) NULL,
	[LocationAddress] [nvarchar](100) NULL,
	[LocationLatitude] [nvarchar](10) NULL,
	[LocationLongitude] [nvarchar](10) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


