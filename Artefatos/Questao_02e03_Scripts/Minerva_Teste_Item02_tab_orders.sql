USE [Minerva]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tab_orders](
	[cod_order] [bigint] IDENTITY(1,1) NOT NULL,
	[cod_client] [bigint] NOT NULL,
	[order_date] [date] NOT NULL,
	[total_order] [money] NOT NULL,
 CONSTRAINT [PK_tab_orders] PRIMARY KEY CLUSTERED 
(
	[cod_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tab_orders] ADD  CONSTRAINT [DF_tab_orders_total_order]  DEFAULT ((0)) FOR [total_order]
GO

ALTER TABLE [dbo].[tab_orders]  WITH CHECK ADD  CONSTRAINT [FK_tab_orders_tab_clients] FOREIGN KEY([cod_client])
REFERENCES [dbo].[tab_clients] ([cod_client])
GO

ALTER TABLE [dbo].[tab_orders] CHECK CONSTRAINT [FK_tab_orders_tab_clients]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Pedido (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders', @level2type=N'COLUMN',@level2name=N'cod_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do cliente (FK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders', @level2type=N'COLUMN',@level2name=N'cod_client'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders', @level2type=N'COLUMN',@level2name=N'order_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor total do pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders', @level2type=N'COLUMN',@level2name=N'total_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cabeçalho dos pedidos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders'
GO


