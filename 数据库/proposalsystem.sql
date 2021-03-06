USE [ProposalSystem]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Result] [int] NOT NULL,
	[ProposerOpinion] [nvarchar](200) NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proposal]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proposal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Type] [int] NOT NULL,
	[MainProposer] [int] NOT NULL,
	[Co-Proposers] [nvarchar](50) NOT NULL,
	[ProcessingDepartment] [int] NOT NULL,
	[File] [varchar](200) NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Proposal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProposalType]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProposalType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_ProposalType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Proposal] [int] NOT NULL,
	[Register] [nvarchar](10) NOT NULL,
	[Instruction] [nvarchar](200) NOT NULL,
	[Department] [int] NULL,
	[result] [nvarchar](10) NULL,
	[ExecutionContent] [nvarchar](200) NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Department] [int] NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2018/6/28 12:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name]) VALUES (1, N'计算机学院')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (2, N'后勤处')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (3, N'水电供应处')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (4, N'网络管理中心')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (5, N'宿管部')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ID], [Result], [ProposerOpinion], [Date]) VALUES (1, 5, N'五星好评！', CAST(0x673E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[Proposal] ON 

INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (1, N'修路灯', N'hjkhjh', 1, 2, N'张三、王五、二狗子', 1, N'C:\Users\lixue\Desktop', CAST(0x0000A907013E4241 AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (2, N'一教装空调', N'夏天到了，天气热的难受，同学们无心上课。请尽快在一教装上空调。我下次去一教上课的时候要享受到空调的凉意，否则我锤爆你们的狗头', 1, 2, N'张三、王五、二狗子', 2, N'C:\Users\lixue\Desktop', CAST(0x0000A9080008ADEE AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (3, N'分配女朋友', N'理工科专业的女生太少了，导致很多哥们都没有找到女朋友。所以建议学校安排分配女朋友，让每个男生都能脱单，谈一场轰轰烈烈的恋爱。', 2, 2, N'张三、王五、二狗子', 1, N'C:\Users\lixue\Desktop', CAST(0x0000A908017ECAC0 AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (4, N'提案一', N'提案一的内容', 1, 2, N'张三、王五、二狗子', 1, N'C:\Users\lixue\Desktop', CAST(0x0000A90801872B10 AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (5, N'提案二', N'提案二的内容', 1, 2, N'张三、王五、二狗子', 1, N'', CAST(0x0000A90B0094A514 AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (6, N'提案三', N'这是提案三的内容', 1, 2, N'张三、王五、二狗子', 2, N'', CAST(0x0000A90C013E4C5D AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (7, N'网络提速', N'宿舍网速太慢了，请尽快提高网速', 1, 2, N'老黄、老钱、老李', 4, NULL, CAST(0x0000A90C0184947D AS DateTime))
INSERT [dbo].[Proposal] ([ID], [Title], [Content], [Type], [MainProposer], [Co-Proposers], [ProcessingDepartment], [File], [Date]) VALUES (8, N'翰墨池的美化', N'建议韩墨池的建设投入更多的资金，把翰墨池打造的更漂亮', 2, 2, N'老黄、老钱、老李', 2, NULL, CAST(0x0000A90D00AAF0B3 AS DateTime))
SET IDENTITY_INSERT [dbo].[Proposal] OFF
SET IDENTITY_INSERT [dbo].[ProposalType] ON 

INSERT [dbo].[ProposalType] ([ID], [Type]) VALUES (1, N'提案')
INSERT [dbo].[ProposalType] ([ID], [Type]) VALUES (2, N'建议')
SET IDENTITY_INSERT [dbo].[ProposalType] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (2, 1, N'不立案', N'学校没钱，不立案。', NULL, NULL, NULL, CAST(0x0000A909010A2A9A AS DateTime))
INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (5, 2, N'受理', N'给予立案', 2, N'受理', N'已装', CAST(0x0000A90D00A0E97E AS DateTime))
INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (6, 5, N'立案', N'好', 1, NULL, NULL, CAST(0x0000A90B00952033 AS DateTime))
INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (7, 3, N'立案', N'学校即将给单身的男同学分配女朋友', 1, NULL, NULL, CAST(0x0000A90C016EC923 AS DateTime))
INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (8, 7, N'立案', N'已安排网络管理中心处理', 4, NULL, NULL, CAST(0x0000A90C0185124D AS DateTime))
INSERT [dbo].[Result] ([ID], [Proposal], [Register], [Instruction], [Department], [result], [ExecutionContent], [Date]) VALUES (9, 8, N'立案', N'学校将投入更多的资金建设翰墨池，打造全国最好看的池。', 2, NULL, NULL, CAST(0x0000A90D00AB4963 AS DateTime))
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Account], [Password], [Department], [UserType]) VALUES (1, N'张三', N'201524131130', N'123456789', 1, 2)
INSERT [dbo].[User] ([ID], [UserName], [Account], [Password], [Department], [UserType]) VALUES (2, N'李四', N'201524131131', N'123456789', 1, 1)
INSERT [dbo].[User] ([ID], [UserName], [Account], [Password], [Department], [UserType]) VALUES (3, N'单位管理员1', N'201524131132', N'123456789', 2, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Type]) VALUES (1, N'教工')
INSERT [dbo].[UserType] ([ID], [Type]) VALUES (2, N'系统管理员')
INSERT [dbo].[UserType] ([ID], [Type]) VALUES (3, N'单位管理员')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Result] FOREIGN KEY([Result])
REFERENCES [dbo].[Result] ([ID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Result]
GO
ALTER TABLE [dbo].[Proposal]  WITH CHECK ADD  CONSTRAINT [FK_Proposal_Department] FOREIGN KEY([ProcessingDepartment])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Proposal] CHECK CONSTRAINT [FK_Proposal_Department]
GO
ALTER TABLE [dbo].[Proposal]  WITH CHECK ADD  CONSTRAINT [FK_Proposal_ProposalType] FOREIGN KEY([Type])
REFERENCES [dbo].[ProposalType] ([ID])
GO
ALTER TABLE [dbo].[Proposal] CHECK CONSTRAINT [FK_Proposal_ProposalType]
GO
ALTER TABLE [dbo].[Proposal]  WITH CHECK ADD  CONSTRAINT [FK_Proposal_User] FOREIGN KEY([MainProposer])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Proposal] CHECK CONSTRAINT [FK_Proposal_User]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Department]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Proposal] FOREIGN KEY([Proposal])
REFERENCES [dbo].[Proposal] ([ID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Proposal]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserType] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
