-- 1) Muestra la orden de compra asociada a una factura 1
<<<<<<< HEAD
=======
Prompt Muestra la orden de compra asociada a una factura 1
>>>>>>> 1317d466594447982d50095c0822daeb118a2690
SELECT * FROM ORDEN_COMPRA O NATURAL JOIN FACTURA F 
WHERE FACTURA_ID = 1;

-- 2) Todos los detalles de la direccion del cliente con nombre David
<<<<<<< HEAD
=======
Prompt Todos los detalles de la direccion del cliente con nombre David
>>>>>>> 1317d466594447982d50095c0822daeb118a2690
SELECT * FROM DIRECCION D
INNER JOIN CLIENTE C ON C.DIRECCION_ID = D.DIRECCION_ID
WHERE C.NOMBRE = 'DAVID';

-- 3) Muestra todas las peliculas cuya clasificacion PG-13
<<<<<<< HEAD
SELECT * FROM PELICULA
WHERE CLASIFICACION = 'PG-13';

-- 4) 
=======
Prompt Muestra todas las peliculas cuya clasificacion PG-13
SELECT * FROM PELICULA
WHERE CLASIFICACION = 'PG-13';
>>>>>>> 1317d466594447982d50095c0822daeb118a2690
