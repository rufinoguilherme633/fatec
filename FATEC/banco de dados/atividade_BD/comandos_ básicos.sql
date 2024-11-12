show databases;
create database livraria;
use livraria;
/* MySQL retornará o nome do banco de dados atualmente em uso */

SELECT DATABASE();




create table editora(
cnpj varchar(14) primary key,
nome varchar(100),
telefone varchar(10)
);

create table autor(
id_autor int auto_increment primary key,
nome varchar(100),
telefone varchar(14)
);

create table livro(
id int auto_increment primary key ,
titulo varchar(50),
preco decimal(10,2),
fk_autor int,
fk_editora varchar(14),
foreign key(fk_autor) references autor(id_autor),
foreign key(fk_editora) references editora(cnpj)
);

INSERT INTO editora (cnpj, nome, telefone) VALUES
("12345678000199", "Editora Exemplo", "1198765432"),
("98765432000111", "Editora Saber", "2191234567"),
("23456789000188", "Editora Conhecimento", "3199876543");

INSERT INTO autor (nome, telefone) VALUES
("Machado de Assis", "21987654321"),
("Clarice Lispector", "21912345678"),
("Jorge Amado", "21987651234"),
("Cecília Meireles", "21923456789"),
("Carlos Drummond de Andrade", "21956789012");
desc livro;
insert into livro(titulo,preco,fk_autor,fk_editora) values("biblia",40.75,1,"12345678000199");
select * from livro;
## insert into livro(titulo) values ("a cabana");

## insert into livro(titulo,preco) values ("Dracula", 20.00),("jack o estripador", 40.00),("frankstein",30);

select * from livro;

##update livro set preco= 10.00 where id = 2;

## delete from livro where id = 5; 

##alter table livro add paginas int;
##alter table livro drop column paginas;
desc livro;
##insert into livro(titulo,preco) values("biblia",40.75 );

##ALTER TABLE livro ADD UNIQUE (titulo);

select livro.id, livro.titulo,livro.preco, autor.nome, editora.nome from livro inner join autor on livro.fk_autor = autor.id_autor inner join editora on livro.fk_editora = editora.cnpj;