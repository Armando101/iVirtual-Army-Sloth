-- 1) Muestra la orden de compra asociada a una factura 1
SELECT * FROM ORDEN_COMPRA O NATURAL JOIN FACTURA F 
WHERE FACTURA_ID = 1;

-- 2) Todos los detalles de la direccion del cliente con nombre David
SELECT * FROM DIRECCION D
INNER JOIN CLIENTE C ON C.DIRECCION_ID = D.DIRECCION_ID
WHERE C.NOMBRE = 'DAVID';

-- 3) Muestra todas las peliculas cuya clasificacion PG-13
SELECT * FROM PELICULA
WHERE CLASIFICACION = 'PG-13';

-- 4) 