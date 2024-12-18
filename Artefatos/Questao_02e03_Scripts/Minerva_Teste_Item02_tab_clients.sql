USE [Minerva]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tab_clients](
	[cod_client] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone] [bigint] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tab_clients] PRIMARY KEY CLUSTERED 
(
	[cod_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Cliente (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients', @level2type=N'COLUMN',@level2name=N'cod_client'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients', @level2type=N'COLUMN',@level2name=N'name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Endereço do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients', @level2type=N'COLUMN',@level2name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefone do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients', @level2type=N'COLUMN',@level2name=N'phone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'e-mail do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients', @level2type=N'COLUMN',@level2name=N'email'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clientes / Clients' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_clients'
GO


