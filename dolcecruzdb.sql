CREATE DATABASE IF NOT exists DolceCruzDB;

use DolceCruzDB;

 create table if not exists usuarios	( 
	id int not null auto_increment,
	usuario varchar(30) not null,
	pssw varchar(30) not null,
    nombre varchar(60) not null,
	Primary key(id)
    )Engine=INNODB;
    
	create table if not exists Productos	( 
	id int not null auto_increment,
    nombre varchar (30) not null,
    tipo_unidad varchar (10) not null,
    cantidad float not null,
	usuario int not null,
	tipo_inv varchar(30) not null,
	Primary key(id),
    FOREIGN KEY (usuario) REFERENCES usuarios(id)
    )Engine=INNODB;