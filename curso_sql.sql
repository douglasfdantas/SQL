# CRIANDO A ESTRUTURA DE UM BANCO DE DADOS (EXERCÍCIO 1)

CREATE DATABASE curso_sql;
USE curso_sql;
CREATE TABLE tipo 
(
    cod INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(45) NOT NULL,
    PRIMARY KEY (cod)
);

CREATE TABLE instrutor
(
	cod INT UNSIGNED NOT NULL AUTO_INCREMENT,
    instrutor VARCHAR(45) NOT NULL,
    telefone INT NOT NULL,
    PRIMARY KEY (cod)
);
CREATE TABLE curso 
(
	cod int unsigned not null auto_increment,
    curso varchar(45) not null, 
    tipo int unsigned not null, 
    instrutor int unsigned not null,
    valor double not null default '0',
    PRIMARY KEY (cod),
    CONSTRAINT fk_curso_tipo FOREIGN KEY (tipo) REFERENCES tipo (cod),
    CONSTRAINT fk_curso_instrutor FOREIGN KEY (instrutor) REFERENCES instrutor (cod)
);
CREATE TABLE aluno
(
	cod int unsigned not null auto_increment,
    aluno varchar(60) not null,
    endereço varchar(100) not null,
    email varchar(100) not null,
    PRIMARY KEY (cod)
);
CREATE TABLE pedido
(
	cod int unsigned not null auto_increment,
    aluno int unsigned not null,
    datah int unsigned not null,
    hora int unsigned not null,
    PRIMARY KEY (cod),
    CONSTRAINT fk_pedido_aluno FOREIGN KEY (aluno) REFERENCES aluno(cod)
);
CREATE TABLE pedido_detalhe
(
	pedido int unsigned not null,
    curso int unsigned not null,
    valor double unsigned not null default '0',
    CONSTRAINT fk_pedido_detalhe_pedido FOREIGN KEY (pedido) REFERENCES pedido(cod),
    CONSTRAINT fk_pedido_detalhe_curso FOREIGN KEY (curso) REFERENCES curso(cod)
);

# CORREÇÃO DO EXERCÍCIO 1
ALTER TABLE tipo CHANGE COLUMN tipo tipo VARCHAR(32) NOT NULL;

ALTER TABLE instrutor CHANGE COLUMN instrutor instrutor VARCHAR(64) NOT NULL;

ALTER TABLE instrutor CHANGE COLUMN telefone telefone VARCHAR(9) NOT NULL;

 ALTER TABLE curso CHANGE COLUMN curso curso varchar(64) not null;
 
ALTER TABLE aluno CHANGE COLUMN aluno aluno varchar(64) not null;

ALTER TABLE aluno CHANGE COLUMN endereço endereço varchar(230) not null;

ALTER TABLE aluno CHANGE COLUMN email email varchar(128) not null;

ALTER TABLE pedido CHANGE COLUMN datah datahora datetime not null;

ALTER TABLE pedido_detalhe CHANGE COLUMN valor valor double not null default '0';

# FAZENDO ALTERAÇÕES NO BD (EXERCÍCIO 2)
ALTER TABLE aluno ADD data_nascimento varchar(10);

ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date;

CREATE INDEX aluno ON aluno (aluno);

ALTER TABLE instrutor ADD email varchar(100);

CREATE INDEX instrutor ON curso (instrutor);

ALTER TABLE instrutor DROP email;