--Simulando un carrito de compras

-- Creamos una tabla temporal en donde se almacenaran todos los artidulos que se desean comprar

CREATE GLOBAL TEMPORARY TABLE Carrito(
ID 			NUMBER(10,0) 		NOT NULL,
NOMBRE 		VARCHAR2(50) 		NOT NULL,
TIPO 		VARCHAR2(20) 		NOT NULL,
PRECIO		NUMBER(5,2)			NOT NULL,
CONSTRAINT PKCAR PRIMARY KEY (ID)
);

-- Se hace una simulación de lo que cualquier persona podria comprar en a tienda
Prompt Simulando llenado de carrito:
INSERT INTO Carrito(ID, Nombre, Tipo) VALUES (4365892178, 'La Bella y la Bestia', 'Pelicula', 150.00);
INSERT INTO Carrito(ID, Nombre, Tipo) VALUES (1245986254, 'God Of War', 'Video Juego', 600,00);
INSERT INTO Carrito(ID, Nombre, Tipo) VALUES (7692436874, 'Random Access Memories', 'Album', 300.00);

-- ¿Encontro todo lo que buscaba?
SELECT * FROM Carrito;

-- Cargando en factura
Prompt Todas las cosas que estan cargadas en carrito de compras se guardara en su factura
INSERT INTO FACTURA(FACTURA_ID, IVA, MONTO, FECHA) VALUES(FACTURA_SEQ.CURRVAL, 13, 1186.0, TO_DATE('2018/04/13','YYYY/MM/DD' );


-- Fin de la compra
Prompt Mostrando facturas, y revisando que se creo la correspondiente:
Select * From Factura;


