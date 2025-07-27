
create database vivo;

use vivo;

create table colaboradores(
id int auto_increment primary key,
name varchar(100),
RE varchar(12)
);

create table equipamentos(
id int auto_increment primary key,
name varchar(30),
descricao text
);

create table serviços(
id int primary key auto_increment,
name varchar(20),
descricao text
);

create table estado(
id int auto_increment primary key,
name varchar(20),
sigla varchar(2)
);

CREATE TABLE cidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(50),
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

create table contato(
id int auto_increment primary key,
name varchar(50),
telefone varchar(12)
);

create table clientes(
id int auto_increment primary key,
name varchar(100),
endereço_id int,
FOREIGN KEY (endereço_id) REFERENCES endereco(id),
contato_id int,
FOREIGN KEY (contato_id) REFERENCES contato(id)
);

SELECT * FROM clientes AS c
JOIN endereco AS e ON e.id = c.endereco_id
JOIN contato AS cc ON cc.id = c.contato_id;

SELECT
  c.id AS cliente_id,
  c.name AS cliente_nome,
  e.rua,
  e.numero,
  e.complemento,
  cc.name AS contato_nome,
  cc.telefone
FROM clientes AS c
JOIN endereco AS e ON e.id = c.endereco_id
JOIN contato AS cc ON cc.id = c.contato_id;