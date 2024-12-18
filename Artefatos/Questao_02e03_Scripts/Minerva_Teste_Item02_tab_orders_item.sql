USE [Minerva]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tab_orders_item](
	[cod_item_order] [bigint] IDENTITY(1,1) NOT NULL,
	[cod_order] [bigint] NOT NULL,
	[cod_product] [bigint] NOT NULL,
	[quantity] [numeric](18, 2) NOT NULL,
	[unit_price] [money] NOT NULL,
	[total_item]  AS ([quantity]*[unit_price]),
 CONSTRAINT [PK_tab_orders_item] PRIMARY KEY CLUSTERED 
(
	[cod_item_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tab_orders_item] ADD  CONSTRAINT [DF_tab_orders_item_quantity]  DEFAULT ((0)) FOR [quantity]
GO

ALTER TABLE [dbo].[tab_orders_item] ADD  CONSTRAINT [DF_tab_orders_item_unit_price]  DEFAULT ((0)) FOR [unit_price]
GO

ALTER TABLE [dbo].[tab_orders_item]  WITH CHECK ADD  CONSTRAINT [FK_tab_orders_item_tab_item] FOREIGN KEY([cod_product])
REFERENCES [dbo].[tab_item] ([cod_product])
GO

ALTER TABLE [dbo].[tab_orders_item] CHECK CONSTRAINT [FK_tab_orders_item_tab_item]
GO

ALTER TABLE [dbo].[tab_orders_item]  WITH CHECK ADD  CONSTRAINT [FK_tab_orders_item_tab_orders] FOREIGN KEY([cod_item_order])
REFERENCES [dbo].[tab_orders] ([cod_order])
GO

ALTER TABLE [dbo].[tab_orders_item] CHECK CONSTRAINT [FK_tab_orders_item_tab_orders]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do item do pedido (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item', @level2type=N'COLUMN',@level2name=N'cod_item_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Pedido (chave estrangeira)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item', @level2type=N'COLUMN',@level2name=N'cod_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Produto (chave estrangeira)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item', @level2type=N'COLUMN',@level2name=N'cod_product'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade do item no pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item', @level2type=N'COLUMN',@level2name=N'quantity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Preço unitário do item no pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item', @level2type=N'COLUMN',@level2name=N'unit_price'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Itens do Pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tab_orders_item'
GO


