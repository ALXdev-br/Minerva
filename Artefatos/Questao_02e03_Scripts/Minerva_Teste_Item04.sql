/* RETURN VALUE IN VARIABLE */
CREATE OR ALTER 
PROCEDURE dbo.OrdersCalculateTotal_SP
          @Cod_Order              BIGINT = 0
	    , @Total_Order_Calculated MONEY  OUTPUT
AS
    SELECT @Total_Order_Calculated = SUM(ITO.quantity * ITO.unit_price)  
      FROM tab_orders AS ORD 
           INNER JOIN tab_orders_item AS ITO
                   ON ITO.cod_order = ORD.cod_order
     WHERE ORD.cod_order = @Cod_Order
GO

-- =============================================
-- Example to execute the stored procedure
-- =============================================
DECLARE @Cod_Order       BIGINT
      , @Total_Order_out MONEY
SET @Cod_Order = ( SELECT TOP 1 ORD.cod_order
                     FROM tab_orders AS ORD 
                          INNER JOIN tab_orders_item AS ITO
                                  ON ITO.cod_order = ORD.cod_order )
SELECT @Cod_Order AS [@Cod_Order]

EXECUTE dbo.OrdersCalculateTotal_SP @Cod_Order, @Total_Order_out OUTPUT

SELECT @Total_Order_out AS Total_Order
GO


-----------------------------------------

/* RETURN VALUE IN RESULTSET */
CREATE OR ALTER
PROCEDURE OrdersCalculateTotal_DS_SP
          @Cod_Order   BIGINT = 0
AS
    SELECT SUM(ITO.quantity * ITO.unit_price) total_order_calculated
      FROM tab_orders AS ORD 
           INNER JOIN tab_orders_item AS ITO
                   ON ITO.cod_order = ORD.cod_order
    WHERE ORD.cod_order = @Cod_Order
GO

-- =============================================
-- Examples to execute the stored procedure
-- =============================================
DECLARE @Cod_Order   BIGINT

SET @Cod_Order = ( SELECT TOP 1 ORD.cod_order
                     FROM tab_orders AS ORD 
                          INNER JOIN tab_orders_item AS ITO
                                  ON ITO.cod_order = ORD.cod_order )
SELECT @Cod_Order AS [@Cod_Order]

EXECUTE dbo.OrdersCalculateTotal_DS_SP @Cod_Order
go

IF (OBJECT_ID('TEMPDB..#tab_orders_tmp') IS NOT NULL)
  DROP TABLE #tab_orders_tmp 
CREATE 
 TABLE #tab_orders_tmp ( Total Money )
--SELECT * FROM #tab_orders_tmp
DECLARE @Cod_Order  BIGINT = 9
 INSERT 
   INTO #tab_orders_tmp ( Total ) 
EXECUTE dbo.OrdersCalculateTotal_DS_SP @Cod_Order
 SELECT * 
  FROM #tab_orders_tmp
