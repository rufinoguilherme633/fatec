create database aluguel_veiculo;
use aluguel_veiculo;

create table estado(
	id_estado int primary key auto_increment,
    nome_estado varchar(30) not null
);

create table municipio(
	id_municipio int primary key auto_increment,
    nome_do_municipio varchar(150) not null,
    id_estado int not null,
    foreign key(id_estado) references estado(id_estado)
);
create table marca(
	id_veiculo int  primary key auto_increment,
    marca varchar(45) not null
);
create table categoria(
	id_categoria int  primary key auto_increment,
    categoria_veiculo varchar(45) not null
);

create table proprietario(
	id_dono int primary key auto_increment,
    nome_dono varchar(50) not null,
    endereco varchar(100) not null,
    bairro varchar(45) not null,
    cpf varchar(45) not null,
    telefone varchar(45),
    rg varchar(45),
    data_nascimento date not null
);

create table veiculo(
	id_veiculo int primary key auto_increment,
    placa_veiculo varchar(10),
    ano_veiculo date,
    id_dono int,
    id_marca int,
    id_municipio int,
    id_categoria int,
    foreign key(id_dono) references proprietario(id_dono),
    foreign key(id_marca) references marca(id_veiculo),
    foreign key(id_municipio) references municipio(id_municipio),
    foreign key(id_categoria) references categoria(id_categoria)
);

INSERT INTO estado (nome_estado) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Minas Gerais'),
('Bahia'),
('Rio Grande do Sul'),
('Paraná'),
('Pernambuco'),
('Ceará'),
('Santa Catarina'),
('Goiás');


INSERT INTO municipio (nome_do_municipio, id_estado) VALUES
('São Paulo', 1),
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Salvador', 4),
('Porto Alegre', 5),
('Curitiba', 6),
('Recife', 7),
('Fortaleza', 8),
('Florianópolis', 9),
('Goiânia', 10);

INSERT INTO marca (marca) VALUES
('Fiat'),
('Volkswagen'),
('Chevrolet'),
('Toyota'),
('Honda'),
('Ford'),
('Renault'),
('Nissan'),
('Hyundai'),
('Peugeot');


INSERT INTO categoria (categoria_veiculo) VALUES
('Sedan'),
('Hatch'),
('SUV'),
('Picape'),
('Crossover'),
('Perua'),
('Esportivo'),
('Compacto'),
('Conversível'),
('Luxo');


INSERT INTO proprietario (nome_dono, endereco, bairro, cpf, telefone, rg, data_nascimento) VALUES
('Carlos Silva', 'Rua A, 123', 'Centro', '123.456.789-00', '9999-8888', 'MG1234567', '1980-05-10'),
('Luciana Pereira', 'Rua B, 456', 'Jardim das Flores', '987.654.321-00', '9999-7777', 'SP9876543', '1990-11-20'),
('João Santos', 'Rua C, 789', 'Vila Nova', '111.222.333-44', '9999-6666', 'RJ1236547', '1995-08-25'),
('Fernanda Lima', 'Rua D, 101', 'Bairro Esperança', '222.333.444-55', '9999-5555', 'MG9871236', '1993-02-15'),
('Rafael Alves', 'Rua E, 202', 'Bairro Jardim', '333.444.555-66', '9999-4444', 'SP6543219', '1998-03-10'),
('Aline Costa', 'Rua F, 303', 'Alto da Serra', '444.555.666-77', '9999-3333', 'RJ7654321', '1992-09-12'),
('Lucas Oliveira', 'Rua G, 404', 'Vila Progresso', '555.666.777-88', '9999-2222', 'SP5432108', '1994-11-30'),
('Juliana Rocha', 'Rua H, 505', 'Bairro Novo', '666.777.888-99', '9999-1111', 'MG1239876', '1991-07-05'),
('Gabriel Martins', 'Rua I, 606', 'Jardim das Palmeiras', '777.888.999-00', '9999-0000', 'RJ8765432', '1989-04-20'),
('Sofia Silva', 'Rua J, 707', 'Centro Comercial', '888.999.000-11', '9999-9999', 'SP3216549', '1996-01-18');


INSERT INTO veiculo (placa_veiculo, ano_veiculo, id_dono, id_marca, id_municipio, id_categoria) VALUES
('ABC1234', '2018-01-01', 1, 1, 1, 1),
('DEF5678', '2020-05-10', 2, 2, 2, 2),
('GHI9101', '2021-07-15', 3, 3, 3, 3),
('JKL2345', '2019-03-20', 4, 4, 4, 4),
('MNO6789', '2022-11-12', 5, 5, 5, 5),
('PQR3456', '2020-09-05', 6, 6, 6, 6),
('STU7890', '2023-01-30', 7, 7, 7, 7),
('VWX1234', '2021-04-22', 8, 8, 8, 8),
('YZA5678', '2017-12-01', 9, 9, 9, 9),
('BCD2345', '2024-06-10', 10, 10, 10, 10);

select * from veiculo;

select 
	placa_veiculo, 
	ano_veiculo, 
    proprietario.nome_dono, 
    marca.marca,
    municipio.nome_do_municipio as 'municipio',
	estado.nome_estado as 'estado',
    categoria.categoria_veiculo
    from veiculo 
    inner join proprietario as proprietario on veiculo.id_dono = proprietario.id_dono
    inner join marca as marca on veiculo.id_marca = marca.id_veiculo
    inner join municipio on veiculo.id_municipio = municipio.id_municipio
	inner join estado on municipio.id_estado = estado.id_estado
    inner join categoria on veiculo.id_categoria = categoria.id_categoria;
    
    
delete from veiculo where id_veiculo = 1;
delete from veiculo where id_veiculo = 2;
select * from veiculo;

update veiculo set placa_veiculo = 'ECC-2828' where id_veiculo = 3;
select * from veiculo;

update proprietario set nome_dono = 'Guilherm erufono Campos' where id_dono = 1;

select * from proprietario where id_dono = 1;



