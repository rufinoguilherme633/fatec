create database lava_rapido;
use lava_rapido;

##drop database lava_rapido;
create table carro(
	id_carro int primary key auto_increment,
    descricao varchar(100) not null,
    placa varchar(20) not null,
    modelo int,
    ano int
);

create table cliente(
	id_cliente int primary key auto_increment,
	nome varchar(100) not null,
    telefone varchar(20) not null,
    cpf varchar(20) not null,
    id_carro int,
    foreign key( id_carro) references carro( id_carro)
);


create table tipo_lavagem(
	id_tipo_lavagem int primary key auto_increment,
	descricao varchar(50) not null,
    valor numeric(10,2) not null
);

create table funcionario(
	id_funcionario int primary key auto_increment,
	nome varchar(50) not null,
    matricula int not null
);

create table lavagem(
	id_lavagem int primary key auto_increment,
	data date not null,
    id_cliente int,
    id_funcionario  int,
    id_tipo_lavagem int not null,
    foreign key(id_cliente) references cliente(id_cliente) ON DELETE CASCADE,
	foreign key(id_funcionario) references funcionario(id_funcionario) ON DELETE CASCADE,
	foreign key(id_tipo_lavagem) references tipo_lavagem(id_tipo_lavagem) ON DELETE CASCADE	

);

INSERT INTO carro (descricao, placa, modelo, ano) VALUES
('Sedan Preto', 'ABC1234', 2020, 2019),
('SUV Branco', 'DEF5678', 2021, 2020),
('Hatch Vermelho', 'GHI9101', 2018, 2018),
('Picape Azul', 'JKL2345', 2019, 2017),
('Conversível Amarelo', 'MNO6789', 2022, 2021),
('Coupe Preto', 'PQR1234', 2019, 2019),
('SUV Cinza', 'STU5678', 2020, 2019),
('Minivan Prata', 'VWX9101', 2021, 2020),
('Caminhonete Verde', 'YZA2345', 2018, 2018),
('Sedan Azul', 'BCD6789', 2019, 2018);


INSERT INTO cliente (nome, telefone, cpf, id_carro) VALUES
('João Silva', '11999999999', '12345678901', 1),
('Maria Oliveira', '11988888888', '23456789012', 2),
('Carlos Santos', '11977777777', '34567890123', 3),
('Ana Costa', '11966666666', '45678901234', 4),
('Pedro Almeida', '11955555555', '56789012345', 5),
('Lucas Pereira', '11944444444', '67890123456', 6),
('Fernanda Ramos', '11933333333', '78901234567', 7),
('Mariana Souza', '11922222222', '89012345678', 8),
('Felipe Lima', '11911111111', '90123456789', 9),
('Rafael Duarte', '11900000000', '01234567890', 10);


INSERT INTO funcionario (nome, matricula) VALUES
('Carlos Moreira', 1001),
('Joana Prado', 1002),
('Lucas Farias', 1003),
('Pedro Matos', 1004),
('Juliana Cunha', 1005),
('Felipe Rocha', 1006),
('Ana Sousa', 1007),
('Marcos Oliveira', 1008),
('Fernanda Ramos', 1009),
('Bruno Silva', 1010);

INSERT INTO tipo_lavagem (descricao, valor) VALUES
('Lavagem Completa', 100.00),
('Lavagem Simples', 50.00),
('Lavagem e Enceramento', 120.00),
('Lavagem Interna', 80.00),
('Lavagem Externa', 40.00),
('Lavagem com Polimento', 150.00),
('Lavagem Automática', 30.00),
('Lavagem a Seco', 90.00),
('Lavagem Premium', 200.00),
('Lavagem Básica', 25.00);

INSERT INTO lavagem (data, id_cliente, id_funcionario, id_tipo_lavagem) VALUES
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

select lavagem.data, cliente.nome as 'cliente', funcionario.nome as 'funcionario responsavel', tipo_lavagem.descricao,tipo_lavagem.valor from lavagem 
	inner join cliente as cliente on lavagem.id_cliente = cliente.id_cliente
    inner join funcionario as funcionario on lavagem.id_funcionario = funcionario.id_funcionario
    inner join tipo_lavagem as tipo_lavagem on lavagem.id_tipo_lavagem = tipo_lavagem.id_tipo_lavagem;
    
update tipo_lavagem set valor = 90 where id_tipo_lavagem = 1;
select valor from tipo_lavagem where id_tipo_lavagem =1;

delete from cliente where id_cliente in (10,9);

select * from cliente;

select * from lavagem where id_lavagem = 7;

select lavagem.data, cliente.nome as 'cliente', funcionario.nome as 'funcionario responsavel', tipo_lavagem.descricao,tipo_lavagem.valor from lavagem 
	inner join cliente as cliente on lavagem.id_cliente = cliente.id_cliente
    inner join funcionario as funcionario on lavagem.id_funcionario = funcionario.id_funcionario
    inner join tipo_lavagem as tipo_lavagem on lavagem.id_tipo_lavagem = tipo_lavagem.id_tipo_lavagem where id_lavagem = 7;
    
update lavagem set id_funcionario = 6 where id_lavagem = 7 ;
select id_funcionario from lavagem where id_lavagem = 7;
