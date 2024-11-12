show databases;
create database academia;
use academia;

#drop database academia;
/*------------------------ CRIAÇÂO DA TABELA INSTRUTOR--------------------------*/
create table instrutor(
	rg BIGINT primary key,
    nome varchar(45) not null,
    nascimento date not null,
    titulacao varchar(45) not null,
    telefone varchar(45)
);
/*------------------------ CRIAÇÂO DA TABELA ATIVIDADE--------------------------*/

create table atividade(
	id int primary key auto_increment,
    atividade varchar(45) not null
);

/*------------------------ CRIAÇÂO DA TABELA ALUNO--------------------------*/

create table aluno(
	matricula int primary key,
	data_matricula date not null,
	nome varchar(45) not null,
	endereco varchar(45) not null,
	telefone varchar(45),
	nascimento date,
	altura float not null,
	peso float not null
	##id_turma int,
	##foreign key(id_turma) references turma(id)
);

/*------------------------ CRIAÇÂO DA TABELA MONITOR--------------------------*/

create table monitor(
	id_aluno int primary key,
    foreign key(id_aluno) references aluno(matricula)
);

/*------------------------ CRIAÇÂO DA TABELA TURMA--------------------------*/

create table turma(
	id int primary key auto_increment ,
    quantidade_aluno int,
    horario_aula datetime,
    duracao time,
    date_inicio date,
    data_fim date,
    id_atividade int,
    id_instrutor BIGINT,
    id_monitor int default null,
    foreign key(id_atividade) references atividade(id),
    foreign key(id_instrutor) references instrutor(rg),
    foreign key(id_monitor) references monitor(id_aluno)
);


alter table aluno add column id_turma int, add foreign key(id_turma) references turma(id);

/*------------------------ CRIAÇÂO DA TABELA REGISTRO--------------------------*/

create table registro(
	id_registro int primary key,
    id_aluno int not null,
    id_turma int not null,
    ausencia int,
    foreign key(id_aluno) references aluno(matricula),
	foreign key(id_turma) references turma(id)
); 



/*----------------------------- Inserções Atividade -----------------------------------*/
insert into atividade(atividade)values
('Kung Fu'),
('Yoga'),
('Muay Thai'),
('Boxe'),
('Pilates'),
('Crossfit'),
('Taekwondo'),
('Natação'),
('Dança'),
('Musculação');

select * from atividade;
/*----------------------------- Inserções Instrutor -----------------------------------*/
INSERT INTO instrutor (rg, nome, nascimento, titulacao, telefone) VALUES
(41684032055, 'Lucas Fernandes da Silva', '1985-04-12', 'Mestre em Kung Fu', '9999-8888'),
(19240784039, 'Mariana Oliveira Santos', '1986-07-15', 'Instrutora de Yoga', '9999-7777'),
(30957912080, 'Pedro Henrique Costa Lima', '1990-03-22', 'Especialista em Boxe', '9999-6666'),
(83562419067, 'Júlia Martins Souza', '1988-11-05', 'Mestre em Jiu Jitsu', '9999-5555'),
(27906147004, 'Rafael Almeida Pereira', '1987-06-18', 'Instrutor de Muay Thai', '9999-4444'),
(65819033013, 'Ana Clara Rodrigues Rocha', '1992-02-03', 'Professora de Pilates', '9999-3333'),
(47128351098, 'Gabriel Carvalho Ribeiro', '1989-09-10', 'Mestre em Taekwondo', '9999-2222'),
(17280645072, 'Beatriz Gonçalves Mendes', '1991-05-25', 'Instrutora de Natação', '9999-1111'),
(53010976001, 'Felipe Araújo Teixeira', '1993-12-02', 'Especialista em Crossfit', '9999-0000'),
(90423198026, 'Laura Ferreira Machado', '1994-01-18', 'Instrutora de Dança', '8888-7777');


/*------------------------ INSERÇÂO NA TABELA TURMA --------------------------*/

INSERT INTO turma (quantidade_aluno, horario_aula, duracao, date_inicio, data_fim, id_atividade, id_instrutor) VALUES
( 10, '2024-05-10 08:00:00', '01:30:00', '2024-05-01', '2024-12-01', 1, 41684032055),  -- Kung Fu
( 15, '2024-05-10 10:00:00', '01:30:00', '2024-05-01', '2024-12-01', 2, 19240784039 ),  -- Yoga
( 12, '2024-05-10 14:00:00', '01:30:00', '2024-05-01', '2024-12-01', 3, 30957912080),  -- Muay Thai
( 20, '2024-05-11 08:00:00', '01:45:00', '2024-05-01', '2024-12-01', 4, 83562419067),  -- Jiu Jitsu
( 18, '2024-05-11 10:00:00', '01:30:00', '2024-05-01', '2024-12-01', 5, 27906147004),  -- Pilates
( 14, '2024-05-11 14:00:00', '02:00:00', '2024-05-01', '2024-12-01', 6, 65819033013),  -- Taekwondo
( 25, '2024-05-12 08:00:00', '01:30:00', '2024-05-01', '2024-12-01', 7, 47128351098),  -- Natação
( 10, '2024-05-12 10:00:00', '01:45:00', '2024-05-01', '2024-12-01', 8, 17280645072),  -- Crossfit
( 20, '2024-05-12 14:00:00', '02:00:00', '2024-05-01', '2024-12-01', 9, 53010976001),  -- Dança
( 30, '2024-05-13 08:00:00', '01:30:00', '2024-05-01', '2024-12-01', 10, 90423198026); -- Boxe

