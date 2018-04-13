CONNECT sys/system AS sysdba

CREATE USER  rs_proy_admin IDENTIFIED BY admin
	DEFAULT tablespace data
	temporary tablespace temp
	quota unlimited on data;    

CREATE USER  rs_proy_invitado IDENTIFIED BY invitado
	DEFAULT tablespace data
	temporary tablespace temp
	quota unlimited on data;    


CREATE ROLE rol_admin;
GRANT create table, create any view, alter any table, insert any table,
	delate any table, create session, alter session, drop any view, drop any table,
	create porfile, create tablespace, create user, alter porfile, alter tablespace, 
	create sequence;
GRANT rol_admin to rs_proy_admin;

CREATE ROLE rol_invitado;
	GRANT create session;
GRANT rol_invitado to rs_proy_invitado;