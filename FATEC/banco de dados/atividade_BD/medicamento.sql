create database medicamento ;
use medicamento ;
##drop database medicamento ;
create table cliente(
id_cliente int not null primary key auto_increment,
nome varchar(100) not null,
endereco varchar(100) not null,
idade int not null,
sexo char(1)
);

create table dependente(
id_dependendte int not null primary key auto_increment,
nome varchar(100) not null,
cpf varchar(10),
id_cliente int,
foreign key(id_cliente) references cliente(id_cliente)
);


create table funcionario(
id_funcionario int not null primary key auto_increment,
nome varchar(100) not null,
cpf varchar(20),
matricula int
);

create table produto(
id_produto int not null primary key auto_increment,
descricao varchar(100) not null,
valor numeric(10,2)
);



create table venda(
id_venda int primary key auto_increment,
data date,
quantidade int,
id_cliente int,
id_produto int,
id_funcionario int,
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_produto) references produto(id_produto),
foreign key(id_funcionario) references funcionario(id_funcionario)
);

-- Inserções para a tabela cliente
INSERT INTO cliente (nome, endereco, idade, sexo) VALUES
('João Silva', 'Rua das Flores, 123', 30, 'M'),
('Maria Oliveira', 'Avenida Central, 456', 25, 'F'),
('Carlos Souza', 'Rua João XXIII, 789', 40, 'M'),
('Ana Pereira', 'Rua da Paz, 101', 35, 'F'),
('Fernanda Costa', 'Avenida Brasil, 202', 28, 'F'),
('Paulo Santos', 'Rua do Sol, 303', 50, 'M'),
('Juliana Lima', 'Avenida Dom Pedro, 404', 22, 'F'),
('Ricardo Martins', 'Rua das Acácias, 505', 33, 'M'),
('Tatiane Rocha', 'Rua das Orquídeas, 606', 29, 'F'),
('Eduardo Almeida', 'Rua dos Pássaros, 707', 45, 'M');

-- Inserções para a tabela dependente
INSERT INTO dependente (nome, cpf, id_cliente) VALUES
('Pedro Silva', '1234567890', 1),
('Joana Silva', '0987654321', 2),
('Lucas Souza', '2345678901', 3),
('Clara Pereira', '3456789012', 4),
('Gabriel Costa', '4567890123', 5),
('Luiza Santos', '5678901234', 6),
('Rafael Lima', '6789012345', 7),
('Ana Martins', '7890123456', 8),
('Miguel Rocha', '8901234567', 9),
('Beatriz Almeida', '9012345678', 10);

-- Inserções para a tabela funcionario
INSERT INTO funcionario (nome, cpf, matricula) VALUES
('José Barbosa', '12345678901', 1001),
('Carla Nunes', '23456789012', 1002),
('Ricardo Silva', '34567890123', 1003),
('Luciana Costa', '45678901234', 1004),
('Fernando Oliveira', '56789012345', 1005),
('Patrícia Lima', '67890123456', 1006),
('Marcos Souza', '78901234567', 1007),
('Juliana Rocha', '89012345678', 1008),
('Rafael Martins', '90123456789', 1009),
('Eduarda Almeida', '01234567890', 1010);

-- Inserções para a tabela produto
INSERT INTO produto (descricao, valor) VALUES
('Produto A', 10.99),
('Produto B', 25.50),
('Produto C', 33.75),
('Produto D', 15.00),
('Produto E', 7.20),
('Produto F', 100.00),
('Produto G', 150.25),
('Produto H', 5.50),
('Produto I', 80.40),
('Produto J', 40.00);


-- Inserções para a tabela venda
INSERT INTO venda (data, quantidade, id_cliente, id_produto, id_funcionario) VALUES
('2024-11-01', 2, 1, 1, 1),
('2024-11-02', 1, 2, 2, 2),
('2024-11-03', 3, 3, 3, 3),
('2024-11-04', 4, 4, 4, 4),
('2024-11-05', 2, 5, 5, 5),
('2024-11-06', 1, 6, 6, 6),
('2024-11-07', 5, 7, 7, 7),
('2024-11-08', 2, 8, 8, 8),
('2024-11-09', 1, 9, 9, 9),
('2024-11-10', 3, 10, 10, 10);



select venda.data, venda.quantidade,cliente.nome, produto.descricao, funcionario.nome from venda 
inner join cliente as cliente on venda.id_cliente = cliente.id_cliente
inner join produto as produto on venda.id_produto = produto.id_produto
inner join funcionario as funcionario on venda.id_funcionario = funcionario.id_funcionario;

update cliente set nome = 'Gabriele silva' where id_cliente= 2;
select * from cliente where id_cliente = 2;


update funcionario set nome = 'Talita' where id_funcionario= 2;
select * from funcionario where id_funcionario = 2;

select * from funcionario ;

DELETE FROM venda WHERE id_funcionario = 10;
DELETE FROM funcionario WHERE id_funcionario = 10;


