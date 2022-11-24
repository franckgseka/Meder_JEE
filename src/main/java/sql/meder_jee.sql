drop database if exists meder_jee ;
create database meder_jee; 
use meder_jee; 

create table evenement (
	idevenement int (3) not null auto_increment, 
	designation varchar(50), 
	prix float, 
	qte int (3), 
	categorie varchar (50), 
	primary key (idevenement)
); 

insert into evenement values (null, "festival", 2.20, 12, "concert"),
(null, "concert-caritatif", 23.20, 16, "salon-dexpo"), 
(null, "soiree", 1000, 2, "meeting"); 

create table user (
	iduser int(3) not null auto_increment, 
	nom varchar(50), 
	prenom varchar(50),
	email varchar(50), 
	mdp varchar(50), 
	role enum("admin", "user"),
	primary key(iduser)
);

insert into user values (null, "Marco", "Ndeye", "n@gmail.com", "123", "admin"); 
insert into user values (null, "Franck", "Jo", "m@gmail.com", "456", "user");
