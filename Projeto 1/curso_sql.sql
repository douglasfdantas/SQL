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

ALTER TABLE pedido DROP hora;

# FAZENDO ALTERAÇÕES NO BD (EXERCÍCIO 1)
ALTER TABLE aluno ADD data_nascimento varchar(10);

ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date;

CREATE INDEX aluno ON aluno (aluno);

ALTER TABLE instrutor ADD email varchar(100);

CREATE INDEX instrutor ON curso (instrutor);

ALTER TABLE instrutor DROP email;

# INSERINDO DADOS NO BD (EXERCÍCIO 2)
INSERT INTO tipo (cod, tipo) VALUES (1, 'Banco de dados');
INSERT INTO tipo (tipo) VALUES ('Programação');
INSERT INTO tipo (tipo) VALUES ('Modelagem de dados');

INSERT INTO instrutor (cod, instrutor, telefone) VALUES (1, 'Nome1', '1111-1111');
INSERT INTO instrutor (instrutor, telefone) VALUES ('Nome2', '1212-1212');

INSERT INTO curso (cod, curso, tipo, instrutor, valor) VALUES (1, 'Java Fundamentos', 2, 2, 270);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('Java Avançado', 2, 2, 330);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('SQL Completo', 1, 1, 170);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('Php Básico', 2, 1, 270);

INSERT INTO aluno (cod, aluno, endereço, email) VALUES (1, 'Nome1', 'Rua 1', 'nome1@dominio.com.br');
INSERT INTO aluno (aluno, endereço, email) VALUES ('Nome2', 'Rua 2', 'nome2@dominio.com.br');
INSERT INTO aluno (aluno, endereço, email) VALUES ('Nome3', 'Rua 3', 'nome3@dominio.com.br');
INSERT INTO aluno (aluno, endereço, email) VALUES ('Nome4', 'Rua 4', 'nome4@dominio.com.br');
INSERT INTO aluno (aluno, endereço, email) VALUES ('Nome5', 'Rua 5', 'nome5@dominio.com.br');
INSERT INTO aluno (aluno, endereço, email) VALUES ('Nome6', 'Rua 6', 'nome6@dominio.com.br');

INSERT INTO pedido (cod, aluno, datahora) VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO pedido (aluno, datahora ) VALUES (2, '2010-04-15 14:36:21');
INSERT INTO pedido (aluno, datahora ) VALUES (3, '2010-04-16 11:17:45');
INSERT INTO pedido (aluno, datahora ) VALUES (4, '2010-04-17 14:27:22');
INSERT INTO pedido (aluno, datahora ) VALUES (5, '2010-04-18 11:18:19');
INSERT INTO pedido (aluno, datahora ) VALUES (6, '2010-04-19 13:47:35');
INSERT INTO pedido (aluno, datahora ) VALUES (6, '2010-04-20 18:13:44');

INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (1, 1, 270); 
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (1, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 1, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (2, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (3, 4, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (4, 2, 330);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (4, 4, 270);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (5, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (6, 3, 170);
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (7, 4, 270);

# MANIPULANDO OS DADOS

SELECT * FROM aluno; 			# Exibir todas as informações de todos os alunos
SELECT curso FROM curso;		# Exibir somente o título de cada curso

# Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200
SELECT curso, valor FROM curso WHERE valor > 200; 

# Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 e menor que 300
SELECT curso, valor FROM curso WHERE valor > 200 and valor < 300;
SELECT curso, valor FROM curso WHERE valor BETWEEN 200 and 330;

# Exibir as informações da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010
SELECT * FROM pedido WHERE datahora > '2010-04-15' and datahora < '2010-04-19';
SELECT * FROM pedido WHERE datahora BETWEEN '2010-04-15' and '2010-04-19';

SELECT * FROM pedido WHERE date(datahora) = '2010-04-15';

# ALTERANDO INFORMAÇÔES
UPDATE aluno SET endereço = 'Av. Brasil 1111' WHERE cod = 1;
UPDATE aluno SET email = 'name1@outrodominio.com.br' WHERE cod = 1;

# Aumente em 10% o valor dos cursos abaixo de 300
SET SQL_SAFE_UPDATES = 0;	# Necessário para permitir alterar todos os valores de uma tabela
UPDATE curso SET valor  = ROUND(valor * 1.1, 2) WHERE valor < 300;

#Altere o nome do curso de Php Básico para Php Fundamentos
UPDATE curso SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';


# RELACIONAMENTOS USANDO JOIN E CRIANDO VISÕES (EXERCÍCIO 4)

# Exiba uma lista com os títulos dos cursos e o tipo de curso ao lado
SELECT a.curso, b.tipo FROM curso a JOIN tipo b ON a.tipo = b.cod;

# Exiba uma lista com os títulos dos cursos, tipo do curso, nome do instrutor responsável e telefone;
SELECT a.curso, b.tipo, c.instrutor, c.telefone 
FROM curso a JOIN tipo b ON a.tipo = b.cod 
JOIN instrutor c ON c.cod = a.instrutor;

# Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido
SELECT a.cod, a.datahora, b.curso FROM pedido a 
JOIN pedido_detalhe b ON b.pedido = a.cod;

# Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido
SELECT a.cod, a.datahora, c.curso FROM pedido a 
JOIN pedido_detalhe b ON b.pedido = a.cod 
LEFT JOIN curso c ON c.cod = b.curso;

# Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido
SELECT a.cod, a.datahora, b.aluno, d.curso FROM pedido a JOIN aluno b ON b.cod = a.aluno
LEFT JOIN pedido_detalhe c ON c.pedido = a.cod
LEFT JOIN curso d ON d.cod = c.curso;


