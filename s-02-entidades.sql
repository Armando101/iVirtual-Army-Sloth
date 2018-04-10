CREATE TABLE PELICULA(
	PELICULA_ID 	NUMBER(10,0) 		NOT NULL,
	NOMBRE 			VARCHAR2(20)		NOT NULL,
	PRECIO 			NUMBER(5,2)			NOT NULL,
	GENERO  		VARCHAR2(10)		NOT NULL,
	DURACION 		NUMBER(3,2) 		NOT NULL,
	CLASIFICACION 	VARCHAR2(3)			NOT NULL,
	FORMATO 		VARCHAR2(20)		NOT NULL,
	FOLIO 			VARCHAR2(13)		NOT NULL,	
	TIPO_SERVICIO 	VARCHAR2(25)		DEFAULT "TARJETA DE CREDITO" NOT NULL,
	TIEMPO_PRECIO	NUMBER(3),			--EN ANIOS
	PRECIO_XTIEMPO	NUMBER(5,2), 		GENERATED ALWAYS AS (PRECIO * 0.05 * TIEMPO_PRECIO) VIRTUAL,
	CONSTRAINT PKPEL PRIMARY KEY (PELICULA_ID) 
);

CREATE TABLE ALBUM (
	ALBUM_ID		NUMBER(10,0) 		NOT NULL,
	NOMBRE 			VARCHAR2(20)		NOT NULL,
	PRECIO 			NUMBER(5,2)			NOT NULL,
	FOLIO 			VARCHAR2(13)		NOT NULL,
	TIPO_SERVICIO	VARCHAR2(20)		DEFAULT "TARJETA DE CREDITO" NOT NULL,
	DISQUERA 		VARCHAR2(30)		DEFAULT "DESCONOCIDO" 	NOT NULL,
	ARTISTA 		VARCHAR2(20)		DEFAULT "ANONIMO" 		NOT NULL,
	ANIO			NUMBER(4,0)			NOT NULL,
	TIEMPO_PRECIO	NUMBER(3),			--EN ANIOS
	PRECIO_XTIEMPO	NUMBER(5,2), 		GENERATED ALWAYS AS (PRECIO * 0.05 * TIEMPO_PRECIO) VIRTUAL,
	
	CONSTRAINT PKALB PRIMARY KEY (ALBUM_ID) 
	CONSTRAINT ANIOPO CHECK (ANIO>1400 AND ANIO < (SELECT EXTRACT (YEAR FROM SYSDATE) FROM dual))
);

CREATE TABLE JUEGOS (
	JUEGOS_ID		NUMBER(10,0) 		NOT NULL,
	NOMBRE 			VARCHAR2(20)		NOT NULL,
	PRECIO 			NUMBER(5,2)			NOT NULL,
	FOLIO 			VARCHAR2(13)		NOT NULL,
	TIPO_SERVICIO	VARCHAR2(20)		DEFAULT "TARJETA DE CREDITO" NOT NULL,
	CONSOLA 		VARCHAR2(20)		DEFAULT "MULTICONSOLA" NOT NULL,
	MANUAL	 		VARCHAR2(200)		NOT NULL,
	TIEMPO_PRECIO	NUMBER(3),			--EN ANIOS
	PRECIO_XTIEMPO	NUMBER(5,2), 		GENERATED ALWAYS AS (PRECIO * 0.05 * TIEMPO_PRECIO) VIRTUAL,
	
	CONSTRAINT PKJU PRIMARY KEY (JUEGOS_ID) 
);

CREATE TABLE CLIENTE (
	CLIENTE_ID			VARCHAR(20)		 NOT NULL,	--USUARIO
	NOMBRE              VARCHAR2(50)     NOT NULL,
    APELLIDO_PATERNO    VARCHAR2(50)     NOT NULL,
    APELLIDO_MATERNO    VARCHAR2(10)	 NOT NULL,
    RFC                 VARCHAR2(18)			 ,
    PASSWORD			VARCHAR2(10)	 NOT NULL,
    TELEFONO			VARCHAR2(15)	 NOT NULL,
    FORMA_PAGO_ID		VARCHAR2(10)	 NOT NULL,
    CORREO				VARCHAR2(30)	 NOT NULL,
    DIRECCION_ID		VARCHAR2(40)  	 NOT NULL,
    ORDEN_COMPRA_ID		VARCHAR2(10)	 NOT NULL		

	CONSTRAINT USUARIO UNIQUE (CLIENTE_ID),
	CONSTRAINT PKCLI PRIMARY KEY (CLIENTE_ID),

	CONSTRAINT FKPAG FOREIGN KEY (FORMA_PAGO_ID)
	REFERENCES FORMA_PAGO(FORMA_PAGO_ID),

	CONSTRAINT FKDIR FOREIGN KEY (DIRECCION_ID)
	REFERENCES DIRECCION(DIRECCION_ID),

	CONSTRAINT FKORDEN FOREIGN KEY(ORDEN_COMPRA_ID)
	REFERENCES ORDEN_COMPRA(ORDEN_COMPRA_ID)		
);

