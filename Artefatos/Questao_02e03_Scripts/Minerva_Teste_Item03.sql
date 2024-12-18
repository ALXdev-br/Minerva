/*
Questão 3:
Utilizando comandos SQL, realize as seguintes operações:
- Insira 5 clientes fictícios na tabela de clientes.
- Insira 3 produtos fictícios na tabela de produtos.
- Crie 2 pedidos para um dos clientes, cada um contendo pelo menos 2 itens
de pedido diferentes.
*/

USE Minerva
GO

INSERT 
  INTO tab_clients 
     ( [name]
     , [address]
     , [phone]
     , [email]
     )
VALUES
    -- (<name, varchar(100)>        , <address, nvarchar(255)>                                 ,<phone, bigint>, <email, nvarchar(50)>)
       ('Antonio da Silva'          , 'Rua Povoados, 123, CEP 11222-333, Saturno, SP'          , 5544912345678 , 'antonio.silva@emailfree.com')
     , ('Pedro Morashi'             , 'Rua Satelite, 489, CEP 22333-444, Netuno  , MG'         , 5544912345678 , 'pedro.morashi@emailfree.com')
     , ('José Dias Salvador'        , 'Av. Paraná, 5896, Apto. 117, CEP 11444-555, Jupiter, PR', 5544912345678 , 'jose.salvador@emailfree.com')
     , ('Maria Celestina Boaventura', 'Av. Montes Altes, 5896, CEP 33555-616, Venus, GO'       , 5544912345678 , 'maria.boaventura@emailfree.com')
     , ('Danilo Buarque Souza'      , 'Rua Brasilia, 5896, CEP 44777-829, Urano, RS'           , 5544912345678 , 'danilo.souza@emailfree.com')
GO

-- select * from tab_clients


INSERT 
  INTO tab_item
     ( [name]
     , [description]
     , [price]
     )
VALUES 
     --(<name, nvarchar(50)>, <description, nvarchar(150)>, <price, money>)
       ('Filet Boi'         , 'Filet mignon de boi'       , 100.00 )
     , ('Filet Cordeiro'    , 'Filet mignon de cordeiro'  ,  80.50 )
     , ('Filet Suino'       , 'Filet mignon de suíno'     ,  60.25 )
GO

-- select * from tab_item




DECLARE @tab_orders_tmp AS 
  TABLE 
      ( cod_order  bigint
      , cod_client bigint
      , inserted   bit
      )

select * from @tab_orders_tmp


INSERT 
  INTO tab_orders
     ( [cod_client]
     , [order_date]
     , [total_order]
     )
OUTPUT inserted.cod_order, inserted.cod_client, 0 INTO @tab_orders_tmp
VALUES
     --(<cod_client, bigint>, <order_date, date>, <total_order, money>)
       (1, '2024-11-29', 0.00 )
     , (1, '2024-11-30', 0.00 )            

if (object_id('tempdb..#tab_orders_tmp') is not null)
  drop table #tab_orders_tmp
select * into #tab_orders_tmp from @tab_orders_tmp
select * from #tab_orders_tmp
-- rollback
-- commit


DECLARE @COD_ORDER BIGINT 
SET @COD_ORDER = ( SELECT MIN(cod_order) FROM #tab_orders_tmp WHERE INSERTED = 0)
SELECT @COD_ORDER AS [@COD_ORDER]

    INSERT 
      INTO tab_orders_item
         ( [cod_order]
         , [cod_product]
         , [quantity]
         , [unit_price]
         )
    VALUES
         --(<cod_order, bigint>, <cod_product, bigint>, <quantity, numeric(18,2)>, <unit_price, money>)
           ( @COD_ORDER        , 1                    , 50.45                    , 100.00 )
         , ( @COD_ORDER        , 2                    , 20.15                    , 80.50  )
         , ( @COD_ORDER        , 3                    , 10.85                    , 60.25  )

UPDATE TMP
   SET TMP.INSERTED = 1
  FROM #tab_orders_tmp AS TMP
 WHERE TMP.cod_order = @COD_ORDER


SET @COD_ORDER = ( SELECT MIN(cod_order) FROM #tab_orders_tmp WHERE INSERTED = 0)
SELECT @COD_ORDER AS [@COD_ORDER]


    INSERT 
      INTO tab_orders_item
         ( [cod_order]
         , [cod_product]
         , [quantity]
         , [unit_price]
         )
    VALUES
         --(<cod_order, bigint>, <cod_product, bigint>, <quantity, numeric(18,2)>, <unit_price, money>)
           ( @COD_ORDER        , 1                    , 100.15                   , 100.00 )
         , ( @COD_ORDER        , 3                    ,  50.95                   , 80.50  )


UPDATE TMP
   SET TMP.INSERTED = 1
  FROM #tab_orders_tmp AS TMP
 WHERE TMP.cod_order = @COD_ORDER

SELECT * FROM tab_orders_item


SELECT ORD.cod_order
     , ORD.order_date
     , ORD.cod_client
     , CLI.[name] as Client_Name
     , ITO.cod_item_order
     , ITO.cod_product
     , ITE.[name] AS Product_Name
     , ITO.quantity
     , ITO.unit_price
     , ITO.quantity * ITO.unit_price AS Total_Item
  FROM tab_orders as ORD 
       INNER JOIN tab_clients AS CLI
               ON ORD.cod_client = CLI.cod_client
       INNER JOIN tab_orders_item AS ITO
               ON ITO.cod_order = ORD.cod_order
       INNER JOIN tab_item AS ITE
               ON ITE.cod_product = ITO.cod_product

SELECT ORD.cod_order
     , ORD.cod_client
     , CLI.[name]
     , SUM(ITO.quantity * ITO.unit_price) AS TOTAL_PEDIDO
  FROM tab_orders as ORD 
       INNER JOIN tab_clients AS CLI
               ON ORD.cod_client = CLI.cod_client
       INNER JOIN tab_orders_item AS ITO
               ON ITO.cod_order = ORD.cod_order
       INNER JOIN tab_item AS ITE
               ON ITE.cod_product = ITO.cod_product
GROUP 
   BY  ORD.cod_order
     , ORD.cod_client
     , CLI.[name]