/*------------------------ INSERÇÂO NA TABELA ALUNO --------------------------*/

INSERT INTO aluno (matricula, data_matricula, nome, endereco, telefone, nascimento, altura, peso, id_turma) VALUES 
(12345, '2024-01-01', 'Carlos Souza', 'Rua A, 123', '9999-8888', '2000-05-10', 1.75, 70.5, 1),
(12346, '2024-02-10', 'Lucia Pereira', 'Rua B, 456', '9999-7777', '1998-11-20', 1.62, 55.0, 2),
(12347, '2024-03-15', 'João Santos', 'Rua C, 789', '9999-6666', '2001-08-25', 1.80, 80.0, 3),
(12348, '2024-04-10', 'Fernanda Lima', 'Rua D, 101', '9999-5555', '2002-02-15', 1.68, 60.0, 1),
(12349, '2024-05-05', 'Rafael Alves', 'Rua E, 202', '9999-4444', '1999-03-10', 1.75, 72.5, 2),
(12350, '2024-06-01', 'Aline Costa', 'Rua F, 303', '9999-3333', '2000-09-12', 1.70, 65.0, 3),
(12351, '2024-07-20', 'Lucas Oliveira', 'Rua G, 404', '9999-2222', '2001-11-30', 1.78, 74.0, 1),
(12352, '2024-08-15', 'Juliana Rocha', 'Rua H, 505', '9999-1111', '1998-07-05', 1.65, 58.0, 2),
(12353, '2024-09-10', 'Gabriel Martins', 'Rua I, 606', '9999-0000', '2000-04-20', 1.82, 76.0, 3),
(12354, '2024-10-05', 'Sofia Silva', 'Rua J, 707', '9999-9999', '2001-01-18', 1.60, 50.0, 1);



/*------------------------ INSERÇÂO NA TABELA MONITOR --------------------------*/

INSERT INTO monitor (id_aluno) VALUES
(12345),
(12346),
(12347),
(12348),
(12349),
(12350),
(12351),
(12352),
(12353),
(12354);

/*------------------------ TESTES --------------------------*/

select * from monitor;

select * from turma;

/*------------------------ ATUALIZAÇÂO DA TABELA TURMA --------------------------*/

update turma set id_monitor = 12345 where id = 1;
update turma set id_monitor = 12346 where id = 2;
update turma set id_monitor = 12347 where id = 3;
update turma set id_monitor = 12348 where id = 4;
update turma set id_monitor = 12349 where id = 5;
update turma set id_monitor = 12350 where id = 6;
update turma set id_monitor = 12351 where id = 7;
update turma set id_monitor = 12352 where id = 8;
update turma set id_monitor = 12353 where id = 9;
update turma set id_monitor = 12354 where id = 10;

/*------------------------ INNER JOIN --------------------------*/

select atividade.atividade, turma.duracao, instrutor.nome as 'nome instrutor' , aluno.nome as 'nome instrutor'
	from turma 
    inner join atividade as atividade on turma.id_atividade = atividade.id
    inner join instrutor as instrutor on turma.id_instrutor =  instrutor.rg
    inner join monitor as monitor on turma.id_monitor = monitor.id_aluno
    inner join aluno as aluno on monitor.id_aluno = aluno.matricula;

/*------------------------ DELETANDO REGISTROS DE TURMA--------------------------*/
delete from turma where id = 10;
delete from turma where id = 9;
select * from turma;



/*------------------------ INSERÇÃO NA TABELA REGISTRO --------------------------*/
INSERT INTO registro (id_registro, id_aluno, id_turma, ausencia) VALUES
(1, 12345, 1, 0),  
(2, 12346, 2, 1), 
(3, 12347, 3, 0),  
(4, 12348, 1, 1),  
(5, 12349, 2, 0),  
(6, 12350, 3, 1),  
(7, 12351, 1, 0),  
(8, 12352, 2, 1),  
(9, 12353, 3, 0),  
(10, 12354, 1, 1); 

SELECT * FROM registro;