CREATE TABLE DIRECCION (
	DIRECCION_ID	NUMBER(10) 		NOT NULL,
	CALLE			VARCHAR2(30)	NOT NULL,
	NUMERO_EXT		VARCHAR2(5)		NOT NULL,
	NUMERO_INT		VARCHAR2(3)				,
	COLONIA			VARCHAR2(20)	NOT NULL,
	CODIGO POSTAL   NUMBER(7,0)		NOT NULL,
	ENTIDAD			VARCHAR2(20)	NOT NULL,
	DELEGACION		VARCHAR2(20)	NOT NULL,

	CONSTRAINT PKDIR PRIMARY (DIRECCION_ID)
);

CREATE TABLE PAGO_CREDITO(
	PAGO_CREDITO_ID		NUMBER(10) 		NOT NULL,
	BANCO				VARCHAR2(20)	NOT NULL,
	TITULAR				VARCHAR2(50)	NOT NULL,
	NUMERO_SEGURIDAD	NUMBER(10)		NOT NULL,
	VENCIMIENTO			DATE			NOT NULL,
	TIPO_TARJETA		VARCHAR2(10)	NOT NULL,
	CONSTRAINT PKNUMERO_TARJETA PRIMARY KEY PAGO_CREDITO_ID		
);

CREATE TABLE PAGO_TRANSFERENCIA (
	PAGO_TRANSFERENCIA_ID NUMBER(20)	NOT NULL,
	TITULAR VARCHAR2(40)				NOT NULL,
	BANCO VARCHAR2(20)					NOT NULL,

	CONSTRAINT CLAVE_INTERBANCARIA PRIMARY KEY PAGO_TRANSFERENCIA_ID,
	CONSTRAINT TRANS UNIQUE (PAGO_TRANSFERENCIA_ID)

);

CREATE TABLE ORDEN_COMPRA (
	ORDEN_COMPRA_ID			NUMBER(10) 		NOT NULL,
	TIPO_SERVICIO			VARCHAR2(20)	NOT NULL,
	PRODUCTO_ID				NUMBER(10)		NOT NULL,
	FACTURA_ID				NUMBER(10)		NOT NULL,

	CONSTRAINT PKFOLIO PRIMARY KEY (ORDEN_COMPRA_ID),
	CONSTRAINT FKSERV  FOREIGN KEY (PRODUCTO_ID)
	REFERENCES PRODUCTO(PRODUCTO_ID),
	CONSTRAINT FKFACTURA FOREIGN KEY (FACTURA_ID)
	REFERENCES FACTURA(FACTURA_ID)
);

CREATE TABLE PRODUCTO (
	PRODUCTO_ID NUMBER (10)		NOT NULL,
	TIPO 		VARCHAR2(10)	NOT NULL,
	CANTIDAD	NUMBER(4)		NOT NULL,
	PRECIO		NUMBER(7,2)		NOT NULL,

	CONSTRAINT PKPROD PRIMARY KEY (PRODUCTO_ID)
);

CREATE TABLE FACTURA (
	FACTURA_ID	NUMBER (10) NOT NULL,
	IVA			NUMBER(3)	DEFAULT 9 NOT NULL,  -- SE EXREPSA EN PORCENTAJE
	MONTO		NUMBER(8,2) NOT NULL,
	FECHA 		DATE 		NOT NULL,
	--ORDEN DE COMPRA ASOCIADA

	CONSTRAINT PKFOLIOFAC PRIMARY KEY (FACTURA_ID)

);

CREATE TABLE PAQUETES(
	PAQUETES_ID 	NUMBER(10)  NOT NULL,
	SEGUIMIENTO_ID  NUMBER(10)	NOT NULL,
	FECHA_ENVIO		DATE		NOT NULL,
	FECHA_ID		NUMBER(10)	NOT NULL,
	EMPRESA_ID		NUMBER(10)	NOT NULL,

	CONSTRAINT PKPACK PRIMARY KEY (PAQUETES_ID),
	CONSTRAINT FKEMP FOREIGN KEY EMPRESA(EMPRESA_ID),
	CONSTRAINT FKNUMSEGUIMIENTO FOREIGN KEY SEGUIMIENTO(SEGUIMIENTO_ID)
);

CREATE TABLE SEGUIMIENTO (
	SEGUIMIENTO_ID 	NUMBER(10)		NOT NULL,
	FECHA 			DATE 			NOT NULL,
	LUGAR 			VARCHAR2(40)	NOT NULL,
	HORA  			DATE			NOT NULL,
	
	CONSTRAINT PKSEG PRIMARY KEY (SEGUIMIENTO_ID)
);

CREATE TABLE EMPRESA (
	EMPRESA_ID 	NUMBER(10) 		NOT NULL,
	NOMBRE		VARCHAR2(40)	NOT NULL,
	COBERTURA	VARCHAR2(20)	NOT NULL,

	CONSTRAINT PKEMP PRIMARY KEY (EMPRESA_ID)
);