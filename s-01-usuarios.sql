/*
i) Este script contendrá la definición de 2
usuarios: <iniciales>_proy_invitado y
<iniciales>_proy_admin, donde <iniciales>
corresponden a la primera letra de cada
apellido paterno de cada integrante. El usuario
admin será el dueño de todos los objetos del
caso de estudio.

ii) Incluir en el script la definición de 2 roles:
	(1) rol_admin Contendrá todos los roles
	necesarios para poder implementar el caso
	de estudio asignado.
	(2) rol_invitado.
	Solo deberá tener
	permisos para crear sesiones.

iii) Asignar a los usuarios admin e invitado los
roles rol_admin y rol_invitado respectivamente.
*/
--Creacion de Roles

Promt Proporcione usuario y password para usuario admin 
create user &&proy_admin identified by &&password_admin quota unlimited on users;    

Promt Proporcione usuario y password para usuario invitado
create user &&proy_invitado identified by &&password_invitado quota unlimited on users;    


CREATE ROLE rol_admin;
	GRANT create table, create any view, alter any table, insert any table,
	delate any table, create session, alter session, drop any view, drop any table,
	create porfile, create tablespace, create user, alter porfile, alter tablespace, 
	create sequence;
GRANT rol_admin to &proy_admin;

CREATE ROLE rol_invitado;
	GRANT create session;
GRANT rol_invitado to &proy_invitado;



































