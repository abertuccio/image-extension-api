## Correr la aplicacion (!IMPORTANTE: antes lanzar el proyecto importar la base de datos):
	npm install
##### PRODUCCION
	npm start 
##### DESARROLLO
	DEBUG=web-buddy-backend:* npm start

## CONFIGURAR MySQL UNICA VEZ

	sudo apt install mysql-server
	sudo mysql_secure_installation

	sudo mysql

##### Consultar cuál método de autenticación usa cada una de sus cuentas de usuario de MySQL usando el siguiente comando:
	mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;

##### root autentica usando el plugin auth_socket. Para configurar la cuenta root para autenticarse usando una contraseña, ejecute el siguiente comando ALTER USER. Asegúrese de cambiar password (contraseña) a una contraseña segura de su elección.
	mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'coloque password';

##### Ejecutar FLUSH PRIVILEGES (purgar privilegios), lo que le dice al servidor que vuelva a cargar las tablas grant e implemente sus nuevos cambios
	mysql> FLUSH PRIVILEGES;

##### Verificar los métodos de autenticación que usa cada uno de sus usuarios nuevamente para confirmar que root ya no se autentica usando el plugin auth_socket:
	mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;

	mysql> exit


##antes de lanzar el proyecto, hacer dump e importar la base de datos
##### DUMP
	cd documents
##### IMPORTAR
	cd documents
	mysql -u root -p < web_buddy.sql

##### En caso de querer eliminar mysql completamente del sistema ejecutar lo siguiente
	sudo apt-get purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*
	sudo rm -rf /etc/mysql /var/lib/mysql
	sudo apt-get autoremove
	sudo apt-get autoclean


## CREACION DEL PROYECTO

##### INSTALAR & CONFIGURAR 
	sudo apt update
	sudo apt install nodejs
	sudo apt install npm

##### crear esqueleto de aplicación.
	sudo npm install express-generator -g

##### crea una aplicación Express
	express --view=pug web-buddy-backend

##### change directory:
	cd web-buddy-backend

##### Instalar módulos
	npm install mysql --save
	npm install crypto-js



## DOCUMENTACION