--creation des differents tables

CREATE TABLE IF NOT EXISTS users(
	email VARCHAR PRIMARY KEY NOT NULL,
	password varchar NOT NULL,
	points int,
	role varchar,
	username varchar NOT NULL,

);

CREATE TABLE IF NOT EXISTS CATEGORY(
	id interger(10),
	name varchar(255),
);


CREATE TABLE IF NOT EXISTS SERVICE(
	id interger(10),
	status boolean(1),
	description varchar(255),
	done boolean(1),
	max interger(10),
	price interger(10),
	tags varchar(255),
	title varchar(255),
	category_id interger(10),
	provider_id varchar(255),
);

CREATE TABLE IF NOT EXISTS SERVICE_CLIENTS(
	client_id varchar(255),
	service_id interger(10)
);

-- insertion de la table users
-- 5 comptes utilisateurs dont 3 comptes user normale
-- et 1 compte moderateur et 1 compte admininstateur
INSERT INTO users (email,password,points,role,username) VALUES ('thomas@insa-cvl.fr','thomas',30,'user','thomas');
INSERT INTO users (email,password,points,role,username) VALUES ('toto@insa-cvl.fr','toto',30,'user','toto');
INSERT INTO users (email,password,points,role,username) VALUES ('sam@insa-cvl.fr','sam',30,'user','sam');
INSERT INTO users (email,password,points,role,username) VALUES ('moderer@insa-cvl.fr','moderer',30,'mod','moderer');
INSERT INTO users (email,password,points,role,username) VALUES ('admin@insa-cvl.fr','admin',30,'admin','admin');

--insertion dans la table categories
INSERT INTO category (name) values ('Cours particuliers'); -- pour coherant avec la table service
INSERT INTO category (name) values ('Bricollage');
INSERT INTO category (name) values ('Technologie');
INSERT INTO category (name) values ('Sport');
INSERT INTO category (name) values ('Autre');

--insertion dans la table service
INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (1,true,'ce cours traite les sujets de Bac algèbre et analyse, les fonctions et Arithemetique',false,5,5,'analyse,algèbre,fonction,bac','Cours de Mathématique',1,'toto@insa-cvl.fr');

INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (2,TRUE,'ce cours parle de la mecanique quantique, mecanique du fluide et le nucleaire',FALSE,3,7,'mecanique,nucleaire','Cours de Physique',1,'toto@insa-cvl.fr');

INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (3,false,'ce cours de chimie est destination des eleves du Bac, il traite de la chimie organique',FALSE,10,7,'bac,chimie','Cours de Chimie',1,'toto@insa-cvl.fr');

INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (4,true,'mise à niveau des outils offices, bureautique de miscrosof office',FALSE,3,5,'word,excel','Cours informatique',1,'sam@insa-cvl.fr');

INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (5,false,'apprendre la programmer la reconnaissance faciale',FALSE,4,10,'IA,programmation','Formatique sur IA',2,'sam@insa-cvl.fr');

INSERT INTO service (id,status,description,done,max,price,tags,title,category_id,provider_id) values (6,true,'je repaire les pc de type, hp, lenovo, gammeur',FALSE,1,8,'pc,hp,lenovo','reparation de PC',2,'sam@insa-cvl.fr');

