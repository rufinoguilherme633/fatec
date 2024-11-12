create database comercio_de_alimentos; 
use comercio_de_alimentos; 
-- Criação das tabelas
create table cliente(
  id_cliente int primary key auto_increment,
  nome varchar(45),
  telefone varchar(45),
  email varchar(45)
);

create table pagamento(
  id_pagamento int primary key auto_increment,
  forma_pagamento varchar(45)
);

create table vendedor(
  id_vendedor int primary key auto_increment,
  nome varchar(45)
);

create table venda(
  id_venda int primary key auto_increment,
  data date,
  id_cliente int,
  id_pagamento int,
  id_vendedor int,
  foreign key(id_cliente) references cliente(id_cliente) on delete cascade,
  foreign key(id_pagamento) references pagamento(id_pagamento) on delete cascade ,
  foreign key (id_vendedor) references vendedor(id_vendedor) on delete cascade
);
create table categoria(
  id_categoria int primary key auto_increment,
  nome varchar(45)
);

create table fornecedor(
  id_fornecedor int primary key auto_increment,
  cnpj varchar(45),
  nome varchar(45)
);

create table produto(
  id_produto int primary key auto_increment,
  nome varchar(45),
  preco decimal(10,2),
  quantidade_estoque int,
  id_categoria int,
  id_fornecedor int,
  foreign key(id_categoria) references categoria(id_categoria) on delete cascade,
  foreign key(id_fornecedor) references fornecedor(id_fornecedor) on delete cascade 
);

 

create table vendedor_has_produto(
  id_venda int,
  id_produto int,
  foreign key(id_venda) references venda(id_venda) on delete cascade,
  foreign key(id_produto) references produto(id_produto) on delete cascade
);


insert into cliente (nome, telefone, email) values 
('João Silva', '123456789', 'joao.silva@email.com'),
('Maria Oliveira', '987654321', 'maria.oliveira@email.com'),
('Carlos Santos', '456789123', 'carlos.santos@email.com'),
('Ana Souza', '789123456', 'ana.souza@email.com'),
('Bruno Lima', '321654987', 'bruno.lima@email.com'),
('Fernanda Costa', '654321987', 'fernanda.costa@email.com'),
('Paulo Mendes', '147258369', 'paulo.mendes@email.com'),
('Mariana Almeida', '963852741', 'mariana.almeida@email.com'),
('Ricardo Pereira', '852963741', 'ricardo.pereira@email.com'),
('Beatriz Rocha', '369258147', 'beatriz.rocha@email.com');

insert into pagamento (forma_pagamento) values 
('Cartão de Crédito'),
('Cartão de Débito'),
('Dinheiro'),
('Pix'),
('Boleto'),
('Transferência Bancária'),
('Cheque'),
('Cartão de Crédito - Parcelado'),
('Cartão de Débito - Parcelado'),
('Pagamento Online');

insert into vendedor (nome) values 
('Lucas Fernandes'),
('Patrícia Mendes'),
('Renato Silva'),
('Cláudia Gomes'),
('Fernando Almeida'),
('Carla Ramos'),
('André Souza'),
('Larissa Carvalho'),
('Daniel Rocha'),
('Juliana Lima');

insert into venda (data, id_cliente, id_pagamento, id_vendedor) values 
('2024-11-01', 1, 1, 1),
('2024-11-02', 2, 2, 2),
('2024-11-03', 3, 3, 3),
('2024-11-04', 4, 4, 4),
('2024-11-05', 5, 5, 5),
('2024-11-06', 6, 6, 6),
('2024-11-07', 7, 7, 7),
('2024-11-08', 8, 8, 8),
('2024-11-09', 9, 9, 9),
('2024-11-10', 10, 10, 10);

insert into categoria (nome) values 
('Eletrônicos'),
('Móveis'),
('Roupas'),
('Alimentos'),
('Brinquedos'),
('Esportes'),
('Beleza'),
('Livros'),
('Ferramentas'),
('Automotivo');

insert into fornecedor (cnpj, nome) values 
('12345678000101', 'Fornecedor A'),
('23456789000102', 'Fornecedor B'),
('34567890000103', 'Fornecedor C'),
('45678900000104', 'Fornecedor D'),
('56789000000105', 'Fornecedor E'),
('67890000000106', 'Fornecedor F'),
('78900000000107', 'Fornecedor G'),
('89000000000108', 'Fornecedor H'),
('90000000000109', 'Fornecedor I'),
('01000000000110', 'Fornecedor J');

insert into produto (nome, preco, quantidade_estoque, id_categoria, id_fornecedor) values 
('TV 4K', 2500.00, 10, 1, 1),
('Sofá 3 Lugares', 1500.00, 5, 2, 2),
('Camiseta', 50.00, 100, 3, 3),
('Arroz 5kg', 20.00, 200, 4, 4),
('Boneca', 30.00, 50, 5, 5),
('Bola de Futebol', 80.00, 30, 6, 6),
('Shampoo', 15.00, 40, 7, 7),
('Livro de Ficção', 40.00, 60, 8, 8),
('Martelo', 25.00, 15, 9, 9),
('Pneu', 200.00, 20, 10, 10);

insert into vendedor_has_produto (id_venda, id_produto) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

select cliente.nome as 'cliente',pagamento.forma_pagamento,vendedor.nome as 'vendedor', produto.nome as 'produto', produto.preco from
	vendedor_has_produto 
	inner join venda as venda on vendedor_has_produto.id_venda = venda.id_venda
	inner join cliente on cliente.id_cliente = venda.id_cliente
	inner join pagamento on pagamento.id_pagamento = venda.id_pagamento
	inner join vendedor on vendedor.id_vendedor= venda.id_vendedor
	inner join produto as produto on produto.id_produto = vendedor_has_produto.id_produto;


update produto set preco = 5000.00 where id_produto = 1;
update produto set quantidade_estoque = 5 where id_produto = 1;

select preco from produto where id_produto= 1;
select quantidade_estoque from produto where id_produto = 1;

select * from venda;


delete from venda where id_venda = 10;

select * from venda;

delete from venda where id_venda= 9;