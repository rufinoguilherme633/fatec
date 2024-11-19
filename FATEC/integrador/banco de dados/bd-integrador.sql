create database fatec_ride;
use fatec_ride;
#drop database fatec_ride;
create table curso(
	id_curso int primary key auto_increment,
	nome varchar(25) not null
);
create table status(
	id_status int primary key auto_increment,
	status varchar(25) not null
);
create table motorista(
	id_motorista int primary key auto_increment,
    nome varchar(25) not null,
    sobrenome varchar(25) not null,
    email varchar(60) not null unique,
    senha varchar(100) not null,
    matricula varchar(20) not null,
    cnh varchar(20) not null,
    genero ENUM('Feminino', 'Masculino') NOT NULL,
    foto VARCHAR(255),
    id_curso int ,
    foreign key(id_curso) references curso(id_curso)
);


create table passageiro(
	id_passageiro int primary key auto_increment,
    nome varchar(25) not null,
    sobrenome varchar(25) not null,
    email varchar(60) not null unique,
    senha varchar(100) not null,
    matricula varchar(20) not null,
	genero ENUM('Feminino', 'Masculino') NOT NULL,
    foto VARCHAR(255) ,
	id_curso int ,
    foreign key(id_curso) references curso(id_curso)
);

create table veiculo(
	placa varchar(30) primary key unique,
    cor varchar(30) not null,
    capacidade int,
    id_motorista int,
    foreign key(id_motorista) references motorista(id_motorista)
);

CREATE TABLE rota (
    id_rota INT PRIMARY KEY AUTO_INCREMENT,
    coordenadas_partida GEOMETRY, -- Para armazenar as coordenadas de partida como GEOMETRY
    coordenadas_destino GEOMETRY, -- Para armazenar as coordenadas de destino como GEOMETRY
    vagas_disponiveis INT NOT NULL,
    id_motorista INT,
    FOREIGN KEY(id_motorista) REFERENCES motorista(id_motorista)
);



CREATE TABLE pontoEncontro (
    ponto_encontro_rota INT PRIMARY KEY AUTO_INCREMENT,
    coordenadas_partida GEOMETRY,  -- Coordenadas de partida
    coordenadas_destino GEOMETRY,  -- Coordenadas de destino
    id_motorista INT,
    id_status INT,
    id_passageiro INT,
    FOREIGN KEY(id_motorista) REFERENCES motorista(id_motorista),
    FOREIGN KEY(id_status) REFERENCES status(id_status),
    FOREIGN KEY(id_passageiro) REFERENCES passageiro(id_passageiro)
);

-- Inserindo dados na tabela curso
INSERT INTO curso (nome) VALUES 
('Engenharia de Software'),
('Sistemas de Informação'),
('Gestão de TI'),
('Ciência da Computação');

-- Inserindo dados na tabela status
INSERT INTO status (status) VALUES 
('Ativo'),
('Inativo'),
('Aguardando'),
('Cancelado');

-- Inserindo dados na tabela motorista
INSERT INTO motorista (nome, sobrenome, email, senha, matricula, cnh, genero, foto, id_curso) VALUES
('João', 'Silva', 'joao.silva@email.com', 'senha123', '123456789', 'ABC1234', 'Masculino', 'foto_joao.jpg', 1),
('Maria', 'Oliveira', 'maria.oliveira@email.com', 'senha456', '987654321', 'XYZ9876', 'Feminino', 'foto_maria.jpg', 2);

-- Inserindo dados na tabela passageiro
INSERT INTO passageiro (nome, sobrenome, email, senha, matricula, genero, foto, id_curso) VALUES
('Carlos', 'Santos', 'carlos.santos@email.com', 'senha789', '1122334455', 'Masculino', 'foto_carlos.jpg', 1),
('Ana', 'Lima', 'ana.lima@email.com', 'senha012', '9988776655', 'Feminino', 'foto_ana.jpg', 3);

-- Inserindo dados na tabela veiculo
INSERT INTO veiculo (placa, cor, capacidade, id_motorista) VALUES
('ABC1234', 'Preto', 4, 1),
('XYZ9876', 'Branco', 5, 2);

-- Inserindo dados na tabela rota
INSERT INTO rota (coordenadas_partida, coordenadas_destino, vagas_disponiveis, id_motorista) 
VALUES 
(ST_GeomFromText('POINT(23.5505 -46.6333)'), ST_GeomFromText('POINT(23.5655 -46.6543)'), 2, 1),
(ST_GeomFromText('POINT(22.9035 -43.2096)'), ST_GeomFromText('POINT(22.9084 -43.2065)'), 3, 2);

SELECT 
    ST_AsText(coordenadas_partida) AS coordenadas_partida,
    ST_AsText(coordenadas_destino) AS coordenadas_destino
FROM rota;
-- Inserindo dados na tabela pontoEncontro
INSERT INTO pontoEncontro (coordenadas_partida, coordenadas_destino, id_motorista, id_status, id_passageiro) 
VALUES 
(ST_GeomFromText('POINT(23.5505 -46.6333)'), ST_GeomFromText('POINT(23.5655 -46.6543)'), 1, 1, 1),
(ST_GeomFromText('POINT(22.9035 -43.2096)'), ST_GeomFromText('POINT(22.9084 -43.2065)'), 2, 2, 2);


SELECT 
    ST_AsText(coordenadas_partida) AS coordenadas_partida,
    ST_AsText(coordenadas_destino) AS coordenadas_destino
FROM pontoEncontro;

