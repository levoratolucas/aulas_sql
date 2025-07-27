
-------------------- criando data base ---------------
create database teste;
-------------------------------------------------------
-------------------- usando data base ---------------
use teste;
-------------------------------------------------------

-------------------- criando uma tabela ---------------
create table users(
id int primary key auto_increment,
name varchar(100),
age int
);
-------------------------------------------------------

----------------- apresentando a tabela ---------------
select * from users;
-------------------------------------------------------

-------------------- inserindo dados na tabela ---------------
INSERT INTO users(name, age) VALUES ('Gabriela Falcão', 27);
INSERT INTO users(name, age) VALUES ('Nicolas Nick', 32);
INSERT INTO users(name, age) VALUES ('Izabella Santos', 25);
INSERT INTO users(name, age) VALUES ('Gustavo Santiago', 29);
INSERT INTO users(name, age) VALUES ('Caroline Carol', 31);
INSERT INTO users(name, age) VALUES ('Giovana Sgarbe', 26);
INSERT INTO users(name, age) VALUES ('Genau Lopes', 40);
------------------------------------------------------------

-------------------- atualizando informações ---------------
update users set age = 99 where id = 7;
-------------------------------------------------------
-- ---------------------- desabilitando proteção update em massa----- 
SET SQL_SAFE_UPDATES = 0;
-- -------------------------------------------------------


