USE [MyLibrary]
GO

/****** Object:  Table [dbo].[Books]    Script Date: 2/12/2016 2:27:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](100) NULL,
	[BookAuthor] [nvarchar](50) NULL,
	[BookISBN] [nvarchar](50) NULL,
	[BookDescription] [nvarchar](100) NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


